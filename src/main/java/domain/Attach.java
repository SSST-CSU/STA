package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/2/24.
 */
@Entity
@Table(name = "attach", catalog = "sta")
public class Attach {
    private int id;
    private String mark;
    private String type;
    private String content;

    public static String PRESIDIUM = "主席团";//主席团
    public static String SYNTHETIC = "综合事务部";//综合事务部
    public static String T_EXCHANG_PROMOTE = "技术交流与推广部";//技术交流与推广部
    public static String EVENTS = "赛事部";//赛事部
    public static String PROJECT = "项目部";//项目部
    public static String PUBLIC_RELATIONS = "公共关系部";//公共关系部
    public static String INNOVATION = "创新创业项目管理中心";//创新创业项目管理中心
    public static String R_D = "研发中心";//研发中心

    public static String TYPE_RESPONSIBILITY = "responsibility";
    public static String TYPE_ACHIEVEMENT = "achievement";


    public Attach() {
    }

    @Override
    public String toString() {
        return "Attach{" +
                "id=" + id +
                ", mark='" + mark + '\'' +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
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

    @Column(name = "mark")
    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
