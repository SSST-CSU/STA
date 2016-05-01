package util;

import org.junit.Test;

import java.io.File;

/**
 * Created by martsforever on 2016/5/1 0001.
 */
public class PathUtil {

    public static String getImgPath(){
        String uploadPath = PropertiesUtils.get("img_path");
        String virtualPath = PropertiesUtils.get("virtual_path");
        return uploadPath.substring(uploadPath.indexOf(virtualPath)+1)+ File.separator;
    }

    public static String getResPath(){
        String uploadPath = PropertiesUtils.get("res_path");
        String virtualPath = PropertiesUtils.get("virtual_path");
        return uploadPath.substring(uploadPath.indexOf(virtualPath)+1)+ File.separator;
    }

    @Test
    public void test(){
        System.out.println(getResPath());
    }

}
