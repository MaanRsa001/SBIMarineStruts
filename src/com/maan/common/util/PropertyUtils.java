package com.maan.common.util;

import java.io.ByteArrayInputStream;
import java.util.Properties;

public class PropertyUtils {
	private static Properties properties=null;
	private PropertyUtils(){
		
	}
	public static String getProperty(String key){
		String value="";
		ByteArrayInputStream bais=null;
		try {
			if(properties==null){
				synchronized (PropertyUtils.class) {
					if(properties==null){
						bais= (ByteArrayInputStream) PropertyUtils.class.getResourceAsStream("/app_field_names.properties");
						properties=new Properties();
						properties.load(bais);
					}
				}
			}
			value=properties.getProperty(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
}