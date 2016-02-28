package service.test;

import domain.Admin;
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
import service.AdminService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class AdminServiceImplTest extends TestCase {

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    AdminService adMessageService = (AdminService) applicationContext.getBean("AdminService");

    public void testAdd() throws Exception {

    }

    public void testUpdate() throws Exception {

    }

    public void testDelete() throws Exception {

    }

    @Test
    public void testRetriveById() throws Exception {
        Admin admin = adMessageService.retriveById(1);
        System.out.println(admin.toString());
    }

    @Test
    public void testRetriveAll() throws Exception {
        for (Admin admin:adMessageService.retriveAll()){
            System.out.println(admin.toString());
        }
    }
}