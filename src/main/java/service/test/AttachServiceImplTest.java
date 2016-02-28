package service.test;

import domain.Attach;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.AttachService;
import service.CompetitionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class AttachServiceImplTest extends TestCase {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    AttachService attachService = (AttachService) applicationContext.getBean("AttachService");

    @Test
    public void testAdd() throws Exception {
        Attach attach = new Attach();
        attach.setMark(Attach.PUBLIC_RELATIONS);
        attach.setContent("筹集资金");
        attach.setType(Attach.TYPE_ACHIEVEMENT);

        attachService.add(attach);

    }

    public void testUpdate() throws Exception {

    }

    public void testDelete() throws Exception {

    }

    public void testRetriveById() throws Exception {

    }

    public void testRetriveByDepartmentName() throws Exception {

    }
}