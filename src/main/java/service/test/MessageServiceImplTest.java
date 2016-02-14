package service.test;

import domain.Person;
import domain.Team;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.MessageService;
import service.PersonService;
import service.TeamService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class MessageServiceImplTest extends TestCase {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    MessageService messageService = (MessageService) applicationContext.getBean("MessageService");
    PersonService personService = (PersonService) applicationContext.getBean("PersonService");
    TeamService teamService = (TeamService) applicationContext.getBean("TeamService");

    @Test
    public void testApplyToJoinMsg() throws Exception {

        Person person = personService.retriveById(49);
        Team team = teamService.retriveById(134);

        messageService.applyToJoinMsg(person.getId(), person.getName(), team.getId(), team.getName(), 50);
    }

    @Test
    public void testNewComerMsg() throws Exception {
        Person person = personService.retriveById(49);
        Team team = teamService.retriveById(134);
        messageService.newComerMsg(person.getId(), person.getName(), team.getName(), 50);
    }

    @Test
    public void testQuitMsg() throws Exception {
        Person person = personService.retriveById(49);
        Team team = teamService.retriveById(134);
        messageService.quitMsg(person.getId(),person.getName(),team.getName(),50);
    }

    @Test
    public void testApplyToJoinFailMsg() throws Exception {
        Person person = personService.retriveById(49);
        Team team = teamService.retriveById(134);
        messageService.applyToJoinFailMsg(person.getId(),person.getName(),team.getName(),50);
    }

    @Test
    public void testApplyToJoinSuccessMsg() throws Exception {
        Person person = personService.retriveById(49);
        Team team = teamService.retriveById(134);
        messageService.applyToJoinSuccessMsg(person.getId(),person.getName(),team.getName(),50);
    }

    @Test
    public void testLectureMsg() throws Exception {
        messageService.lectureMsg("大数据讲座","世纪A101","2015-10-15",50);
    }

    @Test
    public void testDepartmentMsg() throws Exception {
        messageService.departmentMsg("研发中心","世纪A101","2015-10-15",50);
    }

    @Test
    public void testDisbandedReleaseTeam() throws Exception {
        messageService.disbandedReleaseTeam("我要开始标车啦！",50);
    }

    @Test
    public void testDisbandedJoinTeam() throws Exception {
        Person person = personService.retriveById(49);
        messageService.disbandedJoinTeam(person.getId(),person.getName(),"哈哈",50);
    }

    @Test
    public void testReleaseTeam() throws Exception {
        messageService.releaseTeam("hello",50);
    }

    @Test
    public void testUpdateTeam() throws Exception {
        messageService.updateTeam("yellow",50);
    }

    @Test
    public void testRetriveByPage() throws Exception {
    }
}