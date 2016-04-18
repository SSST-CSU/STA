package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Competition;
import domain.Message;
import domain.Person;
import domain.Team;
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
import service.CompetitionService;
import service.MessageService;
import service.PersonService;
import service.TeamService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminGroupAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    TeamService teamService;
    PersonService personService;
    MessageService messageService;

    public AdminGroupAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        teamService = (TeamService) applicationContext.getBean("TeamService");
        personService = (PersonService) applicationContext.getBean("PersonService");
        messageService = (MessageService) applicationContext.getBean("MessageService");
    }

    @Action(value = "adminGroup", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminGroup() throws Exception {
        System.out.println("key=" + key + "targetPage" + targetPage);

        List<Team> teams;
        int pageNumber;

        if (key == null || key.equals("")) {
            teams = teamService.retriveByPageNumber(targetPage);
            pageNumber = teamService.retrivePageNumber();
        } else {
            teams = teamService.retriveByPageAndKey(Integer.parseInt(targetPage), key);
            pageNumber = teamService.retrivePageNumberByKey(key);
        }

        if (teams.size() > 0) {
            List<Person> ministers = new ArrayList<Person>();
            for (Team team : teams) {
                Person minister = personService.retriveById(team.getMinisterId());
                ministers.add(minister);
            }

            Map<String, Integer> startAndEnd = teamService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

            request.setAttribute("teams", teams);
            request.setAttribute("ministers", ministers);//每个团队的队长
            request.setAttribute("pageNumber", pageNumber);
            request.setAttribute("targetPage", targetPage);
            request.setAttribute("startAndEnd", startAndEnd);
            request.setAttribute("key", key);
            request.setAttribute("admin", "admin-group");
        }
        return SUCCESS;
    }

    @Action(value = "detailGroupInfo", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String detailGroupInfo() throws Exception {

        String id = request.getParameter("id");
        Team team = teamService.retriveById(Integer.parseInt(id));

        Person minister = personService.retriveById(team.getMinisterId());
        request.setAttribute("team", team);
        request.setAttribute("minister", minister);


        request.setAttribute("admin", "admin-group-detail");

        return SUCCESS;
    }


    @Action(value = "adminDeleteGroup")
    public void adminDeleteGroup() throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        Team team = teamService.retriveById(id);

        messageService.adminMsg("您的团队："+team.getName()+"已经被强制解散！",team.getMinisterId());
        teamService.removeTeam(id);

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
