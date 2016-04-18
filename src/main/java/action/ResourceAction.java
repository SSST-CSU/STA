package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Resource;
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
import service.ResourceService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/1.
 */
@Namespace("")
@ParentPackage("struts-default")
public class ResourceAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    ResourceService resourceService;

    public ResourceAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        resourceService = (ResourceService) applicationContext.getBean("ResourceService");
    }

    @Action(value = "retriveResourceByPage", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/resource.jsp")})
    public String retriveResourceByPage() throws Exception {
        List<Resource> resources;
        int pageNumber;
        String targetPage = request.getParameter("targetPage");
        String key = request.getParameter("key");
        if (key == null || key.equals("")) {
            resources = resourceService.retriveByPageNumber(targetPage);
            pageNumber = resourceService.retrivePageNumber();
        } else {
            resources = resourceService.retriveByPageAndKey(targetPage, key);
            pageNumber = resourceService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = resourceService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        request.setAttribute("resources", resources);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("targetPage", targetPage);
        request.setAttribute("startAndEnd", startAndEnd);
        request.setAttribute("key", key);

        return SUCCESS;
    }

    @Action(value = "downloadResource")
    public void downloadResource() throws Exception {
        String resourceId = request.getParameter("resourceId");
        String url = resourceService.resourceDownload(resourceId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("downloadStatus", "ok");
        jsonObject.put("downloadUrl", url);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
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

}
