package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.ADMessage;
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
import service.ADMessageService;
import service.CompetitionService;
import service.PersonService;
import util.ConstantUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/25.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminMessageAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    ADMessageService adMessageService;
    PersonService personService;
    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

    public AdminMessageAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        adMessageService = (ADMessageService) applicationContext.getBean("ADMessageService");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Action(value = "adminMessage", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminMesasge() throws Exception {

        if (targetPage == null || targetPage.equals("")) {
            targetPage = "1";
        }

        System.out.println("key = " + key);
        System.out.println("targetPage = " + targetPage);
        List<ADMessage> adMessages;
        int pageNumber;

        if (key != null && key.equals("全部")) key = null;

        if (key == null || key.equals("")) {
            adMessages = adMessageService.retriveByPageNumber(targetPage);
            pageNumber = adMessageService.retrivePageNumber();
        } else {
            adMessages = adMessageService.retriveByPageAndKey(targetPage, key);
            pageNumber = adMessageService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = adMessageService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        session.put("adMessages", adMessages);
        session.put("pageNumber", pageNumber);
        session.put("targetPage", targetPage);
        session.put("startAndEnd", startAndEnd);
        session.put("key", key);
        request.setAttribute("admin", "admin-message");

        return SUCCESS;
    }

    @Action(value = "deleteAdMessage")
    public void deleteAdMessage() throws Exception {
        String id = request.getParameter("id");
        ADMessage adMessage = adMessageService.retriveById(id);
        adMessageService.delete(adMessage);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "changeReadStatus")
    public void changeReadStatus() throws Exception {
        String id = request.getParameter("id");
        String statu = request.getParameter("statu");
        ADMessage adMessage = adMessageService.retriveById(id);

        adMessage.setIsRead(Integer.parseInt(statu));


        adMessageService.update(adMessage);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }


    @Action(value = "sendADMessage")
    public void sendADMessage() throws Exception {
        String personId = request.getParameter("personId");
        String type = request.getParameter("type");
        String content = request.getParameter("content");

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");
        JSONObject jsonObject = new JSONObject();

        if (personId!=null&&!personId.equals("")&&type!=null&&!type.equals("")&&content!=null&&!content.equals("")){
            ADMessage adMessage = new ADMessage();
            adMessage.setContent(content);
            adMessage.setType(Integer.parseInt(type));
            adMessage.setPersonId(Integer.parseInt(personId));
            adMessage.setTime(dateFormat.format(new Date()));
            adMessage.setIsRead(0);
            adMessage.setApplyFormId(0);

            adMessageService.add(adMessage);
            jsonObject.put("status", "success");

        }
        else jsonObject.put("status", "fail");
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
