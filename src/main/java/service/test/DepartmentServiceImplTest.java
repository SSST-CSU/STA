package service.test;

import domain.Department;
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
import service.DepartmentService;
import util.ConstantUtil;

import java.text.SimpleDateFormat;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class DepartmentServiceImplTest extends TestCase {

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    DepartmentService departmentService = (DepartmentService) applicationContext.getBean("DepartmentService");

    @Test
    public void testRetriveById() throws Exception {
        Department department = departmentService.retriveById("4");
        System.out.println(department.toString());
    }

    @Test
    public void testUpdate() throws Exception {
        Department department = departmentService.retriveById("3");
        department.setMinister(10);
        System.out.println(department.toString());
        departmentService.update(department);
    }

    @Test
    public void testRetriveByName() throws Exception {
        Department department = departmentService.retriveByName("主席团");
        System.out.println("department == null:" + (department == null));
        /*Department departments = departmentService.retriveById("4");
        System.out.println(departments.toString());*/
    }
}