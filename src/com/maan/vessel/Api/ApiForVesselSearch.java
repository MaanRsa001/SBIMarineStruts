package com.maan.vessel.Api;

import java.util.concurrent.Callable;

import org.json.simple.JSONObject;
import com.maan.vessel.VesselBean;
import com.maan.vessel.Api.config.ApiConfig;
import com.maan.vessel.Api.res.ShipByExNameRes;
import com.maan.vessel.Api.res.ShipByIHSLRorIMORes;
import com.maan.vessel.Api.res.ShipByNameRes;
public class ApiForVesselSearch extends ApiConfig implements Callable<Object> {
	private VesselBean bean;
	private String requestfor;
	private String request;
	public ApiForVesselSearch(VesselBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
		
		
	}
	
	

	@SuppressWarnings("unchecked")
	@Override
	public Object call() throws Exception {
		try {
			
			JSONObject hp = new JSONObject();
			if("imo".equalsIgnoreCase(bean.getSearchBy())) {
			hp.put("IHSLRORIMO",bean.getiHSLRORIMO().trim());
			}else if("name".equalsIgnoreCase(bean.getSearchBy())) {
				hp.put("ShipsCategory",bean.getShipsCategory().trim());
				hp.put("NameString",bean.getNameString().trim());
				
			}else if("exname".equalsIgnoreCase(bean.getSearchBy())) {
				hp.put("ShipsCategory",bean.getExshipsCategory().trim());
				hp.put("ExNameString",bean.getExNameString().trim());
			}
			
			
			String link=getValueFromWebservice("maan.client.vesselsearch."+bean.getSearchBy());
			
			String authorization=getValueFromWebservice("maan.client.vesselsearch.auth");
			request=getValueFromWebservice("maan.client.vesselsearch."+bean.getSearchBy()+".request");
			String requestStr=getActualLink(request,hp);	
			String responseStr=callAPIPost(link, authorization, requestStr);
			if(responseStr!=null && responseStr.length()>0) {
				if("imo".equalsIgnoreCase(bean.getSearchBy())) {
					
					ShipByIHSLRorIMORes resp=new ShipByIHSLRorIMORes();
					resp=(ShipByIHSLRorIMORes) converter.fromJson(responseStr, resp.getClass());
					//List<Company> company = resp.getApsshipdetail().getCompany();
					bean.setComCompliance(resp.getApsshipdetail().getCompanycompliancedetails());
					bean.setComp(resp.getApsshipdetail().getCompany());
					
					bean.setShipByIHSLRorIMORes(resp);
				}else if("name".equalsIgnoreCase(bean.getSearchBy())) {
					ShipByNameRes resp=new ShipByNameRes();
					resp=(ShipByNameRes) converter.fromJson(responseStr, resp.getClass());
					bean.setShipByNameRes(resp);
					
					
				}else if("exname".equalsIgnoreCase(bean.getSearchBy())) {
					ShipByExNameRes resp=new ShipByExNameRes();
					resp=(ShipByExNameRes) converter.fromJson(responseStr, resp.getClass());
					bean.setShipByExNameRes(resp);
				}
				//Object obj = new JSONParser().parse(responseStr);
				//JSONObject jo = (JSONObject) obj;
				//JSONArray errors = (JSONArray) jo.get("Ships");
				//bean.setError((List<HashMap<String,Object>>)jo.get("Errors"));
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
