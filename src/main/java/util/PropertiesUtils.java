package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

// 关于Properties类常用的操作
public class PropertiesUtils {
	private final static String PROPERTIES_FILE_NAME = "config.properties";

	// 根据Key读取Value
	public static String get(String key) {
		Properties pps = new Properties();
		try {
			InputStream in = PropertiesUtils.class.getClassLoader().getResourceAsStream(PROPERTIES_FILE_NAME);
			pps.load(in);
			String value = pps.getProperty(key);
			// System.out.println(key + " = " + value);
			return value;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
