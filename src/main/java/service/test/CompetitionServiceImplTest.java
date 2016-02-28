package service.test;

import domain.Competition;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.CompetitionService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CompetitionServiceImplTest extends TestCase {

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    CompetitionService competitionService = (CompetitionService) applicationContext.getBean("CompetitionService");

    @Test
    public void testAdd() throws Exception {
        for (int i=1;i<=34;i++){
            Competition competition = new Competition();
            competition.setName("比赛"+i);
            competition.setTime(dateFormat.format(new Date()));
            competition.setIntroduce("没有介绍"+1);
            competition.setLink("htt://www.baidu.com");
            competitionService.add(competition);
        }
    }

    @Test
    public void testUpdate() throws Exception {
        Competition competition = competitionService.retriveById("74");
        System.out.println(competition.toString());
        competition.setLink("#");
        competitionService.update(competition);
    }

    public void testDelete() throws Exception {

    }

    public void testRetriveById() throws Exception {

    }

    public void testRetriveCounts() throws Exception {

    }

    public void testRetriveCountsByKey() throws Exception {

    }

    public void testRetriveByPageNumber() throws Exception {

    }

    public void testRetriveByPageAndKey() throws Exception {

    }

    public void testRetrivePageNumber() throws Exception {

    }

    public void testRetrivePageNumberOfKey() throws Exception {

    }

    public void testGetStartAndEnd() throws Exception {

    }
}