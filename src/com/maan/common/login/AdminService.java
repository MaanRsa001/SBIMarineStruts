package com.maan.common.login;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;

public class AdminService {
	AdminDAO dao=new AdminDAO();
	final static Logger logger = LogUtil.getLogger(AdminAction.class);
    
    public List <Object> getappList(){
    	return dao.getappList();
    }
    
    public Map<String,String> getmailList(final AdminAction aa){
    	return dao.getmailList(aa);
    }
    
    public int insertUser(Object obj[], String reqFrom){
    	 return dao.insertUser(obj, reqFrom);
    }
    
    public void mailSave(Object obj[]){
   	 dao.mailSave(obj);
   }
   
   public List <Object> getexistUser(String appId){
	   return dao.getexistUser(appId);
   }
   
   public List <Object> getUserInfo(final AdminAction ac,String userID, String appId){
	  return dao.getUserInfo(ac,userID, appId);
   }
   
   public int getLoginAvailable(String userID, String appIds){
  	 return dao.getLoginAvailable(userID, appIds);
   }
}