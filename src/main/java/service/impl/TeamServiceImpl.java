package service.impl;

import dao.MessageDAO;
import dao.PersonDao;
import dao.PersonTeamMapping;
import dao.TeamDAO;
import domain.Message;
import domain.Person;
import domain.Team;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.TeamService;
import util.ConstantUtil;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by martsforever on 2016/1/25.
 */
@Service("TeamService")
public class TeamServiceImpl implements TeamService {

    @Autowired
    private TeamDAO teamDao;
    @Autowired
    private PersonDao personDao;
    @Autowired
    PersonTeamMapping personTeamMapping;
    @Autowired
    MessageDAO messageDAO;

    @Override
    public void add(Team team) {
        teamDao.add(team);
    }

    @Override
    public boolean isTeamNameExist(String name) {
        if (teamDao.retriveByName(name) == null)
            return false;
        else return true;
    }

    @Override
    public List<Team> retriveByPageNumber(String number) {
        int pageNumber = Integer.parseInt(number);
        return teamDao.retriveByPageNumber(pageNumber);
    }

    @Override
    public int retriveCounts() {
        return teamDao.retriveCounts();
    }

    @Override
    public int retrivePageNumber() {
        return teamDao.retrivePageNumber();
    }

    @Override
    public Map<String, Integer> getStartAndEnd(int targetPage, int pageNumber) {
        int start = targetPage - 2;
        int end = targetPage + 2;

        if (pageNumber > 5) {
            while (start < 1) {
                start++;
                end++;
            }
            while (end > pageNumber) {
                start--;
                end--;
            }
        } else {
            start = 1;
            end = pageNumber;
        }
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", start);
        map.put("end", end);
        return map;
    }

    @Override
    public String applyToJoinGroup(int groupId, int personId) {
        JSONObject jsonObject = new JSONObject();
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

            String applyStatus, reason;
            Team team = teamDao.retriveById(groupId);
            Person person = personDao.retriveById(personId);
            Person receiver = personDao.retriveById(team.getMinisterId());//消息接受者

            if (team.getMinisterId() == personId) {
                applyStatus = "fail";
                reason = "您已经是队长，无需再申请加入该队伍！";
            } else if (team.getCurrentSize() >= team.getTeamSize()) {
                applyStatus = "fail";
                reason = "队伍人数已满！";
            } else if ((new Date().after(dateFormat.parse(team.getExpiryDate())))) {
                applyStatus = "fail";
                reason = "该团队的截止日期已过！";
            } else if (isMenber(team, personId)) {
                applyStatus = "fail";
                reason = "您已经是该团队的成员，无须再申请！";
            } else {
                applyStatus = "success";
                joinGroup(team, person, receiver);
                reason = "等待队长通过审核！";
            }

            jsonObject.put("applyStatus", applyStatus);
            jsonObject.put("reason", reason);
            return jsonObject.toString();

        } catch (ParseException e) {
            System.out.println("日期转换错误");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Team> retriveRelesasedTeamsById(int personId) {

        return teamDao.retriveRelesasedTeamsById(personId);
    }

    @Override
    public Team retriveById(int id) {
        return teamDao.retriveById(id);
    }

    /**
     * 判断是否为团队成员
     *
     * @param team
     * @param personId
     */
    public boolean isMenber(Team team, int personId) {
        Set<Person> persons = team.getPersonList();
        for (Person person : persons) {
            if (person.getId() == personId) return true;
        }
        return false;
    }

    /**
     * 加入团队
     *
     * @param team
     * @param person
     */
    public void joinGroup(Team team, Person person, Person receiver) {
        Message message = new Message();
        message.setPersonId(person.getId());
        message.setPersonName(person.getName());
        message.setTeamId(team.getId());
        message.setTeamName(team.getName());
        message.setMessageType(Message.APPLY_TO_JOIN_MSG);
        message.setOperatable(1);
        message.setReceiverId(receiver.getId());
        SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }


    /**
     * 将用户请出团队
     *
     * @param teamId
     * @param personId
     */
    public void getRidOfGroup(int teamId, int personId) {
        Person person = personDao.retriveById(personId);
        Team team = teamDao.retriveById(teamId);
        personTeamMapping.deleteMapping(team, person);
    }

    @Override
    public void removeTeam(int teamId) {
        teamDao.delete(teamDao.retriveById(teamId));
    }

    @Override
    public List<Team> retriveByPageAndKey(int targetPage, String key) {
        return teamDao.retriveByPageAndKey(targetPage, key);
    }

    @Override
    public int retrivePageNumberByKey(String key) {
        return teamDao.retrivePageNumberByKey(key);
    }

    @Override
    public String acceptApplication(int teamId, int personId) {

        JSONObject jsonObject = new JSONObject();
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

            String applyStatus, reason;
            Team team = teamDao.retriveById(teamId);
            Person person = personDao.retriveById(personId);

            if (team.getCurrentSize() >= team.getTeamSize()) {
                applyStatus = "fail";
                reason = "队伍人数已满！";
            } else if ((new Date().after(dateFormat.parse(team.getExpiryDate())))) {
                applyStatus = "fail";
                reason = "该团队的截止日期已过！";
            } else if (isMenber(team, personId)) {
                applyStatus = "fail";
                reason = "已经是该团队的成员，无须再加入！";
            } else {
                applyStatus = "success";
                team.setCurrentSize(team.getCurrentSize() + 1);
                teamDao.update(team);
                personTeamMapping.addMapping(team, person);
                reason = "操作成功！";
            }

            jsonObject.put("applyStatus", applyStatus);
            jsonObject.put("reason", reason);
            return jsonObject.toString();

        } catch (ParseException e) {
            System.out.println("日期转换错误");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Team team) {
        teamDao.update(team);
    }
}
