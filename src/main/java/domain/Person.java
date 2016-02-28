package domain;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by martsforever on 2016/1/14.
 */
@Entity
@Table(name = "person", catalog = "sta")
public class Person {
    private int id;
    private String name;
    private String classes;
    private String mail;
    private String account;
    private String password;
    private String tel;
    private int isMenber;
    private String department;
    private String qq;
    private String wechat;
    private String introduce;
    private String job;
    private String protrait;
    private String hobby;
    private String speciality;


    private Set<Team> teamList;//所参加的团队
    private Set<Department> departments;//如果是科协成员的话，这里是所任职的部门
    private Set<Lecture> lectures;//报名参加的讲座

    public Person() {
    }

    public Person(String name, String classes, String mail, String account, String password, String tel, int isMenber, String qq, String wechat, String introduce, String job, String protrait, String hobby, String speciality) {
        this.name = name;
        this.classes = classes;
        this.mail = mail;
        this.account = account;
        this.password = password;
        this.tel = tel;
        this.isMenber = isMenber;
        this.qq = qq;
        this.wechat = wechat;
        this.introduce = introduce;
        this.job = job;
        this.protrait = protrait;
        this.hobby = hobby;
        this.speciality = speciality;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", classes='" + classes + '\'' +
                ", mail='" + mail + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", isMenber=" + isMenber +
                ", qq='" + qq + '\'' +
                ", wechat='" + wechat + '\'' +
                ", introduce='" + introduce + '\'' +
                ", job='" + job + '\'' +
                ", protrait='" + protrait + '\'' +
                ", hobby='" + hobby + '\'' +
                ", speciality='" + speciality + '\'' +
                '}';
    }

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "department")
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "classes")
    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    @Column(name = "mail")
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Column(name = "account")
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "tel")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Column(name = "isMenber")
    public int getIsMenber() {
        return isMenber;
    }

    public void setIsMenber(int isMenber) {
        this.isMenber = isMenber;
    }

    @Column(name = "qq")
    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    @Column(name = "wechat")
    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    @Column(name = "introduce")
    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Column(name = "job")
    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Column(name = "protrait")
    public String getProtrait() {
        return protrait;
    }

    public void setProtrait(String protrait) {
        this.protrait = protrait;
    }

    @Column(name = "hobby")
    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    @Column(name = "speciality")
    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }


    @ManyToMany(mappedBy = "personList", cascade = CascadeType.MERGE)
    public Set<Team> getTeamList() {
        return teamList;
    }

    public void setTeamList(Set<Team> teamList) {
        this.teamList = teamList;
    }

    @ManyToMany(mappedBy = "menberList", cascade = CascadeType.MERGE)
    public Set<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(Set<Department> departments) {
        this.departments = departments;
    }

    @ManyToMany(mappedBy = "personList", cascade = CascadeType.MERGE)
    public Set<Lecture> getLectures() {
        return lectures;
    }

    public void setLectures(Set<Lecture> lectures) {
        this.lectures = lectures;
    }
}
