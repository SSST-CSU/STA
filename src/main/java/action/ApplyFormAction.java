package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.ADMessage;
import domain.ApplyForm;
import domain.Person;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
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
import service.ADMessageService;
import service.ApplyFormService;
import service.PersonService;
import util.ConstantUtil;
import util.ImageUtils;
import util.XwpfTUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by martsforever on 2016/2/26.
 */
@Namespace("")
@ParentPackage("struts-default")
public class ApplyFormAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    ApplyFormService applyFormService;
    PersonService personService;
    ADMessageService adMessageService;
    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT_DETAIL);
    SimpleDateFormat dateFormat2 = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

    private File portrait;
    private String portraitFileName;
    private String portraitContentType;


    ApplyForm applyForm;

    public ApplyFormAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        applyFormService = (ApplyFormService) applicationContext.getBean("ApplyFormService");
        personService = (PersonService) applicationContext.getBean("PersonService");
        adMessageService = (ADMessageService) applicationContext.getBean("ADMessageService");
    }

    @Action(value = "applyToJoinSTA")
    public void applyToJoinSTA() throws Exception {

        if (applyForm != null) System.out.println(applyForm.toString());
        else System.out.println("applyForm is null");

        System.out.println("portrait is null:" + (portrait == null));
        System.out.println("portraitFileName=" + portraitFileName);
        System.out.println("portraitContentType=" + portraitContentType);

        JSONObject jsonObject = new JSONObject();

        if (portrait != null && applyForm != null) {
            portraitContentType = portraitFileName.substring(portraitFileName.lastIndexOf(".") + 1);//获得正真的文件类型
            System.out.println("portraitContentType:" + portraitContentType);
            portraitFileName = (applyForm.getName() + dateFormat.format(new Date())) + "." + portraitContentType;//存储的文件名称为用户姓名加上时间

            String realpath = ServletActionContext.getServletContext().getRealPath("/person_portraits");
            /*System.out.println("realpath:" + realpath);*/

            File saveFile = new File(new File(realpath), portraitFileName);
            if (!saveFile.getParentFile().exists()) {
                System.out.println("目录不存在，重新创建目录！");
                saveFile.getParentFile().mkdirs();
            }

            FileUtils.copyFile(portrait, saveFile);
            String savePath = saveFile.getAbsolutePath();
            ImageUtils.scaleByHeightOrWodth(savePath, savePath, 200, -1);

            applyForm.setPortrait("person_portraits/" + portraitFileName);
            applyFormService.add(applyForm);

            ADMessage adMessage = new ADMessage();
            adMessage.setType(0);
            adMessage.setTime(dateFormat2.format(new Date()));
            adMessage.setIsRead(0);
            adMessage.setContent(applyForm.getName() + "申请加入科协，点击查看");
            adMessage.setPersonId(applyForm.getPersonId());
            adMessage.setApplyFormId(applyForm.getId());

            adMessageService.add(adMessage);

            jsonObject.put("status", "success");
        } else {
            jsonObject.put("status", "fail");
        }
        response.getWriter().write(jsonObject.toString());

    }


    @Action(value = "applyFormDetail", results = {
            @Result(name = SUCCESS, location = "/applyFormInfo.jsp")
    })
    public String applyFormDetail() throws Exception {

        String id = request.getParameter("id");
        applyForm = applyFormService.retriveById(id);

        String path = request.getContextPath() + "/";
        request.setAttribute("path", path);

        request.setAttribute("applyForm", applyForm);

        return SUCCESS;
    }

    @Action(value = "exportApplyForm")
    public void exportApplyForm() throws Exception {

        String id = request.getParameter("id");
        applyForm = applyFormService.retriveById(id);

        Map<String, Object> params = new HashMap<String, Object>();

        params.put("${name}", applyForm.getName());
        params.put("${sex}", applyForm.getSex());
        params.put("${political}", applyForm.getPolitical());
        params.put("${place}", applyForm.getPlace());
        params.put("${classes}", applyForm.getClasses());
        params.put("${id}", applyForm.getStudentId());
        params.put("${qq}", applyForm.getQq());
        params.put("${tel}", applyForm.getTel());
        params.put("${oldJob}", applyForm.getOldJob());
        params.put("${swap}", applyForm.getSwap());
        params.put("${first}", applyForm.getFirst());
        params.put("${second}", applyForm.getSecond());
        params.put("${award}", applyForm.getAward());
        params.put("${achievement}", applyForm.getAchievement());
        params.put("${advice}", applyForm.getAdvice());
        params.put("${attach}", applyForm.getAttach());

        XwpfTUtil xwpfTUtil = new XwpfTUtil();

        XWPFDocument doc;
        String fileNameInResource = "sta.docx";
        InputStream is;
        /*is = new FileInputStream(filePath);*/
        is = getClass().getClassLoader().getResourceAsStream(fileNameInResource);
        doc = new XWPFDocument(is);

        xwpfTUtil.replaceInPara(doc, params);
        //替换表格里面的变量
        xwpfTUtil.replaceInTable(doc, params);
        OutputStream os = response.getOutputStream();

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition","attachment;filename="+applyForm.getName()+".docx");

        doc.write(os);

        xwpfTUtil.close(os);
        xwpfTUtil.close(is);

        os.flush();
        os.close();
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

    public ApplyForm getApplyForm() {
        return applyForm;
    }

    public void setApplyForm(ApplyForm applyForm) {
        this.applyForm = applyForm;
    }

    public File getPortrait() {
        return portrait;
    }

    public void setPortrait(File portrait) {
        this.portrait = portrait;
    }

    public String getPortraitFileName() {
        return portraitFileName;
    }

    public void setPortraitFileName(String portraitFileName) {
        this.portraitFileName = portraitFileName;
    }

    public String getPortraitContentType() {
        return portraitContentType;
    }

    public void setPortraitContentType(String portraitContentType) {
        this.portraitContentType = portraitContentType;
    }
}
