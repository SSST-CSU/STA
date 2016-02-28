package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Attach;
import domain.Department;
import domain.Person;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.AttachService;
import service.DepartmentService;
import service.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/25.
 */
@Namespace("")
@ParentPackage("struts-default")
public class DepartmentAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    DepartmentService departmentService;
    PersonService personService;
    AttachService attachService;

    public DepartmentAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
        departmentService = (DepartmentService) applicationContext.getBean("DepartmentService");
        attachService = (AttachService) applicationContext.getBean("AttachService");
    }

    @Action(value = "retriveDepartment", results = {
            @Result(name = SUCCESS, location = "/department.jsp")
    })
    public String retriveDepartment() throws Exception {

        String targetDepartment = request.getParameter("targetDepartment");
        if (targetDepartment == null || targetDepartment.equals("")) {
            targetDepartment = Attach.PRESIDIUM;
        }

        Department department = departmentService.retriveByName(targetDepartment);
        System.out.println(department.toString());

        List<Person> members = personService.retriveByDepartment(department.getName());

        for (Person person : members) {
            System.out.println(person.getId());
        }

        List<Attach> attaches = attachService.retriveByDepartmentName(department.getName());
        for (Attach attach : attaches) {
            System.out.println(attach.getId());
        }

        String path = request.getContextPath() + "/";
        System.out.println(path);
        session.put("path", path);
        session.put("department", department);
        session.put("members", members);
        session.put("attaches", attaches);

        request.setAttribute("admin", "admin-sta");

        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response = httpServletResponse;
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }
}
