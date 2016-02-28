package action;

import com.opensymphony.xwork2.ActionSupport;
import domain.Resource;
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
import service.ResourceService;
import util.ConstantUtil;
import util.ImageUtils;
import util.upload.UploadStatus;

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
public class AdminResourceAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

    Map session;
    HttpServletRequest request;
    HttpServletResponse response;

    String key;
    String targetPage;

    ResourceService resourceService;

    private File resource;
    private String resourceFileName;
    private String resourceContentType;

    SimpleDateFormat dateFormat = new SimpleDateFormat(ConstantUtil.DATE_FORMAT);

    public AdminResourceAction() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        resourceService = (ResourceService) applicationContext.getBean("ResourceService");
    }

    @Action(value = "adminResource", results = {
            @Result(name = SUCCESS, location = "/admin-navigation.jsp")
    })
    public String adminResource() throws Exception {
        System.out.println("key=" + key + "targetPage" + targetPage);

        List<Resource> resources;
        int pageNumber;

        if (key == null || key.equals("")) {
            resources = resourceService.retriveByPageNumber(targetPage);
            pageNumber = resourceService.retrivePageNumber();
        } else {
            resources = resourceService.retriveByPageAndKey(targetPage, key);
            pageNumber = resourceService.retrivePageNumberOfKey(key);
        }
        Map<String, Integer> startAndEnd = resourceService.getStartAndEnd(Integer.parseInt(targetPage), pageNumber);

        session.put("resources", resources);
        session.put("pageNumber", pageNumber);
        session.put("targetPage", targetPage);
        session.put("startAndEnd", startAndEnd);
        session.put("key", key);
        request.setAttribute("admin", "admin-resource");

        return SUCCESS;
    }

    @Action(value = "adminModifyResource")
    public void adminModifyResource() throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");
        Resource resource = resourceService.retriveById(id);

        resource.setName(name);
        resource.setIntroduce(introduce);
        resourceService.update(resource);

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }

    @Action(value = "adminDeleteResource")
    public void adminDeleteResource() throws Exception {

        int id = Integer.parseInt(request.getParameter("id"));
        Resource resource = resourceService.retriveById(id);
        System.out.println(resource.toString());

        String contextPath = ServletActionContext.getServletContext().getRealPath("/");
        System.out.println(contextPath+resource.getDownloadUrl());
        resourceService.delete(resource,contextPath+resource.getDownloadUrl());

        response.setCharacterEncoding("utf-8");
        response.setContentType("html/text;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "success");

        response.getWriter().write(jsonObject.toString());
    }


    @Action(value = "uploadResourceFile")
    public void uploadResourceFile()throws Exception {

        System.out.println("uploadResourceFile");
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");
        System.out.println("name="+name);
        System.out.println("introduce="+introduce);
        System.out.println("file is null"+(resource == null));

        System.out.println("fileName"+resourceFileName);
        System.out.println("fileContentType"+resourceContentType);

        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");

        if (resource != null) {

            Resource newNesource = new Resource();
            newNesource.setName(name);
            newNesource.setIntroduce(introduce);
            newNesource.setTime(dateFormat.format(new Date()));
            newNesource.setDownloadTimes(0);
            newNesource.setSize(resource.length());
//            resource.setDownloadUrl("resource/"+resourceFileName+resource.getTime());
            resourceContentType = resourceFileName.substring(resourceFileName.lastIndexOf(".") + 1);//获得正真的文件类型
            System.out.println("fileContentType:" + resourceContentType);
            resourceFileName = newNesource.getName() + "." + resourceContentType;//存储的文件名称为用户账号名

            String realpath = ServletActionContext.getServletContext().getRealPath("/resource");
            /*System.out.println("realpath:" + realpath);*/

            File saveFile = new File(new File(realpath), resourceFileName);
            if (!saveFile.getParentFile().exists()) {
                System.out.println("目录不存在，重新创建目录！");
                saveFile.getParentFile().mkdirs();
            }

            FileUtils.copyFile(resource, saveFile);
            String savePath = saveFile.getAbsolutePath();

            newNesource.setDownloadUrl("resource/" + resourceFileName);
            resourceService.add(newNesource);

            System.out.println(resource.toString());

            jsonObject.put("saveStatus", "success");
        } else {
            System.out.println("file is null");
            jsonObject.put("saveStatus", "fail");
        }
        response.getWriter().write(jsonObject.toString());
    }



    /**
     * 获取文件上传的进度
     */
    @Action(value = "getFileUploadProgress")
    public void getFileUploadProgress() throws Exception{
        UploadStatus status = (UploadStatus) session.get("uploadStatus");

        if (status == null) {
            System.out.println("uploadStatus is null");
            return;
        }

        long startTime = status.getStartTime(); //上传开始时间
        long currentTime = System.currentTimeMillis(); //现在时间
        long time = (currentTime - startTime) / 1000 + 1; //已传输的时间 单位:s

        //传输速度单位:byte/s
        double velocity = ((double) status.getBytesRead()) / (double) time;
        //估计总时间
        double totalTime = status.getContentLength();
        //估计剩余时间
        double timeLeft = totalTime - time;
        //已经完成的百分比
        int percent = (int) (100 * (double) status.getBytesRead() / (double) status.getContentLength());
        //已经完成数单位:m
        double length = ((double) status.getBytesRead()) / 1024 / 1024;
        //总长度 单位:m
        double totalLength = ((double) status.getContentLength()) / 1024 / 1024;

        System.out.println("bytesRead:"+status.getBytesRead());
        System.out.println("ContentLength:"+status.getContentLength());

//        System.out.println("percent:"+percent);
//        System.out.println("length:"+length);
//        System.out.println("totalLength:"+totalLength);
//        System.out.println("velocity:"+velocity);
//        System.out.println("time:"+time);
//        System.out.println("totalTime:"+totalTime);
//        System.out.println("timeLeft:"+timeLeft);
//        System.out.println("fileNumber:"+status.getItems());

        JSONObject jsonObject = new JSONObject();


        jsonObject.put("percent", String.valueOf(percent));
        jsonObject.put("length", String.valueOf(length));
        jsonObject.put("totalLength", String.valueOf(totalLength));
        jsonObject.put("velocity", String.valueOf(velocity));
        jsonObject.put("time", String.valueOf(time));
        jsonObject.put("totalTime", String.valueOf(totalTime));
        jsonObject.put("timeLeft", String.valueOf(timeLeft));
        jsonObject.put("fileNumber", String.valueOf(status.getItems()));

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

    public File getResource() {
        return resource;
    }

    public void setResource(File resource) {
        this.resource = resource;
    }

    public String getResourceFileName() {
        return resourceFileName;
    }

    public void setResourceFileName(String resourceFileName) {
        this.resourceFileName = resourceFileName;
    }

    public String getResourceContentType() {
        return resourceContentType;
    }

    public void setResourceContentType(String resourceContentType) {
        this.resourceContentType = resourceContentType;
    }
}
