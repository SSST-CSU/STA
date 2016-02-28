package service;

import domain.Message;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by martsforever on 2016/2/14.
 */
@Service()
@Transactional
public interface MessageService {

    /**
     * 向用户发送消息，有人申请加入用户所发布的团队
     *
     * @param personId
     * @param personName
     * @param teamId
     * @param teamName
     */
    public void applyToJoinMsg(int personId, String personName, int teamId, String teamName, int receiverId);

    /**
     * 向用户发送消息，有新的小伙伴加入用户所在的团队
     *
     * @param personId
     * @param personName
     * @param teamName
     */
    public void newComerMsg(int personId, String personName, String teamName, int receiverId);

    /**
     * 向用户发送消息，有小伙伴退出用户所在团队
     *
     * @param personId
     * @param personName
     * @param teamName
     */
    public void quitMsg(int personId, String personName, String teamName, int receiverId);

    /**
     * 向用户发送消息，用户所申请加入的团队拒绝用户加入。
     *
     * @param personId
     * @param personName
     * @param teamName
     */
    public void applyToJoinFailMsg(int personId, String personName, String teamName, int receiverId);

    /**
     * 向用户发送消息，用户所申请加入的团队接受用户加入
     *
     * @param personId
     * @param personName
     * @param teamName
     */
    public void applyToJoinSuccessMsg(int personId, String personName, String teamName, int receiverId);

    /**
     * 向用户发送消息，用户成功申请打牌参加讲座的资格
     *
     * @param occurName
     * @param occurPlace
     */
    public void lectureMsg(String occurName, String occurPlace, String occurTime, int receiverId);

    /**
     * 向用户发送消息，用户成功拿到成为科协成员面试的资格
     *
     * @param occurname
     * @param occurPlace
     * @param occurTime
     */
    public void departmentMsg(String occurname, String occurPlace, String occurTime, int receiverId);

    /**
     * 向用户发送消息，用户成功解散自己发布的团队
     *
     * @param teamName
     * @param receiverId
     */
    public void disbandedReleaseTeam(String teamName, int receiverId);

    /**
     * 向用户发送消息，用户所参加的团队已经被解散
     *
     * @param personId
     * @param PersonName
     * @param teamName
     */
    public void disbandedJoinTeam(int personId, String PersonName, String teamName, int receiverId);

    /**
     * 向用户发送消息，用户成功创建团队
     *
     * @param teamName
     * @param revceiverId
     */
    public void releaseTeam(String teamName, int revceiverId);


    /**
     * 向用户发送消息，用户成功更改团队信息
     *
     * @param teamName
     * @param receiverId
     */
    public void updateTeam(String teamName, int receiverId);

    /**
     * 分页查询用户收到的消息
     *
     * @param targetPage
     * @param personId
     * @return
     */
    public List<Message> retriveByPage(int targetPage, int personId);

    /**
     * 查询根据分页查询得到结果的总页数
     *
     * @param personId
     * @return
     */
    public int retrivePageNumberByPageAndPersonId(int personId);

    /**
     * 根据message的id查询message的信息
     *
     * @param id
     * @return
     */
    public Message retriveById(int id);

    /**
     * 更新message
     *
     * @param message
     */
    public void update(Message message);

    /**
     * 向用户发送消息，id为personid的用户已经被请出队伍
     *
     * @param personId
     * @param personName
     * @param teanName
     * @param receiverId
     */
    public void removePerson(int personId, String personName, String teanName, int receiverId);

    /**
     * 向用户发送消息，有用户被请出队伍
     *
     * @param personId
     * @param personName
     * @param teamName
     * @param receiverId
     */
    public void putAwayByTeam(int personId, String personName, String teamName, int receiverId);

    /**管理员对用户发送消息
     * @param msgContent
     * @param receiverId
     */
    public void adminMsg(String msgContent, int receiverId);

}
