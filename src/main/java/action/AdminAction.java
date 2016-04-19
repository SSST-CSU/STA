package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Admin;
import domain.Person;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONObject;
import org.junit.internal.runners.statements.Fail;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.AdminService;
import service.CompetitionService;
import service.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/20.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    AdminService adminService;

    public AdminAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        adminService = (AdminService) applicationContext.getBean("AdminService");
    }

    @Action(value = "admin", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/admin-navigation.jsp"),
            @Result(name = ActionSupport.INPUT, location = "/admin-login.jsp")})
    public String retriveResourceByPage() throws Exception {
        if ((Admin) (session.get("currentAdmin")) != null) {
            request.setAttribute("admin", "admin-user");
            request.setAttribute("key", null);
            request.setAttribute("targetPage", 1);
            return SUCCESS;
        } else {
            return INPUT;
        }
    }

    @Action(value = "adminLogin")
    public void adminLogin() throws Exception {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        Admin admin = adminService.adminLogin(account, password);

        JSONObject jsonObject = new JSONObject();

        if (admin != null) {
            session.put("currentAdmin", admin);
            jsonObject.put("status", "success");
        } else {
            jsonObject.put("status", "fail");
        }
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "adminlogout", results = {
            @Result(name = SUCCESS, location = "/admin-login.jsp")
    })
    public String adminlogout() throws Exception {
        request.getSession().invalidate();
        return SUCCESS;
    }

    @Action(value = "deleteDdmin")
    public void deleteDdmin() throws Exception {

        String id = request.getParameter("id");
        Admin admin = adminService.retriveById(Integer.parseInt(id));
        adminService.delete(admin);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "allAdmin", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String allAdmin() throws Exception {

        List<Admin> admins = adminService.retriveAll();
        request.setAttribute("admins", admins);

        /*for (Admin admin : admins) {
            System.out.println(admin.toString());
        }*/

        request.setAttribute("admin", "admin-administrator");

        return SUCCESS;
    }

    @Action(value = "addAdmin")
    public void addAdmin() throws Exception {
        String name = request.getParameter("name");
        String account = request.getParameter("account");
        String passwrod = request.getParameter("password");

        Admin admin = new Admin();
        admin.setName(name);
        admin.setAccount(account);
        admin.setPassword(passwrod);

        adminService.add(admin);

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

        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }
}
