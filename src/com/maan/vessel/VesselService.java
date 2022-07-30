package com.maan.vessel;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.maan.common.LogUtil;
import com.maan.report.api.ReportApiCaller;
import com.maan.vessel.Api.ApiForVesselInsert;
import com.maan.vessel.Api.ApiForVesselSearch;

public class VesselService {
	ReportApiCaller dao=new ReportApiCaller();
	final Logger logger = LogUtil.getLogger(VesselService.class);
	public void veseelSearch(VesselBean bean) {
		try {
			ApiForVesselSearch grid=null;		
				grid=new ApiForVesselSearch(bean,"vesselSearch");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertVesselInfo(String imoNumber) {
		try {
			ApiForVesselInsert grid=null;		
				grid=new ApiForVesselInsert(imoNumber,"vesselinsert");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public void shipLocation(VesselBean bean) {
		try {
			List<Map<String, Object>> sdl = dao.shipDetails(bean.getStartDate(),bean.getEndDate(),bean.getPolicyNumber(),bean.getQuoteNumber(),bean.getImoNumber());
			if(sdl != null && sdl.size()>0) {
				JSONArray jsonArr = new JSONArray();
				for(Map<String,Object> sdm : sdl) {
					if(sdm != null && sdm.size()>0) {
						
						String imoNo = sdm.get("ImoNumber")==null?"":sdm.get("ImoNumber").toString();
						String regOwner = sdm.get("OwnerName")==null?"":sdm.get("OwnerName").toString();
						String regQwnerDomCount = sdm.get("OwnerCountry")==null?"":sdm.get("OwnerCountry").toString();
						String flagName = sdm.get("Flag")==null?"":sdm.get("Flag").toString();
						String shipName = sdm.get("ShipName")==null?"":sdm.get("ShipName").toString();
						String vesselType = sdm.get("VesselType")==null?"":sdm.get("VesselType").toString();
						String destination = sdm.get("Destination")==null?"":sdm.get("Destination").toString();
						String status = sdm.get("Status")==null?"":sdm.get("Status").toString();
						String eta = sdm.get("Eta")==null?"":sdm.get("Eta").toString();
						String lat = sdm.get("Latitude")==null?"":sdm.get("Latitude").toString();
						String lon = sdm.get("Longitude")==null?"":sdm.get("Longitude").toString();
						String entryDate = sdm.get("EntryDate")==null?"":sdm.get("EntryDate").toString();
						String policyNo = sdm.get("PolicyNo")==null?"":sdm.get("PolicyNo").toString();
						String quoteNo = sdm.get("QuoteNo")==null?"":sdm.get("QuoteNo").toString();
						String polStartDate = sdm.get("PolStartDate")==null?"":sdm.get("PolStartDate").toString();
						String sumInsured = sdm.get("TotalSumInsured")==null?"":sdm.get("TotalSumInsured").toString();
						String currencyName = sdm.get("CurrencyName")==null?"":sdm.get("CurrencyName").toString();
						String mot = sdm.get("ModeofTransport")==null?"":sdm.get("ModeofTransport").toString();
						String originCount = sdm.get("OriginatingCountry")==null?"":sdm.get("OriginatingCountry").toString();
						String destCount = sdm.get("DestinatingCountry")==null?"":sdm.get("DestinatingCountry").toString();
						String originCity = sdm.get("OriginCity")==null?"":sdm.get("OriginCity").toString();
						String destCity = sdm.get("DestCity")==null?"":sdm.get("DestCity").toString();
						String custName = sdm.get("CustName")==null?"":sdm.get("CustName").toString();
						String coverage = sdm.get("Coverage")==null?"":sdm.get("Coverage").toString();
						
						String popUpContent = 
								"<div><h3>Ship Details&nbsp;&nbsp;"+(StringUtils.isNotBlank(entryDate)?"(Last Updated On "+entryDate+")":"")+"</h3></div>" + 
								"<div>" + 
									"<table>" + 
										"<tr><td><b>IMO No :</b> "+imoNo+"</td> <td>  </td> <td><b>Ship Name :</b> "+shipName+"</td></tr>" +  
										"<tr><td><b>Latitude :</b> "+lat+"</td> <td>  </td> <td><b>Longitude :</b> "+lon+"</td></tr>" +
										"<tr><td><b>Owner Name :</b> "+regOwner+"</td> <td>  </td> <td><b>Owner Domiciled Country :</b> "+regQwnerDomCount+"</td></tr>" +  
										"<tr><td><b>Flag :</b> "+flagName+"</td> <td>  </td> <td><b> Last Port She Sailed From :</b>  </td></tr>" +
										"<tr><td><b>Vessel Type :</b> "+vesselType+"</td> <td>  </td> <td><b>Destination :</b> "+destination+"</td></tr>" + 
										"<tr><td><b>Status :</b> "+status+"</td><td>  </td><td><b>ETA :</b> "+eta+"</td></tr>" + 
									"</table>" + 
								"</div>" + 
								"<div><h3>Policy Details</h3></div>" + 
								"<div>" + 
									"<table>" + 
										"<tr><td><b>Policy No :</b> "+policyNo+"</td><td>  </td><td><b>Quote No :</b> "+quoteNo+"</td></tr>" + 
										"<tr><td><b>Policy Start Date :</b> "+polStartDate+"</td><td>  </td><td><b>Customer Name :</b> "+custName+"</td></tr>" + 
										"<tr><td><b>Sum Insured :</b> "+sumInsured+"</td><td>  </td><td><b>Currency :</b> "+currencyName+"</td></tr>" + 
										"<tr><td><b>Mode Of Transport :</b> "+mot+"</td><td>  </td><td><b>Coverage :</b> "+coverage+"</td></tr>" + 
										"<tr><td><b>Origin Country :</b> "+originCount+"</td><td>  </td><td><b>Destination Country :</b> "+destCount+"</td></tr>" + 
										"<tr><td><b>Origin City :</b> "+originCity+"</td><td>  </td><td><b>Destination City :</b> "+destCity+"</td></tr>" + 
									"</table>" + 
								"</div>";
						if(StringUtils.isNotBlank(lat) && StringUtils.isNotBlank(lon)) {
							JSONObject jsonObj = new JSONObject();
							jsonObj.put("lat", lat);
							jsonObj.put("lon", lon);
							jsonObj.put("infoWind", popUpContent);
							jsonArr.add(jsonObj);
						}
					}
				}
				String resultJsonStr = jsonArr.toJSONString();
				logger.info("LocationService.shipLocation() Result JSON String : "+resultJsonStr);
				bean.setMapLoc(jsonArr.toJSONString());
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ LocationService.shipLocation() : "+e);
			e.printStackTrace();
		}
	}
}
