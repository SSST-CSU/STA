package service.test;

import domain.ApplyForm;
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
import service.ApplyFormService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class ApplyFormServiceImplTest extends TestCase {

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    ApplyFormService applyFormService = (ApplyFormService) applicationContext.getBean("ApplyFormService");

    @Test
    public void testAdd() throws Exception {
        ApplyForm applyForm = new ApplyForm();
        applyForm.setPersonId(50);
        applyForm.setName("sadasd");
        applyForm.setSex("男");
        applyForm.setPolitical("共青团员团");
        applyForm.setPlace("sdadsad");
        applyForm.setClasses("2131");
        applyForm.setStudentId("2131312");
        applyForm.setQq("21323131");
        applyForm.setTel("2368126");
        applyForm.setOldJob("askdhak");
        applyForm.setSwap("是");
        applyForm.setFirst("研发中心");
        applyForm.setSecond("综合事务部");
        applyForm.setAward("qweakdhkas");
        applyForm.setAchievement("2163817638");
        applyForm.setAdvice("没有建议");
        applyForm.setAttach("无");

        applyForm.setPortrait("sakdhsakjdhkaj");
        applyFormService.add(applyForm);

        System.out.println(applyForm.getId());
    }

    @Test
    public void testUpdate() throws Exception {
        ApplyForm applyForm =  applyFormService.retriveById("1");
        applyForm.setSex("女");
        applyFormService.update(applyForm);
    }

    @Test
    public void testDelete() throws Exception {
        ApplyForm applyForm =  applyFormService.retriveById("1");
        applyFormService.delete(applyForm);
    }

    @Test
    public void testRetriveById() throws Exception {

    }
}