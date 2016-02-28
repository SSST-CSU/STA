package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Person;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.MessageService;
import service.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminUserActoin extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    PersonService personService;
    MessageService messageService;

    String key;
    String targetPage;

    public AdminUserActoin() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
        messageService = (MessageService) applicationContext.getBean("MessageService");
    }

    @Action(value = "adminUser", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminUser() throws Exception {

        List<Person> persons;
        int pageNumber;

        System.out.println("key=" + key + "targetPage=" + targetPage);
        if (targetPage==null || targetPage.equals("")) targetPage = "1";

        if (key == null || key.equals("")) {
            persons = personService.retriveByPageNumber(targetPage);
            pageNumber = personService.retrivePageNumber();
        } else {
            persons = personService.retriveByPageAndKey(targetPage, key);
            pageNumber = personService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = personService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        session.put("persons", persons);
        session.put("pageNumber", pageNumber);
        session.put("targetPage", targetPage);
        session.put("startAndEnd", startAndEnd);
        session.put("key", key);
        request.setAttribute("admin", "admin-user");

        return SUCCESS;
    }

    @Action(value = "modifyUserPassword")
    public void modifyUserPassword() throws Exception {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        System.out.println("id="+id+"password="+password);

        personService.modifyUserPassword(id, password);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }
    @Action(value = "sendAdminMsg")
    public void sendAdminMsg() throws Exception{
        String id = request.getParameter("id");
        String msg = request.getParameter("msgContent");
        messageService.adminMsg(msg,Integer.parseInt(id));

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        request = httpServletRequest;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        response = httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getTargetPage() {
        return targetPage;
    }

    public void setTargetPage(String targetPage) {
        this.targetPage = targetPage;
    }
}
