package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForDestCountry extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForDestCountry.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForDestCountry(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Object call() throws Exception {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		String destcountryId="",destcountryName="",authorization="";
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			if(StringUtils.isNotBlank(bean.getSpringtoken())) {
				authorization= "Bearer " + bean.getSpringtoken();
			}else {
				authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			}
			hp.put("ProposalNo", bean.getProposalNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo = (JSONObject) json.get("Result");
				JSONArray array= (JSONArray) jo.get("DestinationCountryInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					destcountryId=destcountryId+","+jsonObj.get("CountryId");
					destcountryName=destcountryName+","+jsonObj.get("CountryName");
					}
					destcountryName=destcountryName.replaceFirst(",", "");
					destcountryId=destcountryId.replaceFirst(",", "");
					bean.setTransit_countryId(destcountryId);
					bean.setCountryIds(destcountryId);
					bean.setDestination_country(destcountryName);
					bean.setTotalDestinationId(String.valueOf(array.size()));
					//bean.setTotalTransitId(String.valueOf(array.size()));
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	public Object savedestcountry() {
		try {
			JSONObject json,jo1 = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			if(StringUtils.isNotBlank(bean.getDestination_countryId())) {
			List<String>country=new ArrayList<String>(Arrays.asList(bean.getDestination_countryId().split(",")));
			List<String>countryDes=new ArrayList<String>(Arrays.asList(bean.getDestination_country().split(",")));
			for (int i = 0; i < country.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("CountryId", country.get(i));
				obj.put("CountryName", countryDes.get(i));
				arr.add(obj);
				
			}
			}
			
			hp.put("DestinationCountryInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForDestCountry editdestcountry=new ApiForDestCountry(bean,"editdestcountry");
				editdestcountry.call();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
}
