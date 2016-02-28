package domain;

import javax.persistence.*;

/**
 * Created by martsforever on 2016/2/26.
 */
@Entity
@Table(name = "applyForm", catalog = "sta")
public class ApplyForm {

    int id;
    int personId;
    String portrait;

    String name;//姓名
    String sex;//性别
    String political;//政治面貌
    String place;//籍贯
    String classes;//班级
    String studentId;//学号
    String qq;//QQ
    String tel;//电话号码
    String oldJob;//曾任职务
    String swap;//是否服从调剂
    String first;//第一志愿
    String second;//第二志愿
    String award;//曾获奖项
    String achievement;//突出业绩
    String advice;//建议
    String attach;//备注

    public ApplyForm() {
    }

    @Override
    public String toString() {
        return "ApplyForm{" +
                "id=" + id +
                ", personId=" + personId +
                ", portrait='" + portrait + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", political='" + political + '\'' +
                ", place='" + place + '\'' +
                ", classes='" + classes + '\'' +
                ", studentId='" + studentId + '\'' +
                ", qq='" + qq + '\'' +
                ", tel='" + tel + '\'' +
                ", oldJob='" + oldJob + '\'' +
                ", swap='" + swap + '\'' +
                ", first='" + first + '\'' +
                ", second='" + second + '\'' +
                ", award='" + award + '\'' +
                ", achievement='" + achievement + '\'' +
                ", advice='" + advice + '\'' +
                ", attach='" + attach + '\'' +
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

    @Column(name = "portrait")
    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }

    @Column(name = "personId")
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Column(name = "political")
    public String getPolitical() {
        return political;
    }

    public void setPolitical(String political) {
        this.political = political;
    }

    @Column(name = "place")
    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Column(name = "classes")
    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    @Column(name = "studentId")
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Column(name = "qq")
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Column(name = "tel")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Column(name = "oldjob")
    public String getOldJob() {
        return oldJob;
    }

    public void setOldJob(String oldJob) {
        this.oldJob = oldJob;
    }

    @Column(name = "swap")
    public String getSwap() {
        return swap;
    }

    public void setSwap(String swap) {
        this.swap = swap;
    }

    @Column(name = "first")
    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    @Column(name = "second")
    public String getSecond() {
        return second;
    }

    public void setSecond(String second) {
        this.second = second;
    }

    @Column(name = "award")
    public String getAward() {
        return award;
    }

    public void setAward(String award) {
        this.award = award;
    }

    @Column(name = "achievement")
    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    @Column(name = "advice")
    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    @Column(name = "attach")
    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }
}
