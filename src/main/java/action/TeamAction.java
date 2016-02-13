package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Person;
import domain.Team;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PersonService;
import service.TeamService;
import util.ConstantUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/25.
 */
@Namespace("")
@ParentPackage("struts-default")
public class TeamAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    TeamService teamService;
    PersonService personService;

    private Team releaseTeam;

    public TeamAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        teamService = (TeamService) applicationContext.getBean("TeamService");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response = httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }

    public Team getReleaseTeam() {
        return releaseTeam;
    }

    public void setReleaseTeam(Team releaseTeam) {
        this.releaseTeam = releaseTeam;
    }

    @Action(value = "retriveTeamByPage", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/groupList.jsp")})
    public String retriveTeamByPage() throws Exception {

        List<Team> teams;
        int pageNumber;
        String targetPage = request.getParameter("targetPage");
        String key = request.getParameter("key");

        if (key != null && !key.equals("")) {
            teams = teamService.retriveByPageAndKey(Integer.parseInt(targetPage), key);
            pageNumber = teamService.retrivePageNumberByKey(key);
        } else {
            teams = teamService.retriveByPageNumber(targetPage);
            pageNumber = teamService.retrivePageNumber();
        }
        if (teams.size() > 0) {

            List<Person> ministers = new ArrayList<Person>();
            for (Team team : teams) {
                Person minister = personService.retriveById(team.getMinisterId());
                ministers.add(minister);
            }

            Map<String, Integer> startAndEnd = teamService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);
            session.put("startAndEnd", startAndEnd);
            session.put("ministers", ministers);//每个团队的队长
            session.put("targetPage", targetPage);//目标页的号码
            session.put("pageNumber", pageNumber);//总页数
            session.put("teams", teams);//团队信息数组
            session.put("key", key);//将搜索关键字放回回话中去
            session.put("retriveStatus", "success");//查询结果
        } else {
            session.put("retriveStatus", "fail");//查询结果
        }
        return SUCCESS;
    }

    @Action(value = "isGroupNameExist")
    public void isGroupNameExist() throws Exception {
        String groupName = request.getParameter("groupName");
        System.out.println(groupName);
        String retriveStatus;
        if (teamService.isTeamNameExist(groupName)) {
            retriveStatus = "yes";
        } else retriveStatus = "no";

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("isGroupNameExist", retriveStatus);

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "releaseGroupInfo")
    public void releaseGroupInfo() throws Exception {
        Person person = (Person) session.get("person");
        System.out.println(person.toString());
//        System.out.println(releaseTeam.toString());
        releaseTeam.setCurrentSize(1);
        SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
        releaseTeam.setPublishTime(dateFormat.format(new Date()));
        releaseTeam.setMinisterId(person.getId());
        teamService.add(releaseTeam);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("releaseStatus", "success");

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "applyToJoinGroup")
    public void applyToJoinGroup() throws Exception {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        String groupId = request.getParameter("groupId");
        Person person = (Person) session.get("person");
        String msg = teamService.applyToJoinGroup(Integer.parseInt(groupId), person.getId());
        if (msg == null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("applyStatus", "fail");
            jsonObject.put("reason", "");
            response.getWriter().write(jsonObject.toString());
        } else response.getWriter().write(msg);
    }

}
