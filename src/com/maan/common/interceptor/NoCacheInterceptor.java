package com.maan.common.interceptor;

import com.maan.common.LogUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.Logger;
import org.apache.struts2.StrutsStatics;

public class NoCacheInterceptor implements Interceptor {

	private static final long serialVersionUID = 1321L;
	private static final Logger logger = LogUtil.getLogger(NoCacheInterceptor.class);
	
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext context = actionInvocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest)context.get(StrutsStatics.HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse) context.get(StrutsStatics.HTTP_RESPONSE);
        HttpSession ses = request.getSession(false);
        logger.info("SBI NoCache interceptor Before Action Invoke => "+ses);
        String sessionid = "";
        String result = null;
        if(ses!=null){
            sessionid = ses.getId();
        }
        if(response!=null){
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "-1");
            response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; SameSite=Strict; HttpOnly;Secure");
            response.setHeader("X-Frame-Options", "deny");
            response.setHeader("X-Content-Type-Options", "nosniff");
            response.setHeader("X-XSS-Protection", "1; mode=block");
            //response.setHeader("Content-Security-Policy", "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self';");
        }
        result = (result==null?actionInvocation.invoke():result);
       logger.info("SBI NoCache interceptor after Action Invoke => "+ses);
        return result;
    }

    public void destroy() {
        
    }

    public void init() {
        
    }
}
