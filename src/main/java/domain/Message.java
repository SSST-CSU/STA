package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/2/13.
 */
@Entity
@Table(name = "message", catalog = "sta")
public class Message {

    private int id;//消息id

    private int personId;//用户id
    private String personName;//用户名称

    private int operatable;//用户是否已操作，比如允许/拒绝另外的用户加入团队

    private int teamId;//团队id
    private String teamName;//团队名称

    private String occurName;//讲座名称，或者面试的部门名称
    private String occurTime;//讲座或部门面试时间
    private String occurPlace;//讲座或者部门面试地点

    private String time;//消息创建时间
    private int receiverId;//消息接受者的id

    private String msgContent;//消息内容

    /**
     * 消息类型，目前一共有7种
     * XXX 申请加入您的团队 XXX， 允许 拒绝 ------------》》》》》》》》》》》申请者名称，申请者id，团队名称，团队id
     * XXX 加入您的团队XXX，快去看看吧！-------------》》》》》》》》》》》》》加入者名称，团队名称，加入者id
     * XXX 退出您的团队XXX。------------------------》》》》》》》》》》》》》》退出者名称，团队名称，退出者id
     * XXX 拒绝了您申请加入团队XXX。-----------------------》》》》》》》》》》》团队队长名称，团队名称，队长id
     * XXX已经通过了您的请求，您已经是XXX团队中的一员了，快去看看吧。------------》》》》》》》》》》》队长名称，团队名称。队长id
     * 您成功申请参加讲座：XXX，请记得于XXX到XXX参加讲座----------------------》》》》》》》》》》讲座名称，讲座时间、地点
     * 你成功申请加入科协XXX部门，请于XXX到XXX参加面试-----------------------》》》》》》》》》》》部门名称，面试时间，地点
     * XXX团队已经被您解散------》》》》》》》》》》团队名称
     * XXX团队已经被XXX解散------》》》》》》》》》》队长名称，队长id，团队名称
     * 您成功创建团队XXX--------》》》》》》》》》》团队名称
     * 您成功更改XXX团队的团队信息---------》》》》》团队名称
     * XXX已经被请出队伍------------》》》》》》》退出者id，退出者名称，团队名称
     * 您已经被XXX请出队伍------------》》》》》》》队长id，队长名称名称，团队名称
     */
    private int messageType;

    public static final int APPLY_TO_JOIN_MSG = 1;
    public static final int NEW_COMER_MSG = 2;
    public static final int QUIT_MSG = 3;
    public static final int APPLY_TO_JOIN_FAIL_MSG = 4;
    public static final int APPLY_TO_JOIN_SUCCESS_MSG = 5;
    public static final int LECTURE_MSG = 6;
    public static final int DEPARTMENT_MSG = 7;
    public static final int DISBANDED_RELEASE_TEAM = 8;
    public static final int DIABANDED_JOIN_TEAM = 9;
    public static final int RELEASE_TEAM = 10;
    public static final int UPDATE_TEAM = 11;
    public static final int REMOVE_PERSON = 12;
    public static final int PUT_AWAY_BY_TEAM = 13;
    public static final int ADMIN_MSG = 14;

    public Message() {
    }

    @GeneratedValue
    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "personId")
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    @Column(name = "personName")
    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    @Column(name = "teamId")
    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    @Column(name = "teamName")
    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Column(name = "occurName")
    public String getOccurName() {
        return occurName;
    }

    public void setOccurName(String occurName) {
        this.occurName = occurName;
    }

    @Column(name = "occurTime")
    public String getOccurTime() {
        return occurTime;
    }

    public void setOccurTime(String occurTime) {
        this.occurTime = occurTime;
    }

    @Column(name = "occurPlace")
    public String getOccurPlace() {
        return occurPlace;
    }

    public void setOccurPlace(String occurPlace) {
        this.occurPlace = occurPlace;
    }

    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Column(name = "receiverId")
    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    @Column(name = "messageType")
    public int getMessageType() {
        return messageType;
    }

    public void setMessageType(int messageType) {
        this.messageType = messageType;
    }

    @Column(name = "msgContent")
    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", personId=" + personId +
                ", personName='" + personName + '\'' +
                ", operatable=" + operatable +
                ", teamId=" + teamId +
                ", teamName='" + teamName + '\'' +
                ", occurName='" + occurName + '\'' +
                ", occurTime='" + occurTime + '\'' +
                ", occurPlace='" + occurPlace + '\'' +
                ", time='" + time + '\'' +
                ", receiverId=" + receiverId +
                ", msgContent='" + msgContent + '\'' +
                ", messageType=" + messageType +
                '}';
    }

    @Column(name = "operatable")
    public int getOperatable() {
        return operatable;
    }

    public void setOperatable(int operatable) {
        this.operatable = operatable;
    }
}
