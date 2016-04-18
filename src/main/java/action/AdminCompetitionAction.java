package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Competition;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminCompetitionAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    CompetitionService competitionService;

    public AdminCompetitionAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        competitionService = (CompetitionService) applicationContext.getBean("CompetitionService");
    }

    @Action(value = "adminCompetition", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String viewCompetition() throws Exception {
        System.out.println("key=" + key + "\ntargetPage=" + targetPage);

        List<Competition> competitions;
        int pageNumber;

        if (key == null || key.equals("")) {
            competitions = competitionService.retriveByPageNumber(targetPage);
            pageNumber = competitionService.retrivePageNumber();
        } else {
            competitions = competitionService.retriveByPageAndKey(targetPage, key);
            pageNumber = competitionService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = competitionService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        request.setAttribute("competitions", competitions);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("targetPage", targetPage);
        request.setAttribute("startAndEnd", startAndEnd);
        request.setAttribute("key", key);
        request.setAttribute("admin", "admin-competition");

        return SUCCESS;
    }

    @Action(value = "modifyCompetition")
    public void modifyCompetition() throws Exception {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String introduce = request.getParameter("introduce");
        String link = request.getParameter("link");

        System.out.println(id + name + time + introduce + link);

        Competition competition = competitionService.retriveById(id);
        competition.setName(name);
        competition.setTime(time);
        competition.setIntroduce(introduce);
        competition.setLink(link);

        competitionService.update(competition);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());

    }

    @Action(value = "adminDeleteCompetition")
    public void adminDeleteCompetition() throws Exception {
        String id = request.getParameter("id");
        Competition competition = competitionService.retriveById(id);
        competitionService.delete(competition);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "adminNewCompetition")
    public void adminNewCompetition() throws Exception {
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String introduce = request.getParameter("introduce");
        String link = request.getParameter("link");

        System.out.println(name + time + introduce + link);

        Competition competition = new Competition();
        competition.setName(name);
        competition.setTime(time);
        competition.setIntroduce(introduce);
        competition.setLink(link);

        competitionService.add(competition);

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
