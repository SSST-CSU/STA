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
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.CompetitionService;
import service.LectureService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/23.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminLectureAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    LectureService lectureService;

    public AdminLectureAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        lectureService = (LectureService) applicationContext.getBean("LectureService");
    }

    @Action(value = "adminLecture", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminLecture() throws Exception {
        System.out.println("key=" + key + "targetPage" + targetPage);

        List<Lecture> lectures;
        int pageNumber;

        if (key == null || key.equals("")) {
            lectures = lectureService.retriveByPageNumber(targetPage);
            pageNumber = lectureService.retrivePageNumber();
        } else {
            lectures = lectureService.retriveByPageAndKey(targetPage, key);
            pageNumber = lectureService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = lectureService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        request.setAttribute("lectures", lectures);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("targetPage", targetPage);
        request.setAttribute("startAndEnd", startAndEnd);
        request.setAttribute("key", key);
        request.setAttribute("admin", "admin-lecture");

        return SUCCESS;
    }

    @Action(value = "adminModifyLecture")
    public void adminModifyLecture() throws Exception {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String introduce = request.getParameter("introduce");
        String accessable = request.getParameter("accessable");

        System.out.println(accessable);

        Lecture lecture = lectureService.retriveById(id);
        lecture.setName(name);
        lecture.setTime(time);
        lecture.setIntroduce(introduce);
        lecture.setAccessable(accessable);
        lectureService.update(lecture);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "deleteLecture")
    public void deleteLecture() throws Exception {
        String  id = request.getParameter("id");
        Lecture lecture = lectureService.retriveById(id);
        lectureService.delete(lecture);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "adminNewLecture")
    public void adminNewLecture() throws Exception {
        String name = request.getParameter("name");
        String time = request.getParameter("time");
        String introduce = request.getParameter("introduce");
        String accessable = request.getParameter("accessable");

        System.out.println(accessable);

        Lecture lecture = new Lecture();
        lecture.setName(name);
        lecture.setTime(time);
        lecture.setIntroduce(introduce);
        lecture.setAccessable(accessable);
        lectureService.add(lecture);

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
