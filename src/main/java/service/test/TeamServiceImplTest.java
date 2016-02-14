package service.test;

import com.fasterxml.jackson.databind.util.JSONPObject;
import domain.Person;
import domain.Team;
import junit.framework.TestCase;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.PersonService;
import service.TeamService;

import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TeamServiceImplTest extends TestCase {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    TeamService teamService = (TeamService) applicationContext.getBean("TeamService");
    PersonService personService = (PersonService) applicationContext.getBean("PersonService");

    @Test
    public void testRetriveByPageNumber() throws Exception {
        System.out.println("hello");
        List<Team> teams = teamService.retriveByPageNumber("1");
        System.out.println(teams.size());
        for (Team team : teams) {
            System.out.println(team.toString());
        }
    }

    @Test
    public void testRetriveCounts() throws Exception {
        System.out.println(teamService.retriveCounts());
    }

    @Test
    public void testAdd() throws Exception {
        for (int i = 1; i <= 10; i++) {

            Person minister = personService.retriveByAccount("zhangsan");

            Team team = new Team();
            team.setName("芒果团队" + i);
            team.setTeamSize(5);
            team.setCurrentSize(0);
            team.setIntroduce("一个专注于帮助聋哑人的大学生团队");
            team.setLogo("#");
            team.setPublishTime(new Date().toString());
            team.setMinisterId(minister.getId());
            teamService.add(team);

        }
    }

    @Test
    public void testIsTeamNameExist() throws Exception {
        boolean isExist = teamService.isTeamNameExist("芒果团队");
        System.out.println(isExist);
    }

    @Test
    public void testRetrivePageNumber() throws Exception {
        System.out.println(teamService.retrivePageNumber());
    }

    @Test
    public void test() {

        int targetPage = 5;
        int pageNumber = 10;

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
    }

    @Test
    public void testRetriveRelesasedTeamsById() throws Exception {
        List<Team> teams = teamService.retriveRelesasedTeamsById(Integer.parseInt("4"));
        for (Team team : teams) {
            System.out.println(team.toString());
        }
    }

    @Test
    public void testJson() {
        Team team = teamService.retriveById(Integer.parseInt("133"));
        Set<Person> groupDetail = (Set<Person>) team.getPersonList();

        List<Person> personIdANdName = new ArrayList<Person>();
        for (Person person1:groupDetail){
            Person person2 = new Person();person2.setId(person1.getId());
            person2.setName(person1.getName());
            personIdANdName.add(person2);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("personIdANdName",personIdANdName);

        System.out.println(jsonObject.toString());

    }

    @Test
    public void testGetRidOfTeam(){
        teamService.getRidOfGroup(1,3);
    }

    @Test
    public void testRemoveTeam(){
        teamService.removeTeam(1);
    }

    @Test
    public void testUpdate(){
        Team team = teamService.retriveById(133);
        team.setCurrentSize(team.getCurrentSize() - 1);
        teamService.update(team);
    }

}