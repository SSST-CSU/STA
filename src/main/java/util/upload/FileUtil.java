package util.upload;

import java.io.File;

/**
 * Created by martsforever on 2016/2/24.
 */
public class FileUtil {
    public static boolean deleteFile(String path) {
        boolean flag = false;
        File file = new File(path);
        if (file.isFile() && file.exists()) {
            file.delete();
            flag = true;
        }
        return flag;
    }
}
