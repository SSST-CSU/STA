package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Attach;
import domain.Department;
import domain.Person;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
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
import service.AttachService;
import service.DepartmentService;
import service.PersonService;
import util.ConstantUtil;
import util.ImageUtils;
import util.PathUtil;
import util.PropertiesUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/24.
 */
@Namespace("")
@ParentPackage("struts-default")
public class AdminSTAAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;
    PersonService personService;
    DepartmentService departmentService;
    AttachService attachService;

    private File newMenberPortrait;
    private String newMenberPortraitFileName;
    private String newMenberPortraitContentType;

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT_DETAIL);

    public AdminSTAAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        personService = (PersonService) applicationContext.getBean("PersonService");
        departmentService = (DepartmentService) applicationContext.getBean("DepartmentService");
        attachService = (AttachService) applicationContext.getBean("AttachService");
    }

    @Action(value = "addNewMember")
    public void addNewMember() throws Exception {
        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        System.out.println(newMenberPortrait == null);
        System.out.println(newMenberPortraitFileName + newMenberPortraitContentType);

        String name = request.getParameter("name");
        String classes = request.getParameter("classes");
        String department = request.getParameter("department");
        String job = request.getParameter("job");
        System.out.println(name + classes + department + job);


        if (newMenberPortrait != null) {
            Person person = new Person();
            person.setName(name);
            person.setClasses(classes);
            person.setDepartment(department);
            person.setJob(job);

            newMenberPortraitContentType = newMenberPortraitFileName.substring(newMenberPortraitFileName.lastIndexOf(".") + 1);//获得正真的文件类型
            System.out.println("portraitContentType:" + newMenberPortraitContentType);
            newMenberPortraitFileName = person.getName() + (dateFormat.format(new Date())) + "." + newMenberPortraitContentType;//存储的文件名称为用户账号名

//            String realpath = ServletActionContext.getServletContext().getRealPath("/person_portraits");
            String realpath = PropertiesUtils.get("img_path");//头像存储路径
            /*System.out.println("realpath:" + realpath);*/
            File saveFile = new File(new File(realpath), newMenberPortraitFileName);
            if (!saveFile.getParentFile().exists()) {
                System.out.println("目录不存在，重新创建目录！");
                saveFile.getParentFile().mkdirs();
            }
            System.out.println(newMenberPortrait);
            FileUtils.copyFile(newMenberPortrait, saveFile);
            String savePath = saveFile.getAbsolutePath();
            ImageUtils.scaleByHeightOrWodth(savePath, savePath, 200, -1);

            person.setProtrait(PathUtil.getImgPath() + newMenberPortraitFileName);

            personService.register(person);

            jsonObject.put("saveStatus", "success");
        } else {
            jsonObject.put("saveStatus", "fail");
        }
        response.getWriter().write(jsonObject.toString());
    }


    @Action(value = "adminStaDepartment", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminStaDepartment() throws Exception {

        String targetDepartment = request.getParameter("targetDepartment");
        if (targetDepartment == null || targetDepartment.equals("")) {
            targetDepartment = Attach.PRESIDIUM;
        }

        Department department = departmentService.retriveByName(targetDepartment);
        System.out.println(department.toString());

        List<Person> members = personService.retriveByDepartment(department.getName());

        for (Person person : members) {
            System.out.println(person.getId());
        }

        List<Attach> attaches = attachService.retriveByDepartmentName(department.getName());
        for (Attach attach : attaches) {
            System.out.println(attach.getId());
        }

        String path = request.getContextPath() + "/";
        System.out.println(path);
        request.setAttribute("path", path);
        request.setAttribute("department", department);
        request.setAttribute("members", members);
        request.setAttribute("attaches", attaches);

        request.setAttribute("admin", "admin-sta");

        return SUCCESS;
    }

    @Action(value = "adminDeleteMember")
    public void adminDeleteMember() throws Exception {
        String id = request.getParameter("id");
        System.out.println(id);
        Person person = personService.retriveById(Integer.parseInt(id));
        String status = personService.deletePerson(person);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", status);
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "newResponsibility")
    public void newResponsibility() throws Exception {
        String responsibility = request.getParameter("responsibility");
        String mark = request.getParameter("mark");

        Attach attach = new Attach();
        attach.setMark(mark);
        attach.setContent(responsibility);
        attach.setType(Attach.TYPE_RESPONSIBILITY);
        attachService.add(attach);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "newAchievement")
    public void newAchievement() throws Exception {
        String achievement = request.getParameter("achievement");
        String mark = request.getParameter("mark");

        Attach attach = new Attach();
        attach.setMark(mark);
        attach.setContent(achievement);
        attach.setType(Attach.TYPE_ACHIEVEMENT);
        attachService.add(attach);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "deleteAttach")
    public void deleteAttach() throws Exception {
        String id = request.getParameter("id");

        Attach attach = attachService.retriveById(id);
        attachService.delete(attach);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "modifyDepartmentTitle")
    public void modifyDepartmentTitle() throws Exception {
        String departmentId = request.getParameter("departmentId");
        String content = request.getParameter("content");
        String type = request.getParameter("type");

        Department department = departmentService.retriveById(departmentId);
        if (type.equals("introduce")) {
            department.setIntroduce(content);
        } else if (type.equals("destination")) {
            department.setDestination(content);
        }

        departmentService.update(department);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");
        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "markUserAsSta")
    public void markUserAsSta() throws Exception {
        String personName = request.getParameter("personName");
        String personId = request.getParameter("personId");
        String departmentName = request.getParameter("departmentName");
        String jobName = request.getParameter("jobName");

        Person person = personService.retriveById(Integer.parseInt(personId));
        person.setDepartment(departmentName);
        person.setJob(jobName);
        personService.update(person);

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
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
    }

    @Override
    public void setSession(Map<String, Object> map) {
        session = map;
    }

    public File getNewMenberPortrait() {
        return newMenberPortrait;
    }

    public void setNewMenberPortrait(File newMenberPortrait) {
        this.newMenberPortrait = newMenberPortrait;
    }

    public String getNewMenberPortraitFileName() {
        return newMenberPortraitFileName;
    }

    public void setNewMenberPortraitFileName(String newMenberPortraitFileName) {
        this.newMenberPortraitFileName = newMenberPortraitFileName;
    }

    public String getNewMenberPortraitContentType() {
        return newMenberPortraitContentType;
    }

    public void setNewMenberPortraitContentType(String newMenberPortraitContentType) {
        this.newMenberPortraitContentType = newMenberPortraitContentType;
    }
}
