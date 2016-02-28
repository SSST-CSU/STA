package service.impl;

import dao.MessageDAO;
import domain.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.MessageService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by martsforever on 2016/2/14.
 */
@Service("MessageService")
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDAO messageDAO;

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

    @Override
    public void applyToJoinMsg(int personId, String personName, int teamId, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamId(teamId);
        message.setTeamName(teamName);
        message.setMessageType(Message.APPLY_TO_JOIN_MSG);
        message.setOperatable(1);
        message.setReceiverId(receiverId);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void newComerMsg(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.NEW_COMER_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void quitMsg(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.QUIT_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void applyToJoinFailMsg(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.APPLY_TO_JOIN_FAIL_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void applyToJoinSuccessMsg(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.APPLY_TO_JOIN_SUCCESS_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void lectureMsg(String occurName, String occurPlace, String occurTime, int receiverId) {
        Message message = new Message();
        message.setOccurName(occurName);
        message.setOccurPlace(occurPlace);
        message.setOccurTime(occurTime);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.LECTURE_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void departmentMsg(String occurName, String occurPlace, String occurTime, int receiverId) {
        Message message = new Message();
        message.setOccurName(occurName);
        message.setOccurPlace(occurPlace);
        message.setOccurTime(occurTime);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.DEPARTMENT_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void disbandedReleaseTeam(String teamName, int receiverId) {
        Message message = new Message();
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.DISBANDED_RELEASE_TEAM);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void disbandedJoinTeam(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.DIABANDED_JOIN_TEAM);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void releaseTeam(String teamName, int revceiverId) {
        Message message = new Message();
        message.setTeamName(teamName);
        message.setReceiverId(revceiverId);
        message.setMessageType(Message.RELEASE_TEAM);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void updateTeam(String teamName, int receiverId) {
        Message message = new Message();
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.UPDATE_TEAM);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public List<Message> retriveByPage(int targetPage, int personId) {

        return messageDAO.retriveByPageAndPersonId(targetPage, personId);
    }

    @Override
    public int retrivePageNumberByPageAndPersonId(int personId) {
        return messageDAO.retrivePageNumberByPageAndPersonId(personId);
    }

    @Override
    public Message retriveById(int id) {
        return messageDAO.get(Message.class, id);
    }

    @Override
    public void update(Message message) {
        messageDAO.update(message);
    }

    @Override
    public void removePerson(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.REMOVE_PERSON);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    @Override
    public void putAwayByTeam(int personId, String personName, String teamName, int receiverId) {
        Message message = new Message();
        message.setPersonId(personId);
        message.setPersonName(personName);
        message.setTeamName(teamName);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.PUT_AWAY_BY_TEAM);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }

    /**
     * 管理员对用户发送消息
     *
     * @param msgContent
     * @param receiverId
     */
    @Override
    public void adminMsg(String msgContent, int receiverId) {
        Message message = new Message();
        message.setMsgContent(msgContent);
        message.setReceiverId(receiverId);
        message.setMessageType(Message.ADMIN_MSG);
        message.setTime(dateFormat.format(new Date()));
        messageDAO.add(message);
    }


}
