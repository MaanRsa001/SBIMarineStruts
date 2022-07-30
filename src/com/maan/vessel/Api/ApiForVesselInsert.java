package com.maan.vessel.Api;

import java.util.concurrent.Callable;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import com.maan.vessel.VesselBean;
import com.maan.vessel.Api.config.ApiConfig;
import com.maan.vessel.Api.res.ShipByExNameRes;
import com.maan.vessel.Api.res.ShipByIHSLRorIMORes;
import com.maan.vessel.Api.res.ShipByNameRes;
public class ApiForVesselInsert extends ApiConfig implements Callable<Object> {
	private String requestfor;
	private String request;
	private String imoNumber;
	public ApiForVesselInsert(String imoNumber,String requestfor) {
		this.imoNumber=imoNumber;
		this.requestfor=requestfor.toLowerCase();
		
		
	}
	
	

	@SuppressWarnings("unchecked")
	@Override
	public Object call() throws Exception {
		try {
			
			JSONObject hp = new JSONObject();
			hp.put("IHSLRORIMO",imoNumber.trim());
						
			String link=getValueFromWebservice("maan.client.vesselsearch."+requestfor);
			
			String authorization=getValueFromWebservice("maan.client.vesselsearch.auth");
			request=getValueFromWebservice("maan.client.vesselsearch."+requestfor+".request");
			String requestStr=getActualLink(request,hp);	
			String responseStr=callAPIPost(link, authorization, requestStr);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
