package service.test;

import domain.ADMessage;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.ADMessageService;
import service.CompetitionService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)

public class ADMessageServiceImplTest extends TestCase {

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    ADMessageService adMessageService = (ADMessageService) applicationContext.getBean("ADMessageService");

    @Test
    public void testAdd() throws Exception {

        for (int i = 0; i < 15; i++) {

            ADMessage adMessage = new ADMessage();
            adMessage.setType(0);
            adMessage.setContent("招新"+i);
            adMessage.setTime(dateFormat.format(new Date()));
            adMessage.setIsRead(0);
            adMessageService.add(adMessage);

            ADMessage adMessage1 = new ADMessage();
            adMessage1.setType(1);
            adMessage1.setContent("提问"+i);
            adMessage1.setTime(dateFormat.format(new Date()));
            adMessage1.setIsRead(0);
            adMessageService.add(adMessage1);

            ADMessage adMessage2 = new ADMessage();
            adMessage2.setType(2);
            adMessage2.setContent("反馈"+i);
            adMessage2.setTime(dateFormat.format(new Date()));
            adMessage2.setIsRead(0);
            adMessageService.add(adMessage);
        }
    }

    @Test
    public void testUpdate() throws Exception {
        ADMessage adMessage = adMessageService.retriveById("1");
        adMessage.setContent("hello");
        adMessageService.update(adMessage);
    }

    @Test
    public void testDelete() throws Exception {
        ADMessage adMessage = adMessageService.retriveById("1");
        adMessageService.delete(adMessage);
    }

    @Test
    public void testRetriveById() throws Exception {

    }

    @Test
    public void testRetriveCounts() throws Exception {
        System.out.println(adMessageService.retriveCounts());
    }

    @Test
    public void testRetriveCountsByKey() throws Exception {
        int adMessageList = adMessageService.retriveCountsByKey("1");
        System.out.println(adMessageList);
    }

    @Test
    public void testRetriveByPageNumber() throws Exception {

    }

    @Test
    public void testRetriveByPageAndKey() throws Exception {

    }

    @Test
    public void testRetrivePageNumber() throws Exception {

    }

    @Test
    public void testRetrivePageNumberOfKey() throws Exception {

    }

    @Test
    public void testGetStartAndEnd() throws Exception {

    }
}