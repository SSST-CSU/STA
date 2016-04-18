package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Lecture;
import domain.Person;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import service.LectureService;
import service.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by martsforever on 2016/2/20.
 */
@Namespace("")
@ParentPackage("struts-default")
public class LectureAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    PersonService personService;
    LectureService lectureService;

    public LectureAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        lectureService = (LectureService) applicationContext.getBean("LectureService");
        personService = (PersonService) applicationContext.getBean("PersonService");
    }

    @Action(value = "retriveLectureByPage", results = {
            @Result(name = ActionSupport.SUCCESS, location = "/lectureList.jsp")})
    public String retriveResourceByPage() throws Exception {
        List<Lecture> lectures;
        int pageNumber;

        String targetPage = request.getParameter("targetPage");
        String key = request.getParameter("key");
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

        return SUCCESS;
    }

    @Action(value = "applyToJoinLecture")
    public void applyToJoinLecture() throws Exception {

        String lectureId = request.getParameter("id");
        Lecture lecture = lectureService.retriveById(lectureId);
        Person person = (Person) session.get("person");

        String result = lectureService.applyToJoinLecture(person, lecture);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", result);

        response.getWriter().write(jsonObject.toString());

    }

    @Action(value = "checkParticipants", results = {
            @Result(name = SUCCESS, location = "/lectureInfo.jsp")
    })
    public String checkParticipants() throws Exception {

        String lectureId = request.getParameter("id");
        Lecture lecture = lectureService.retriveById(lectureId);
        Set<Person> participants = (Set<Person>) lecture.getPersonList();

        System.out.println(participants.size());

        request.setAttribute("participants", participants);
        request.setAttribute("lecture", lecture);

        return SUCCESS;

    }

    @Action(value = "exportParticipants")
    public void exportParticipants() throws Exception {
        String lectureId = request.getParameter("id");
        Lecture lecture = lectureService.retriveById(lectureId);
        Set<Person> participants = (Set<Person>) lecture.getPersonList();

        List<Person> persons = new ArrayList<Person>();
        for (Person person : participants) {
            persons.add(person);
        }

        HSSFWorkbook hssfWorkbook = lectureService.exportParticipants(persons);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition","attachment;filename="+lecture.getName()+".xls");
        OutputStream outputStream = response.getOutputStream();
        hssfWorkbook.write(outputStream);

        outputStream.flush();
        outputStream.close();

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
