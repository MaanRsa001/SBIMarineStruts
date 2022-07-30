package com.maan.common;

 
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.logging.log4j.Logger;

public final class ResourceLocator {
	final static Logger logger = LogUtil.getLogger(ResourceLocator.class);
	
  private static ResourceLocator instance=new ResourceLocator();  
  private static ResourceBundle commonBundle=null;
  //private final static String source="MSSQL";	
  private final static String source="ORACLE";
  private static ResourceBundle webservice;
  private static final String DB_QUERY_PROPERTY_FILE = "MSSQLQuery";
  private static final String APPLICATION_CONSTANTS = "ApplicationConstants";
  private static final String CUSTOMER_PROPERTY_FILE = "com.maan.customer.package";
  private static final String TRAVEL_PROPERTY_FILE = "com.maan.Travel.controller.package";
  private static final String MOTOR_PROPERTY_FILE = "com.maan.Motor.controller.tameenipackage";
  private static final String HOME_PROPERTY_FILE = "com.maan.Home.Controller.package"; 
  private static final String USERMGT_PROPERTY_FILE = "com.maan.userMgt.package";
  private static final String CLAIM_PROPERTY_FILE = "com.maan.Motor.Claim.package";
  private static final String APP_FILE_NAMES_PROPERTY_FILE = "app_field_names";
  private static final String TAMEENI_PROPERTY_FILE = "com.maan.Motor.controller.tameenipackage";
  private ResourceLocator(){
	  
  }
  
  public static ResourceLocator getInstance(){	  
	  return instance;
  }  

  public ResourceBundle getBundle(){
	  return commonBundle;
  }
  public String getSource(){
	  return source;
  }    
  public final ResourceBundle getDBBundle() {
		ResourceBundle dbBundle=null;
		try {
			dbBundle=ResourceBundle.getBundle(DB_QUERY_PROPERTY_FILE);
		} catch(MissingResourceException e){

		}
		return dbBundle;
	}
	public final ResourceBundle getAppConstantsBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(APPLICATION_CONSTANTS);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public final ResourceBundle getCustomerBundle() {

		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(CUSTOMER_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public final ResourceBundle getTravelBundle() {

		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(TRAVEL_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public final ResourceBundle getMotorBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(MOTOR_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public final ResourceBundle getTameeniMotorBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(TAMEENI_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	
	public final ResourceBundle getHomeBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(HOME_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public final ResourceBundle getUserMgtBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(USERMGT_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	
	public final ResourceBundle getClaimBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(CLAIM_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	
	public final ResourceBundle getAppFieldNamesBundle() {
		ResourceBundle dbBundle=null;
		try{
			dbBundle=ResourceBundle.getBundle(APP_FILE_NAMES_PROPERTY_FILE);
		}
		catch(MissingResourceException e){
			logger.debug(e);
		}
		return dbBundle;
	}
	public static   ResourceBundle getApiLinkWebservice() {
		
		  ResourceBundle dbBundle=null;
		  try{
			  dbBundle=ResourceBundle.getBundle(DBConstants.WEBSERVICE);
		  }
		  catch(MissingResourceException e){
			  logger.debug(e);
		  }
		  return dbBundle;
	  }
	public static ResourceBundle getWebservice() {
		return webservice;
	}
static {
	  if("ORACLE".equals(source))
		  commonBundle=ResourceBundle.getBundle(DBConstants.DB_QUERY_PROPERTY_FILE);
	  else
		  commonBundle=ResourceBundle.getBundle(DBConstants.MSSQL_MOTORQUERY_PROPERTY_FILE);
	  
	  webservice=ResourceBundle.getBundle(DBConstants.WEBSERVICE);
  }	
}
