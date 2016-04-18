package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Competition;
import domain.Lecture;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
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
public class CompetitionAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    CompetitionService competitionService;

    public CompetitionAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        competitionService = (CompetitionService) applicationContext.getBean("CompetitionService");
    }

    @Action(value = "viewCompetition", results = {
            @Result(name = SUCCESS, location = "/competitionList.jsp")
    })
    public String viewCompetition() throws Exception {
        System.out.println("key=" + key + "targetPage" + targetPage);

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

        return SUCCESS;
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
