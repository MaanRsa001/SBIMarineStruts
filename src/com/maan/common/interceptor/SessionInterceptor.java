package com.maan.common.interceptor;
import com.maan.common.LogUtil;
import com.opensymphony.xwork2.ActionContext;
/**
 * @author Raja.K
*
* Common Login Template
*/
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.Logger;
import org.apache.struts2.StrutsStatics;
public class SessionInterceptor  implements Interceptor {

	private static final long serialVersionUID = 11742585L;
	private static final Logger logger = LogUtil.getLogger(SessionInterceptor.class);
      
   public String intercept(ActionInvocation actionInvocation) throws Exception {
		final ActionContext context = actionInvocation.getInvocationContext();
        logger.info("AlRajhi session interceptor Before Action Invoke => "+context);
		try{
	   	    HttpServletResponse response = (HttpServletResponse) context.get(StrutsStatics.HTTP_RESPONSE);
	        HttpServletRequest request = (HttpServletRequest)context.get(StrutsStatics.HTTP_REQUEST);
	   	    HttpSession ses = request.getSession(false);
	   	    String sessId = "";
	        if(ses!=null){
	        	sessId = ses.getId();
	        }
	        if(response!=null){
		        response.setHeader("SET-COOKIE", "JSESSIONID=" + sessId + "; SameSite=Strict; Secure; HttpOnly;Secure");
	            response.setHeader("X-Frame-Options", "deny");
	            response.setHeader("X-Content-Type-Options", "nosniff");
	            response.setHeader("X-XSS-Protection", "1; mode=block");
	            //response.setHeader("Content-Security-Policy", "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self';");
	        }
	    }catch(Exception e){
	    	e.printStackTrace();
		}
		
	    Map<String, Object> session = context.getSession();
	    String result;
       if(session.get("user") == null) {
            result = "session";
       }else{
           result = actionInvocation.invoke();
       }

       logger.info("AlRajhi session interceptor after Action Invoke => "+context);
       return result;
   }

   public void destroy() {
       
   }

   public void init() {
       
   }
} 
