package com.maan.common;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionContext;

public class Token{
	final static Logger logger = LogUtil.getLogger(Token.class);
	
	
	public static boolean save(DefaultValue dv) {
		boolean isSuccess = true;
		try {
			Map<String, Object> session=ActionContext.getContext().getSession();
			if(StringUtils.isNotBlank(dv.getToken())) {
				session.put("TOKEN_SPRING", dv.getToken()==null?"":dv.getToken());
			}else {
				throw new Exception("Token is not available in Response");
			}
		}catch(Exception e) {
			isSuccess = false;
			logger.info("Exception @ Token.save(): "+e);
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static String value() {
		String token = "";
		try {
			Map<String, Object> session=ActionContext.getContext().getSession();
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
		}catch(Exception e) {
			logger.info("Exception @ Token.value(): "+e);
			e.printStackTrace();
		}
		return token;
	}
	

}
