package service.test;

import domain.Person;
import domain.Resource;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.ResourceService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class ResourceServiceImplTest extends TestCase {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    ResourceService resourceService = (ResourceService) applicationContext.getBean("ResourceService");

    @Test
    public void testAdd() throws Exception {
        SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
        /*for (int i = 33;i<44;i++){
            Resource resource = new Resource();
            resource.setName("PHP"+i);
            resource.setSize(1000);
            resource.setDownloadTimes(0);
            resource.setIntroduce("一个比较老旧的用于开发window应用程序的开发环境");
            resource.setTime(dateFormat.format(new Date()));
            resource.setDownloadUrl("resource/dropdowns.html");
            resourceService.add(resource);

            Resource resource1 = new Resource();
            resource1.setName("Objective-C"+i);
            resource1.setSize(1000);
            resource1.setDownloadTimes(0);
            resource1.setIntroduce("一个比较老旧的用于开发window应用程序的开发环境");
            resource1.setTime(dateFormat.format(new Date()));
            resource1.setDownloadUrl("resource/dropdowns.html");
            resourceService.add(resource1);
        }*/
        Resource resource = new Resource();
        resource.setName("hello");
        resource.setSize((float) 1000.0);
        resource.setDownloadTimes(0);
        resource.setIntroduce("一个比较老旧的用于开发window应用程序的开发环境");
        resource.setTime(dateFormat.format(new Date()));
        resource.setDownloadUrl("resource/kexie.zip");
        resourceService.add(resource);
    }

    @Test
    public void testRetriveByPageNumber() throws Exception {
        List<Resource> resources = resourceService.retriveByPageNumber("1");
        for (Resource resource:resources){
            System.out.println(resource.toString());
        }
    }
    @Test
    public void testRetriveCounts() throws Exception {
        int number = resourceService.retriveCounts();
        System.out.println(number);
    }
    @Test
    public void testRetriveByPageAndKey() throws Exception {
        List<Resource> resources = resourceService.retriveByPageAndKey("3","C");
        for (Resource resource:resources){
            System.out.println(resource.toString());
        }
    }
    @Test
    public void testRetriveCountsByKey() throws Exception {
        int number = resourceService.retriveCountsByKey("j");
        System.out.println(number);
    }
    @Test
    public void testUpdate() throws Exception {
        Resource resource = resourceService.retriveByPageNumber("1").get(0);
        SimpleDateFormat dateFormat =new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
        resource.setTime(new Date().toString());
        resourceService.update(resource);
    }
    @Test
    public void testDelete() throws Exception {
        Resource resource = resourceService.retriveByPageNumber("1").get(0);
        SimpleDateFormat dateFormat =new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
        resource.setTime(new Date().toString());
        resourceService.delete(resource,"213");
    }



}