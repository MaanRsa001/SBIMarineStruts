package com.maan.webservice;
/**
 * Created By Ahamed Ibrahim  on 14/12/2017
 * */
import com.maan.webservice.dao.VatPremiumDAO;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class VatPremiumCalc {
	VatPremiumDAO dao=new VatPremiumDAO();
	DecimalFormat df1 = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
	public String vatApplicableYn(String orgCountry,String destCountry,String policyType, String productId){
		String result="N";
		try {
			if("11".equalsIgnoreCase(productId) || "3".equalsIgnoreCase(productId)){
				String countryId="E".equalsIgnoreCase(policyType)?destCountry:orgCountry;

				if("C".equalsIgnoreCase(policyType)){
					result="N";
				}else if("L".equalsIgnoreCase(policyType)){
					result="Y";
				}else if(dao.getVatApplicableForGCC(countryId)){
					result="Y";
				}else{
					result="N";
				}
			}else{
				result="Y";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	public void calculateVatTax(String quoteNo,String productId,String orgCountry,String destCountry,String branchCode,String premium,String commision, String vatApplicableYN, String policyStartDt){
		
		String type="";
		String typeString="";
		String vatApplicable="";
		String vatPercentage="";
		String vatBroPercentage="0";
		double vatInputAmt=0.0;
		double vatOutputAmt=0.0;
		try {
			if("11".equalsIgnoreCase(productId) || "3".equalsIgnoreCase(productId)){

				if("1".equals(orgCountry)&& "1".equals(destCountry)){
					type="INLAND";
					typeString="In Land";
				}else if("1".equals(orgCountry)&& !"1".equals(destCountry)){
					type="GCC";
					typeString="Export";
				}else if(!"1".equals(orgCountry)&& "1".equals(destCountry)){
					type="GCC";
					typeString="Import";
				}else{
					type="OGCC";
					typeString="Cross Voyage";
				}
			}
			/*if("Y".equalsIgnoreCase(vatApplicableYN)||"".equalsIgnoreCase(vatApplicableYN)){
				vatApplicable=vatApplicableYn(orgCountry, destCountry, type,productId);
			}else{
				vatApplicable="N";
			}*/
			
			vatApplicable="Y";


			if("Y".equalsIgnoreCase(vatApplicable)){
				vatPercentage=dao.getVatPercentage(policyStartDt);
				vatBroPercentage=vatPercentage;

			}else{
				vatPercentage="0"; 
				if("C".equalsIgnoreCase(type)){
					vatBroPercentage=dao.getVatPercentage(policyStartDt);
				}
			}



			vatInputAmt=(Double.parseDouble((StringUtils.isBlank(premium))?"0":premium) * Double.parseDouble(vatPercentage))/100;
			vatOutputAmt=(Double.parseDouble((StringUtils.isBlank(commision))?"0":commision) * Double.parseDouble(vatBroPercentage) )/100;
			/*vatInputAmt=Math.round(vatInputAmt);
			vatOutputAmt=Math.round(vatOutputAmt);*/
			insertVatInfo(quoteNo, productId, vatInputAmt, vatOutputAmt, typeString,vatPercentage,vatBroPercentage);
			String totalPremium=String.valueOf(Double.parseDouble(premium)+vatInputAmt);
			if("11".equalsIgnoreCase(productId) || "3".equalsIgnoreCase(productId)){
				updateMarinedata(quoteNo, vatInputAmt, vatOutputAmt,vatPercentage,totalPremium,type);
			}else{
				updateHpmVat(quoteNo, vatInputAmt, vatOutputAmt,vatPercentage,totalPremium);
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void updateHpmVat(String quoteNo, double vatInputAmt,
			double vatOutputAmt, String vatPercentage, String totalPremium) {
		dao.insertVatInfo("UPDATE_VAT_HPM",  new Object[]{totalPremium,vatPercentage,vatInputAmt,vatOutputAmt,quoteNo});
		
	}
	public void updateMarinedata(String quoteNo, double vatInputAmt,double vatOutputAmt,String vatPercentage, String premium, String type){
		try {
			dao.insertVatInfo("UPDATE_VAT_MD",  new Object[]{vatPercentage,vatInputAmt,vatOutputAmt,vatPercentage,type,quoteNo});
			dao.insertVatInfo("UPDATE_VAT_PM",  new Object[]{premium,quoteNo});
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	public void insertVatInfo(String quoteNo,String productId,double vatInputAmt,double vatOutputAmt,String policyType,String vatPercentage, String vatBroPercentage){
		try {
			Map<String,Object>getVatInfo =new HashMap<String, Object>();
			if("11".equalsIgnoreCase(productId) || "3".equalsIgnoreCase(productId)){
				getVatInfo=dao.getResultMap("GET_VAT_INFO", new String[]{quoteNo});
			}else{
				getVatInfo=dao.getResultMap("GET_VAT_INFO_HPM", new String[]{quoteNo});
				
			}
			
			dao.insertVatInfo("DEL_VAT_INFO",  new Object[]{quoteNo});
			
			
			Object[] obj =new Object[11];

			obj[0]=quoteNo;//getVatInfo.get("")
			obj[1]=productId;
			obj[2]=getVatInfo.get("MISSIPPI_CUSTOMER_CODE")==null?"":getVatInfo.get("MISSIPPI_CUSTOMER_CODE").toString();
			obj[3]=getVatInfo.get("CUST_VAT_REG_NO")==null?"":getVatInfo.get("CUST_VAT_REG_NO").toString();
			obj[4]=vatInputAmt>=0?vatPercentage:vatBroPercentage;//getVatInfo.get("") 
			obj[5]=vatInputAmt;
			obj[6]=policyType;
			obj[7]=getVatInfo.get("ORG_COUNTRY")==null?"":getVatInfo.get("ORG_COUNTRY").toString();
			obj[8]=getVatInfo.get("DEST_COUNTRY")==null?"":getVatInfo.get("DEST_COUNTRY").toString();
			obj[9]=vatInputAmt>=0?"OP":"IP";
			obj[10]=vatInputAmt>0?"C":"B";
			//Insert vat input data
			dao.insertVatInfo("INSERT_VAT_INFO", obj);
			String bdm=getVatInfo.get("AC_EXECUTIVE_ID")==null?"":getVatInfo.get("AC_EXECUTIVE_ID").toString();
			if("5".equalsIgnoreCase(bdm)){
				obj[2]=getVatInfo.get("RSA_BROKER_CODE")==null?"":getVatInfo.get("RSA_BROKER_CODE").toString();
				obj[3]=getVatInfo.get("BROKER_VAT_REG_NO")==null?"":getVatInfo.get("BROKER_VAT_REG_NO").toString();
			}else{
				obj[2]=getVatInfo.get("BDM_CODE")==null?"":getVatInfo.get("BDM_CODE").toString();
				obj[3]=getVatInfo.get("BDM_VAT_REG_NO")==null?"":getVatInfo.get("BDM_VAT_REG_NO").toString();
			}
			obj[4]=vatInputAmt>=0?vatBroPercentage:vatPercentage;
			obj[5]=vatOutputAmt;
			obj[9]=vatInputAmt>=0?"IP":"OP";
			obj[10]=vatInputAmt<0?"C":"B";
			//Insert vat output  data
			dao.insertVatInfo("INSERT_VAT_INFO", obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateMarineVatinfo(String quoteNo, String branchCode,String productId) {
		try {
			Map<String,Object>getVatInfo =new HashMap<String, Object>();
			getVatInfo=dao.getResultMap("GET_VAT_INFO", new String[]{quoteNo});
			String bdm=getVatInfo.get("COMMISSION_VAT_YN")==null?"":getVatInfo.get("COMMISSION_VAT_YN").toString();
			String orgCountry=getVatInfo.get("TRANSIT_FROM_COUNTRY_ID")==null?"":getVatInfo.get("TRANSIT_FROM_COUNTRY_ID").toString();
			String destCountry=getVatInfo.get("FINAL_DESTINATION_COUNTRY_ID")==null?"":getVatInfo.get("FINAL_DESTINATION_COUNTRY_ID").toString();
			String totalPremium=getVatInfo.get("NET_PREMIUM")==null?"":getVatInfo.get("NET_PREMIUM").toString();
			String commission=getVatInfo.get("COMMISSION")==null?"":getVatInfo.get("COMMISSION").toString();
			String vatApplicable=getVatInfo.get("VAT_APPLICABLE")==null?"":getVatInfo.get("VAT_APPLICABLE").toString();
			String policyStartDt=getVatInfo.get("POL_START_DATE")==null?"":getVatInfo.get("POL_START_DATE").toString();
			if(!"Y".equalsIgnoreCase(bdm)){
				commission="0";
			}
			calculateVatTax(quoteNo, productId, orgCountry, destCountry, branchCode, totalPremium, commission,vatApplicable,policyStartDt);

		} catch (Exception e) {
			e.printStackTrace();
		}


	}
	public void updateTravelMotorVatinfo(String quoteNo, String branchCode,String productId){
		Map<String,Object>getVatInfo =new HashMap<String, Object>();
		getVatInfo=dao.getResultMap("GET_VAT_INFO_HPM", new String[]{quoteNo});
		String totalPremium=getVatInfo.get("NET_PREMIUM")==null?"":getVatInfo.get("NET_PREMIUM").toString();
		String commission=getVatInfo.get("COMMISSION")==null?"":getVatInfo.get("COMMISSION").toString();
		String vatApplicable=getVatInfo.get("VAT_APPLICABLE")==null?"":getVatInfo.get("VAT_APPLICABLE").toString();
		String policyStartDt=getVatInfo.get("POL_START_DATE")==null?"":getVatInfo.get("POL_START_DATE").toString();
		String bdm=getVatInfo.get("COMMISSION_VAT_YN")==null?"":getVatInfo.get("COMMISSION_VAT_YN").toString();
		
		if(!"Y".equalsIgnoreCase(bdm)){
			commission="0";
		}
		calculateVatTax(quoteNo, productId, "", "", branchCode, totalPremium, commission,vatApplicable,policyStartDt);

	}
}


