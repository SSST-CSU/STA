package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/2/25.
 */
@Entity
@Table(name = "admessage", catalog = "sta")
public class ADMessage {
    int id;
    int type;//消息类型:有三种：招新，反馈以及提问题
    String content;//消息内容
    int applyFormId;//如果为招新，这里为申请表的id
    String time;//消息发送时间
    int isRead;//是否为已读
    int personId;//发送消息的用户id

    public ADMessage() {
    }

    @Override
    public String toString() {
        return "ADMessage{" +
                "id=" + id +
                ", type=" + type +
                ", content='" + content + '\'' +
                ", applyFormId='" + applyFormId + '\'' +
                ", time='" + time + '\'' +
                ", isRead=" + isRead +
                ", personId=" + personId +
                '}';
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

    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "applyFormId")
    public int getApplyFormId() {
        return applyFormId;
    }

    public void setApplyFormId(int applyFormId) {
        this.applyFormId = applyFormId;
    }

    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Column(name = "isRead")
    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    @Column(name = "personId")
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }
}
