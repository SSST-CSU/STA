package service.test;

import domain.Lecture;
import domain.Person;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import service.LectureService;
import service.PersonService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class LectureServiceImplTest extends TestCase {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    LectureService lectureService = (LectureService) applicationContext.getBean("LectureService");
    PersonService personService = (PersonService) applicationContext.getBean("PersonService");
    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

    @Test
    public void testAdd() throws Exception {
        for (int i = 9; i < 33; i++) {
            Lecture lecture = new Lecture();
            lecture.setName("讲座" + i);
            lecture.setIntroduce("是一个XXX样的讲座，主要内容涉及到XXXX，地点在世纪101");
            lecture.setTime(dateFormat.format(new Date()));
            lecture.setAccessable("1");
            lectureService.add(lecture);
        }
    }

    @Test
    public void testUpdate() throws Exception {
        Lecture lecture = lectureService.retriveById("2");
        lecture.setName("讲座2");
        lectureService.update(lecture);
    }

    @Test
    public void testDelete() throws Exception {
        Lecture lecture = lectureService.retriveById("2");
        lectureService.delete(lecture);
    }

    @Test
    public void testRetriveCounts() throws Exception {
        System.out.println(lectureService.retriveCounts());
    }

    @Test
    public void testRetriveCountsByKey() throws Exception {
        System.out.println(lectureService.retriveCountsByKey("4"));
    }

    @Test
    public void testRetriveByPageNumber() throws Exception {
        List<Lecture> lectures = lectureService.retriveByPageNumber("2");
        for (Lecture lecture : lectures) {
            System.out.println(lecture.toString());
        }
    }

    @Test
    public void testRetriveByPageAndKey() throws Exception {
        List<Lecture> lectures = lectureService.retriveByPageAndKey("2", "3");
        for (Lecture lecture : lectures) {
            System.out.println(lecture.toString());
        }
    }

    @Test
    public void testRetrivePageNumber() throws Exception {
        System.out.println(lectureService.retrivePageNumber());
    }

    @Test
    public void testRetrivePageNumberOfKey() throws Exception {
        System.out.println(lectureService.retrivePageNumberOfKey("3"));
    }

    @Test
    public void testGetStartAndEnd() throws Exception {

    }

    @Test
    public void testApplyToJoinLecture() throws Exception{

        Person person = personService.retriveById(49);
        Lecture lecture = lectureService.retriveById("35");

        String result = lectureService.applyToJoinLecture(person,lecture);
        System.out.println(result);

    }

}