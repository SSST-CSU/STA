package action;

import com.opensymphony.xwork2.ActionContext;
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
import service.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by martsforever on 2016/1/22.
 */
@Namespace("")
@ParentPackage("struts-default")
public class LoginAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    PersonService personService;

    public LoginAction() {
        super();
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Action(value = "login")
    public void login() throws Exception {

        String account = request.getParameter("account");
        String password = request.getParameter("password");

        Person person = personService.login(account, password);

        JSONObject jsonObject = new JSONObject();
        if (person == null) {
            jsonObject.put("loginState", "fail");

        } else {
            jsonObject.put("loginState", "success");
            session.put("person", person);
        }
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter writer = response.getWriter();
        writer.write(jsonObject.toString());
    }

    @Action(value = "logout", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/index.jsp")})
    public String logout() throws Exception {
        session.clear();
        return this.SUCCESS;
    }

    @Action(value = "loginSuccess", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/personInfo.jsp")})
    public String loginSuccess() throws Exception {
        return this.SUCCESS;
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
}
