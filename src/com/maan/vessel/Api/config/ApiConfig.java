package com.maan.vessel.Api.config;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import com.google.gson.Gson;
import com.maan.common.ResourceLocator;

public class ApiConfig {

	
	private static Map<String,String> tableRef=new HashMap<String,String>();
	private static ResourceBundle bundle = ResourceLocator.getWebservice();
	protected  Gson converter=new Gson();
	public String getValueFromWebservice(String key) {
		String string = tableRef.get(key);
			if(string==null || string.length()==0) {
				string=bundle.getString(key);
				tableRef.put(key, string);
			}  
		return string;
	}
	
	
	protected String callAPIPost(String Link,String authorization,String request){
		try{
			System.out.println("request:"+request);
			StringEntity entity = new StringEntity(request,"UTF-8");
			CloseableHttpClient httpclient = HttpClients.createDefault();			 
			HttpPost httpPost = new HttpPost(Link); 
			httpPost.setHeader("Content-type", "application/json; charset=utf-8"); 
			httpPost.setHeader("Authorization", authorization); 
			httpPost.setEntity(entity);	
			CloseableHttpResponse response = httpclient.execute(httpPost); 
			if(response.getStatusLine().getStatusCode()<=400 || response.getStatusLine().getStatusCode()==403 ){
				BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
				StringBuffer responseAsString = new StringBuffer();
				String line = "";
				while ((line = rd.readLine()) != null) {
					responseAsString.append(line);
				}
				System.out.println(responseAsString.toString());
				return responseAsString.toString();
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected String callAPIGet(String Link,String authorization){
		try{
			System.out.println("request:"+Link);
			 
			CloseableHttpClient httpclient = HttpClients.createDefault();			 
			HttpGet httpPost = new HttpGet(Link); 
			httpPost.setHeader("Content-type", "application/json; charset=utf-8"); 
			httpPost.setHeader("Authorization", authorization); 
			 
			CloseableHttpResponse response = httpclient.execute(httpPost); 
			if(response.getStatusLine().getStatusCode()<=400){
				BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
				StringBuffer responseAsString = new StringBuffer();
				String line = "";
				while ((line = rd.readLine()) != null) {
					responseAsString.append(line);
				}
				return responseAsString.toString();
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected String callAPIPost(String Link,String authorization){
		try{
			System.out.println("request:"+Link);
			 
			CloseableHttpClient httpclient = HttpClients.createDefault();			 
			HttpPost httpPost = new HttpPost(Link); 
			httpPost.setHeader("Content-type", "application/json; charset=utf-8"); 
			httpPost.setHeader("Authorization", authorization); 
			 
			CloseableHttpResponse response = httpclient.execute(httpPost); 
			if(response.getStatusLine().getStatusCode()<=400){
				BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
				StringBuffer responseAsString = new StringBuffer();
				String line = new String();
				while ((line = rd.readLine()) != null) {
					responseAsString.append(line);
				}
				System.out.println(responseAsString.toString());
				return responseAsString.toString();
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	protected synchronized String getActualLink(String content,Map<String,Object> hmap) {
		if(StringUtils.isNotBlank(content)){
			for (Entry<String, Object> entry : hmap.entrySet()) {	
				if("driverdetails".equalsIgnoreCase(entry.getKey()))
					content = content.replaceAll("<"+entry.getKey()+">", String.valueOf(entry.getValue()==null?"":entry.getValue()));
				else
					content = content.replaceAll("<"+entry.getKey()+">", String.valueOf(entry.getValue()==null?"":entry.getValue()).replaceAll("\"", " \\\\\\\\\""));
		    }
		}
		return content;
	}

}
