package com.maan.webservice.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import com.maan.DBCon.DBConnection;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MarineJdbcTemplate;
import com.maan.common.runner;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.dao.QuotationDAO;
import com.maan.quotation.model.CommonInfo;
import com.maan.report.dao.ReportDAO;
import com.maan.webservice.VatPremiumCalc;
import com.maan.webservice.WebServicePolicyInfo;
 
public class PolicyGenerationDAO extends MarineJdbcTemplate
{
	
	final static Logger logger = LogUtil.getLogger(PolicyGenerationDAO.class);
	public static String sql="";
	//Map<String, Object> session=ActionContext.getContext().getSession();
	//private String belongingBranch=(String)session.get("BelongingBranch");
	

	public boolean isEndt(String applicationNo) {
		try {
			CommonInfo cii = new CommonInfo();
			cii.setReferenceNo(applicationNo);
			QuotationApiCall qac = new QuotationApiCall();
			CommonInfo cio = qac.isEndorsement(cii);
			if(cio!=null) {
				return cio.isEndorsement();
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PolicyGenerationDAO.isEndt(): "+e);
			e.printStackTrace();
		}
		return false;
	}

	public WebServicePolicyInfo getPolicyInfo(String refNo)
	{
		logger.info("getPolicyInfo - Enter || refNo: "+refNo);
		WebServicePolicyInfo policyInfo=new WebServicePolicyInfo();
		String result[][]=new String[0][0];
		try 
		{
			result=runner.multipleSelection(getQuery("GET_POLICY_INFO"), new String[]{refNo});
			if(result!=null && result.length>0)
			{
				policyInfo.setBrokerCode(result[0][0]==null?"":result[0][0]);
				policyInfo.setRefNo(result[0][1]==null?"":result[0][1]);
				policyInfo.setType(result[0][2]==null?"":result[0][2]);
				policyInfo.setOpenCoverPolicyNo(result[0][3]==null?"":result[0][3]);
				policyInfo.setCustomerId(result[0][4]==null?"":result[0][4]);
				policyInfo.setCustomerName(result[0][5]==null?"":result[0][5]);
				policyInfo.setAddress1(result[0][6]==null?"":result[0][6]);
				policyInfo.setAddress2(result[0][7]==null?"":result[0][7]);
				policyInfo.setPoBox(result[0][8]==null?"":result[0][8]);
				policyInfo.setCountry(result[0][9]==null?"":result[0][9]);
				policyInfo.setEmirate(result[0][10]==null?"":result[0][10]);
				policyInfo.setMobileNo(result[0][11]==null?"":result[0][11]);
				policyInfo.setModeOfTransport(result[0][12]==null?"":result[0][12]);
				policyInfo.setOriginatingCountry(result[0][13]==null?"":result[0][13]);
				policyInfo.setDestinationCountry(result[0][14]==null?"":result[0][14]);
				policyInfo.setOriginatingCountryCity(result[0][15]==null?"":result[0][15]);
				policyInfo.setDestinationCountryCity(result[0][16]==null?"":result[0][16]);
				policyInfo.setOriginatingWareHouseCoverage(result[0][17]==null?"":result[0][17]);
				policyInfo.setDestinationWareHouseCoverage(result[0][18]==null?"":result[0][18]);
				policyInfo.setSaleTerm(result[0][19]==null?"":result[0][19]);
				policyInfo.setCurrency(result[0][20]==null?"":result[0][20]);
				policyInfo.setSettlingAgent(result[0][21]==null?"":result[0][21]);
				policyInfo.setTotalSumInsured(result[0][22]==null?"":result[0][22]);
				policyInfo.setPolicyStartDate(result[0][23]==null?"":result[0][23]);
				policyInfo.setSailingDate(result[0][24]==null?"":result[0][24]);
				policyInfo.setVesselName(result[0][25]==null?"":result[0][25]);
				policyInfo.setLcNumber(result[0][26]==null?"":result[0][26]);
				policyInfo.setIssuingBank(result[0][27]==null?"":result[0][27]);
				policyInfo.setLcDate(result[0][28]==null?"":result[0][28]);
				policyInfo.setPartialShipment(result[0][29]==null?"":result[0][29]);
				policyInfo.setBlAwbNumber(result[0][30]==null?"":result[0][30]);
				policyInfo.setBlAwbDate(result[0][31]==null?"":result[0][31]);
				policyInfo.setQuoteNo(result[0][32]==null?"":result[0][32]);
				policyInfo.setPremium(result[0][33]==null?"":result[0][33]);
				policyInfo.setPolicyNo(result[0][34]==null?"":result[0][34]);
				policyInfo.setRemarks("");
				policyInfo.setStatus("");
				policyInfo.setEndorsement(result[0][37]==null?"":result[0][37]);
				policyInfo.setClauses(result[0][38]==null?"":result[0][38]);
				policyInfo.setWarranties(result[0][39]==null?"":result[0][39]);
				policyInfo.setExclusions(result[0][40]==null?"":result[0][40]);
				policyInfo.setReceivedDate(result[0][41]==null?"":result[0][41]);
				policyInfo.setResponseTime(result[0][42]==null?"":result[0][42]);
				policyInfo.setPolicyFilePath(result[0][43]==null?"":result[0][43]);
				policyInfo.setApplicationNo(result[0][44]==null?"":result[0][44]);
				policyInfo.setCoverages(result[0][45]==null?"":result[0][45]);
				policyInfo.setSeaCoverages(result[0][46]==null?"":result[0][46]);
				policyInfo.setWsrcc(result[0][47]==null?"":result[0][47]);
				policyInfo.setProductId(result[0][48]==null?"":result[0][48]);
				policyInfo.setTolerance(result[0][49]==null?"4":result[0][49]);
				policyInfo.setPdfPremiumYN(result[0][50]==null?"":result[0][50]);
				policyInfo.setPdfBankerYN(result[0][51]==null?"":result[0][51]);
				policyInfo.setPdfGenerateStatus(result[0][52]==null?"":result[0][52]);
				policyInfo.setPdfBankerAssuredYN(result[0][53]==null?"":result[0][53]);
				policyInfo.setPdfCurrencyYN(result[0][54]==null?"":result[0][54]);
				policyInfo.setEmail(result[0][55]==null?"":result[0][55]);
				policyInfo.setClientCustomerId(result[0][56]==null?"":result[0][56]);
				policyInfo.setOriginatingCountryCityName(result[0][57]==null?"":result[0][57]);
				policyInfo.setDestinationCountryCityName(result[0][58]==null?"":result[0][58]);
				policyInfo.setNoteType(result[0][59]==null?"":result[0][59]);
				policyInfo.setPaymentMode(result[0][60]==null?"":result[0][60]);
				policyInfo.setBasisVal(result[0][61]==null?"":result[0][61]);
				policyInfo.setPackageType(result[0][62]==null?"":result[0][62]);
				policyInfo.setPdfRubberStampYN(result[0][63]==null?"":result[0][63]);
				policyInfo.setCustContractNo(result[0][64]==null?"":result[0][64]);
				policyInfo.setCustFmsCaseNo(result[0][65]==null?"":result[0][65]);
				policyInfo.setCustRefNo(result[0][66]==null?"":result[0][66]);
				policyInfo.setIssuer(result[0][67]==null?"":result[0][67]);
				policyInfo.setLoginId(result[0][68]==null?"":result[0][68]);
				policyInfo.setCustTitle(result[0][69]==null?"":result[0][69]);
				policyInfo.setCustCoreCode(result[0][70]==null?"":result[0][70]);
				policyInfo.setSettlingAgentName(result[0][71]==null?"":result[0][71]);
				policyInfo.setPartialShipmentAmount(result[0][72]==null?"":result[0][72]);
				policyInfo.setExposureCurrency(result[0][73]==null?"":result[0][73]);
				policyInfo.setExecutive(result[0][74]==null?"":result[0][74]);
				policyInfo.setAdminReferralYN(result[0][75]==null?"":result[0][75]);
				policyInfo.setAdminReferralRemarks(result[0][76]==null?"":result[0][76]);
				policyInfo.setVesselId(result[0][77]==null?"":result[0][77]);
				policyInfo.setCustArNo(result[0][78]==null?"":result[0][78]);
				policyInfo.setCertClausesYN(result[0][79]==null?"":result[0][79]);
				policyInfo.setExcessPremium(result[0][80]==null?"0":result[0][80]);
				policyInfo.setDebitCustomerId(result[0][81]==null?"":result[0][81]);
				policyInfo.setEndtPremYN(result[0][82]==null?"":result[0][82]);
				policyInfo.setEndtClausesYN(result[0][83]==null?"":result[0][83]);
				policyInfo.setPdfExcessYN(result[0][84]==null?"":result[0][84]);
				policyInfo.setPromotinalCode(result[0][85]==null?"":result[0][85]);
				policyInfo.setPromotinalDiscount(result[0][86]==null?"":result[0][86]);
				policyInfo.setBranchCode(result[0][87]==null?"":result[0][87]);

				policyInfo.setConsigneeDetail(result[0][88]==null?"":result[0][88]);
				policyInfo.setSpecialTerm(result[0][89]==null?"":result[0][89]);
				policyInfo.setAddCustomerName(result[0][90]==null?"":result[0][90]);
				policyInfo.setCoreCustomerName(result[0][91]==null?"":result[0][91]);
				policyInfo.setChannelType(result[0][92]==null?"":result[0][92]);
				policyInfo.setCurrencyValue(result[0][93]==null?"":result[0][93]);
				policyInfo.setVia(result[0][95]==null?"":result[0][95]);
				policyInfo.setCustVatRegNo(result[0][96]==null?"":result[0][96]);
				policyInfo.setCustomerNameAr(result[0][97]==null?"":result[0][97]);

				
				/*policyInfo.setLcAmount(result[0][91]==null?"":result[0][91]);
				policyInfo.setLcCurrency(result[0][92]==null?"":result[0][92]);
				policyInfo.setLcExchangeValue(result[0][93]==null?"":result[0][93]);*/
			}
			/*if("11".equals(policyInfo.getProductId()) && policyInfo.getLcNumber()!=null && !"".equals(policyInfo.getLcNumber())){
				List<Object> lcInfo=new QuotationDAO().lcSelectionList(policyInfo.getOpenCoverPolicyNo(), policyInfo.getLcNumber(),"Y");
				if(lcInfo!=null && lcInfo.size()>0){
					Map map=(Map)lcInfo.get(0);
					policyInfo.setLcAmount(map.get("LC_AMOUNT")==null?"":map.get("LC_AMOUNT").toString());
					policyInfo.setLcExchangeValue(map.get("LC_AMOUNT")==null?"":map.get("LC_AMOUNT").toString());
					policyInfo.setLcCurrency(map.get("LC_CURRENCY_ID")==null?"":map.get("LC_CURRENCY_ID").toString());
				}
			}*/

			String belongingBranch = getBelongingBranch(policyInfo.getBranchCode());
			if(policyInfo.getBrokerCode()!=null && policyInfo.getBrokerCode().length()>0)
			{
				result=runner.multipleSelection(getQuery("GET_BROKER_INFO"), new String[]{policyInfo.getBrokerCode()});
				if(result!=null && result.length>0)
				{
					if(policyInfo.getLoginId()==null || policyInfo.getLoginId().trim().length()==0){
						policyInfo.setLoginId(isNull(result[0][0]));
					}
					policyInfo.setBranchCode(isNull(result[0][1]));
					policyInfo.setCompanyId(isNull(result[0][2]));
				}
			}
			Map<String, Object> branchInfo = getResultMap("GET_BRANCH_INFO", new String[]{policyInfo.getBranchCode()});
			if(branchInfo!=null && !branchInfo.isEmpty())
			{
				policyInfo.setBrokerOriginatingCountryId(StringUtils.isBlank(branchInfo.get("ORIGINATION_COUNTRY_ID").toString())?"":branchInfo.get("ORIGINATION_COUNTRY_ID").toString());
				policyInfo.setBrokerDestinationCountryId(StringUtils.isBlank(branchInfo.get("DESTINATION_COUNTRY_ID").toString())?"":branchInfo.get("DESTINATION_COUNTRY_ID").toString());
				policyInfo.setBrokerDecimalPlace(StringUtils.isBlank(branchInfo.get("DECIMAL_PLACES").toString())?"0":branchInfo.get("DECIMAL_PLACES").toString());
				policyInfo.setBrokerCurrencyType(StringUtils.isBlank((String)branchInfo.get("CURR_NAME"))?"":(String)branchInfo.get("CURR_NAME"));
				policyInfo.setBrokerTax(StringUtils.isBlank(branchInfo.get("TAX").toString())?"":branchInfo.get("TAX").toString());
				policyInfo.setBrokerSite(StringUtils.isBlank((String)branchInfo.get("EMAIL"))?"":(String)branchInfo.get("EMAIL"));
			}
			String path=getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
			String basePath=path.substring(1, path.indexOf("WEB-INF"));
			policyInfo.setBasePath(basePath);
			policyInfo.setAppMode(basePath.indexOf("test")!=-1?"Test":"Live");

			//Map<String, Object> basisInfo=getBasisValInfo(policyInfo.getBranchCode(),policyInfo.getSaleTerm(),policyInfo.getTolerance());
			Map<String, Object> basisInfo=getBasisValInfo(belongingBranch,policyInfo.getSaleTerm(),policyInfo.getTolerance());
			policyInfo.setSaleTermValue(basisInfo.get("SALE_TERM_VALUE")==null?"0":basisInfo.get("SALE_TERM_VALUE").toString());
			policyInfo.setToleranceValue(basisInfo.get("TOLERANCE_VALUE")==null?"0":basisInfo.get("TOLERANCE_VALUE").toString());
			policyInfo.setBrokerType(StringUtils.isBlank(getValue("brokerType",new String[]{policyInfo.getLoginId()}))?"":getValue("brokerType",new String[]{policyInfo.getLoginId()}));
			policyInfo.setSessionId("test");
			if("3".equalsIgnoreCase(policyInfo.getModeOfTransport())){
				policyInfo.setOriginatingWareHouseCoverage("YES");
				policyInfo.setDestinationWareHouseCoverage("YES");
			}
			policyInfo.setWsrcc("YES".equalsIgnoreCase(policyInfo.getWsrcc())?policyInfo.getModeOfTransport():"0");

			Map<String, Object> limitInfo=getSuminsuredLimitInfo(policyInfo.getLoginId(), policyInfo.getProductId(), policyInfo.getOpenCoverPolicyNo(), policyInfo.getModeOfTransport());
			if(limitInfo!=null && !limitInfo.isEmpty()){
				policyInfo.setSumInsuredLimit(StringUtils.isBlank(limitInfo.get("SUM_INSURED_LIMIT").toString())?"0":limitInfo.get("SUM_INSURED_LIMIT").toString());
			}
			if("11".equals(policyInfo.getProductId())){
				Map<String, Object> openCoverInfo=getOpenCoverMasterInfo(policyInfo.getOpenCoverPolicyNo());
				if(openCoverInfo!=null && !openCoverInfo.isEmpty()){
					/*if(policyInfo.getModeOfTransport() != null){
						if("1".equalsIgnoreCase(policyInfo.getModeOfTransport()))
							policyInfo.setMinimumPremium(openCoverInfo.get("EXPORT_MIN_PREMIUM_AMOUNT").toString());
						else if("2".equalsIgnoreCase(policyInfo.getModeOfTransport()))
							policyInfo.setMinimumPremium(openCoverInfo.get("IMPORT_MIN_PREMIUM_AMOUNT").toString());
						else if("3".equalsIgnoreCase(policyInfo.getModeOfTransport()))
							policyInfo.setMinimumPremium(openCoverInfo.get("CROSS_MIN_PREMIUM_AMOUNT").toString());
					
					}*/
					if(policyInfo.getModeOfTransport() != null){
						if("3".equalsIgnoreCase(policyInfo.getModeOfTransport()))
							policyInfo.setMinimumPremium(openCoverInfo.get("CROSS_MIN_PREMIUM_AMOUNT").toString());
						else 
							policyInfo.setMinimumPremium(openCoverInfo.get("EXPORT_MIN_PREMIUM_AMOUNT").toString());
						
					
					}
					//policyInfo.setMinimumPremium(openCoverInfo.get("EXPORT_MIN_PREMIUM_AMOUNT").toString());
					policyInfo.setOpenCoverBackDateDays(openCoverInfo.get("BACK_DATE_DAYS").toString());
					policyInfo.setOpenCoverCrossVoyage(openCoverInfo.get("CROSS_VOYAGE").toString());
					policyInfo.setOpenCoverCrossVoyageLimit(openCoverInfo.get("CROSS_VOYAGE_SUMINSURED_LIMIT").toString());
					policyInfo.setBusinessType(openCoverInfo.get("BUSINESS_TYPE").toString());
				}
			}else{
				if(limitInfo!=null && !limitInfo.isEmpty()){
					policyInfo.setMinimumPremium(limitInfo.get("MIN_PREMIUM").toString());
				}
			}
				
			Map<String, Object> currencyInfo=getResultMap(DBConstants.MARINE_CURRENCY_INFO, new String[]{policyInfo.getCurrency(), policyInfo.getBrokerOriginatingCountryId()});
			if(currencyInfo!=null && !currencyInfo.isEmpty()){
				if(StringUtils.isBlank(policyInfo.getCurrencyValue()))					
					policyInfo.setCurrencyValue(StringUtils.isBlank(currencyInfo.get("EXCHANGE_RATE").toString())?"":currencyInfo.get("EXCHANGE_RATE").toString());
				policyInfo.setCurrencyName(StringUtils.isBlank((String)currencyInfo.get("CURRENCY_NAME"))?"":(String)currencyInfo.get("CURRENCY_NAME"));
				policyInfo.setExchangeId(StringUtils.isBlank(currencyInfo.get("EXCHANGE_ID").toString())?"0":currencyInfo.get("EXCHANGE_ID").toString());
			}
			currencyInfo=getResultMap(DBConstants.MARINE_CURRENCY_INFO, new String[]{policyInfo.getCurrency(), policyInfo.getBrokerOriginatingCountryId()});
			if(currencyInfo!=null && !currencyInfo.isEmpty()){
				if(StringUtils.isNotBlank(policyInfo.getCurrencyValue()))
					policyInfo.setExposureCurrencyValue(policyInfo.getCurrencyValue());
				else
					policyInfo.setExposureCurrencyValue(StringUtils.isBlank(currencyInfo.get("EXCHANGE_RATE").toString())?"":currencyInfo.get("EXCHANGE_RATE").toString());
				
			}		
			policyInfo.setAmendId(getValue("GET_AMEND_ID", new String[]{policyInfo.getApplicationNo()}));
			policyInfo.setEndt(isEndt(policyInfo.getApplicationNo()));
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getPolicyInfo - Exit || refNo: "+refNo);
		
		return policyInfo;
	}
	public String[][] getCommodityInfo(String refNo, String branchCode)
	{
		logger.info("getCommodityInfo - Enter || refNo: "+refNo);
		String result[][]=new String[0][0];
		try{
			result=runner.multipleSelection(getQuery("GET_COMM_INFO"), new String[]{refNo,branchCode});
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getCommodityInfo - Exit || Result: "+result.length);
		
		return result;
	}
	public String[][] getCommodityRateInfo(String applicationNo)
	{
		logger.info("getCommodityRateInfo - Enter || refNo: "+applicationNo);
		String result[][]=new String[0][0];
		try{
			result=runner.multipleSelection(getQuery("GET_COMM_RATE_INFO"), new String[]{applicationNo});
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getCommodityRateInfo - Exit || Result: "+result.length);
		
		return result;
	}
	public String updateQuoteInfo(WebServicePolicyInfo info)
	{
		logger.info("updateQuoteInfo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[9];
			args[0]=info.getApplicationNo();
			args[1]=info.getQuoteNo();
			args[2]=info.getQuoteNo();
			args[3]=StringUtils.isBlank(info.getReferralType())?"":info.getReferralType();
			args[4]=info.getCustomerId();
			args[5]=info.getStatus();
			args[6]=info.getQuoteNo();
			args[7]=info.getQuoteNo();
			args[8]=info.getRefNo();
			logger.info("args "+StringUtils.join(args,","));
			this.mytemplate.update(getQuery("UPD_WS_QUOTE_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateQuoteInfo - Exit || Result: "+result);
		
		return result;
	}
	public String updatePolicyInfo(WebServicePolicyInfo info)
	{
		logger.info("updatePolicyInfo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[4];
			args[0]=info.getPolicyNo();
			args[1]=info.getPolicyFilePath();
			args[2]=info.getStatus();
			args[3]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_POLICY_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updatePolicyInfo - Exit || Result: "+result);
		
		return result;
	}
	public String updateDraftInfo(WebServicePolicyInfo info)
	{
		logger.info("updateDraftInfo - Enter || refNo: "+info.getRefNo());
		sql="UPDATE WEBSERVICE_MARINE_QUOTE SET DRAFT_FILE_PATH=? WHERE REFERENCE_NUMBER=?";
		String result="";
		try 
		{
			String[] args=new String[2];
			args[0]=info.getDraftFilePath();
			args[1]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_DRAFT_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateDraftInfo - Exit || Result: "+result);
		
		return result;
	}
	public void updateCommodityInfo(WebServicePolicyInfo info)
	{
		logger.info("updateCommodityInfo - Enter || refNo: "+info.getRefNo()+" applicationNo: "+info.getApplicationNo());
		try
		{
			this.mytemplate.update(getQuery("CAL_PROC_UPD_COMM_RATE"),new String[]{info.getRefNo(), info.getApplicationNo()});
		}catch(Exception e){logger.debug(e);}
		logger.info("updateCommodityInfo - Exit");
	}
	public String isNull(String value)
	{
		return value==null?"":value;
	}
	public String updateQuoteScheduleInfo(WebServicePolicyInfo info)
	{
		logger.info("updateQuoteScheduleInfo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[2];
			args[0]=info.getQuoteScheduleFilePath();
			args[1]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_QUOTE_SCH_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateQuoteScheduleInfo - Exit || Result: "+result);
		
		return result;
	}

	public String updateDebitInfo(WebServicePolicyInfo info)
	{
		logger.info("updateDebitInfo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[2];
			args[0]=info.getDebitFilePath();
			args[1]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_DEBIT_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateDebitInfo - Exit || Result: "+result);
		
		return result;
	}
	public String updateCreditInfo(WebServicePolicyInfo info)
	{
		logger.info("updateCreditInfo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[2];
			args[0]=info.getCreditFilePath();
			args[1]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_CREDIT_INFO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateCreditInfo - Exit || Result: "+result);
		
		return result;
	}
	public String updateAdminReferralInfo(WebServicePolicyInfo info)
	{
		logger.info("updateAdminReferralInfo - Enter || applicationNo: "+info.getApplicationNo());
		String result="";
		try 
		{
			String[] args=new String[3];
			args[0]=info.getAdminReferralYN();
			args[1]=info.getAdminReferralRemarks();
			args[2]=info.getApplicationNo();
			this.mytemplate.update(getQuery("UPD_ADMIN_REF_INFO"), args);
			this.mytemplate.update(getQuery("UPD_POL_REMARKS"), new String[]{info.getApplicationNo()});
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateAdminReferralInfo - Exit || Result: "+result);
		
		return result;
	}
	public void addCommodityInfo(WebServicePolicyInfo info,String belongingBranch)
	{
		logger.info("addCommodityInfo - Enter || refNo: "+info.getApplicationNo());
		try {
			//this.mytemplate.update(getQuery("CAL_PROC_COMM"), new String[]{info.getApplicationNo(), info.getAmendId(), info.getBranchCode()});
			this.mytemplate.update(getQuery("CAL_PROC_COMM"), new String[]{info.getApplicationNo(), info.getAmendId(), belongingBranch});
		}catch (Exception e) {
			logger.debug(e);
		}
		logger.info("addCommodityInfo - Exit");
		
	}
	public String getMaxApplicationNo()
	{
		logger.info("getMaxApplicationNo - Enter");
		String result="";
		try 
		{
			if (getSource().equalsIgnoreCase("ORACLE")) {
				 sql=getQuery(DBConstants.MARINE_MAX_APP_NO);
				result=(String)this.mytemplate.queryForObject(sql, String.class);
			} else {
				 sql=getQuery(DBConstants.MARINE_MAX_APP_NO);
				result=(String)this.mytemplate.queryForObject(sql, String.class);
				//result=new CommonDAO().getPolicyNo("01", "03", "APPLICATION_TYPE_ID");
			} 
			
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getMaxApplicationNo - Exit || Result: "+result);
		
		return result;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBasisValInfo(String branchCode, String saleTermId,String toleranceId)
	{
		logger.info("getBasisValInfo - Enter || saleTermId: "+saleTermId+" toleranceId: "+toleranceId);
		Map<String, Object> map=null;
		try
		{
			if(StringUtils.isBlank(toleranceId))
				toleranceId="4";
			sql = getQuery(DBConstants.REFERRAL_BASISVAL);
			map=(Map<String, Object>)this.mytemplate.queryForMap(sql, new String[]{saleTermId,branchCode,toleranceId});
		}catch(Exception e){
			logger.debug("Exception @ {"+e+"}");
		}
		logger.info("getBasisValInfo - Exit");
		return map;
	}
	public String getConveyanceWarRate(String branchCode, String productId, String openCoverNo,String modeOfTransport)
	{
		logger.info("getConveyanceWarRate - Enter || openCoverNo: "+openCoverNo+" modeOfTransport: "+modeOfTransport);
		String result="";
		try
		{
			if("3".equals(productId)){
				sql = getQuery("GET_CONVEY_WARRATE");
				result=(String)this.mytemplate.queryForObject(sql, new String[]{modeOfTransport,branchCode}, String.class);
			}else{
				modeOfTransport=modeOfTransport+"~";
				sql = getQuery("GET_CONVEY_WARRATE_OC");
				result=(String)this.mytemplate.queryForObject(sql, new String[]{modeOfTransport,modeOfTransport,modeOfTransport,openCoverNo}, String.class);
			}
		}catch(Exception e){
			logger.debug("Exception @ {"+e+"}");
		}
		logger.info("getConveyanceWarRate - Exit || Result: "+result);
		return result;
	}
	public String[][] getCommodityList(String applicationNo)
	{
		logger.info("getCommodityList - Enter || "+applicationNo);
		String[][] result=new String[0][0];					
		try{
			sql=getQuery(DBConstants.MARINE_COMMODITY);
			result=runner.multipleSelection(sql, new String[]{applicationNo});			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getCommodityList() - Exit: size"+ result.length);
				
		return result;
	}
	public String getValue(String option, String[] args)
	{
		logger.info("getValue - Enter || "+option+" args: "+ StringUtils.join(args, ","));
		String result="";					
		try{
			sql=getQuery(option);
			result=(String)this.mytemplate.queryForObject(sql,args, String.class);			
		}
		catch (Exception e) {			
			result=StringUtils.isBlank(result)?"":result;
		}		
		logger.info("getValue() - Exit || Result: "+result );
				
		return result;
	}
	public String getValue(String option)
	{
		logger.info("getValue - Enter || "+option);
		String result="";					
		try{
			sql=getQuery(option);
			result=(String)this.mytemplate.queryForObject(sql,String.class);			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getValue() - Exit || Result: "+result );
				
		return result;
	}
	public void update(String option, String[] args)
	{
		logger.info("update - Enter || args: "+StringUtils.join(args, ","));
		int updated=0;
		try 
		{
			sql=getQuery(option);
			updated=this.mytemplate.update(sql, args);
			logger.info("Sql: "+sql);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("update - Exit || Result: "+updated);
		
	}
	public List<Object> getResultList(String option, String[] args)
	{
		List<Object> list=null;
		try
		{
			sql = getQuery(option);
			list=this.mytemplate.queryForList(sql, args);
		}
		catch(Exception e)
		{
			logger.debug("Exception @ {"+e+"}");
		}
		return list;

	}
	public Map<String,Object> getResultMap(String option, String[] args)
	{
		Map<String,Object> map=null;
		try
		{
			sql = getQuery(option);
			logger.info("sql=>"+sql);
			map=this.mytemplate.queryForMap(sql, args);
			
		}
		catch(Exception e)
		{
			logger.debug("Exception @ {"+e+"}");
		}
		return map;

	}
	public void insertOrUpdateMarineInfo(String[][] commoditys,String userType, WebServicePolicyInfo info, Map<String, Object> premiumInfo)
	{
		logger.info("insertOrUpdateMarineInfo - Enter || applicationNo: "+info.getApplicationNo());
		int rows=0;
		String exeName="", vesselOption="";
		Calendar cal= new GregorianCalendar();
		try{
			DecimalFormat df1 = new DecimalFormat("####0.00", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
			String policyDate	=	info.getPolicyStartDate()+" "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND);		
			exeName=getValue(DBConstants.MARINE_EXECUTIVE_NAME, new String[]{info.getExecutive()});
			sql = getQuery(DBConstants.MARINE_DATA_COUNT);
			rows=this.mytemplate.queryForInt(sql, new String[]{info.getApplicationNo()});
			String rg="";
			try{
				List<Map<String,String>> uwRefList = null;
				 uwRefList=this.mytemplate.queryForList(getQuery("GET_UW_REFLIST"),new String[]{info.getApplicationNo(),info.getBranchCode()});
				 rg=(uwRefList!=null && uwRefList.size()>0)?String.valueOf(uwRefList.get(0).get("RG")):"0";
			}catch (Exception e) {
				e.printStackTrace();				
			}
			if(rows<=0)
			{
				String[] args = new String[52];
				args[0] = info.getApplicationNo();
				args[1] = info.getModeOfTransport();
				args[2] = info.getOriginatingWareHouseCoverage();
				args[3] = info.getOriginatingCountryCityName();
				args[4] = info.getDestinationCountryCityName();
				args[5] = info.getTotalCommodity();
				args[6] = info.getTotalSumInsured();
				args[7] = info.getCurrency();
				args[8] = info.getExchangeId();
				args[9] = info.getCurrencyName();
				args[10] = info.getCurrencyValue();
				args[11] = info.getSaleTerm();
				args[12] = info.getCoverages();
				args[13] = info.getWsrcc();
				args[14] = info.getExecutive();
				args[15] = exeName;
				args[16] = info.getAmendId();
				args[17] = policyDate;
				args[18] = info.getReferralType();
				args[19] = "Y";
				String equlentUSD=df1.format(trunc("round",df1.format(Double.parseDouble(info.getTotalSumInsured())*Double.parseDouble(info.getCurrencyValue())),"0"));				
				args[20] = equlentUSD;
				args[21] = info.getCompanyId();
				args[22] = StringUtils.isBlank(info.getTotalPremium())?"0":String.valueOf(trunc("round",info.getTotalPremium(),"2"));
				args[23] = StringUtils.isBlank(info.getOriginatingCountryCity())?"0":info.getOriginatingCountryCity();
				args[24] = info.getOriginatingCountry();
				args[25] = StringUtils.isBlank(info.getDestinationCountryCity())?"0":info.getDestinationCountryCity();
				args[26] = info.getDestinationCountry();
				args[27] = info.getReferralStatus();
				args[28] = String.valueOf(trunc("round",info.getTotalSaleterm(),"0"));
				args[29] = StringUtils.isBlank(info.getTotalWarPremium())?"0":info.getTotalWarPremium();
				args[30] = info.getSeaCoverages();
				args[31] = info.getDestinationWareHouseCoverage();
				args[32] = info.getProductId();
				args[33] = info.getOpenCoverPolicyNo();
				args[34] = info.getIssuingBank();
				args[35] = info.getLcNumber();
				args[36] = info.getVesselName();
				args[37] = vesselOption;
				args[38] = info.getTolerance();
				args[39] = info.getTotalTolerance();
				args[40] = info.getPartialShipment();
				args[41] = info.getPartialShipmentAmount();
				args[42] = info.getExposureCurrency();
				args[43] = info.getVesselId();
				args[44] = StringUtils.isBlank(info.getPolicyFee())?"0":info.getPolicyFee();
				args[45] = StringUtils.isBlank(info.getGovtTax())?"0":info.getGovtTax();
				args[46] = info.getEmergencyFund();
				args[47] = StringUtils.isBlank(info.getExcessPremium())?"0":info.getExcessPremium();
				args[48] = info.getAdminReferralYN();
				args[49] = info.getChannelType();
				args[50] = rg;
				args[51] = info.getVia();
				sql = getQuery(DBConstants.MARINE_DATA_INSERT);
				logger.info("Marine insert args=>"+StringUtils.join(args,","));
				this.mytemplate.update(sql, replaceEmptyIfNull(args));				
			}
			else
			{
				String[] args = new String[52];
				args[0] = info.getModeOfTransport();
				args[1] = info.getOriginatingWareHouseCoverage();
				args[2] = info.getOriginatingCountryCityName();
				args[3] = info.getDestinationCountryCityName();
				args[4] = info.getTotalCommodity();
				args[5] = info.getTotalSumInsured();
				args[6] = info.getCurrency();
				args[7] = info.getExchangeId();
				args[8] = info.getCurrencyName();
				args[9] = info.getCurrencyValue();
				args[10] = info.getSaleTerm();
				args[11] = info.getCoverages();
				args[12] = info.getWsrcc();
				args[13] = info.getExecutive();
				args[14] = exeName;
				args[15] = policyDate;
				String equlentUSD=df1.format(trunc("round",df1.format(Double.parseDouble(info.getTotalSumInsured())*Double.parseDouble(info.getCurrencyValue())),"0"));
				args[16] = equlentUSD;
				args[17] = info.getCompanyId();
				args[18] = StringUtils.isBlank(info.getTotalPremium())?"0":String.valueOf(trunc("round",info.getTotalPremium(),"2"));
				args[19] = StringUtils.isBlank(info.getOriginatingCountryCity())?"0":info.getOriginatingCountryCity();
				args[20] = info.getOriginatingCountry();
				args[21] = StringUtils.isBlank(info.getDestinationCountryCity())?"0":info.getDestinationCountryCity();
				args[22] = info.getDestinationCountry();
				args[23] = info.getReferralStatus();
				args[24] = String.valueOf(trunc("round",info.getTotalSaleterm(),"0"));
				args[25] = StringUtils.isBlank(info.getTotalWarPremium())?"0":info.getTotalWarPremium();
				args[26] = info.getSeaCoverages();
				args[27] = info.getDestinationWareHouseCoverage();
				args[28] = info.getProductId();
				args[29] = info.getOpenCoverPolicyNo();
				args[30] = info.getIssuingBank();
				args[31] = info.getLcNumber();
				args[32] = info.getVesselName();
				args[33] = vesselOption;
				args[34] = info.getTolerance();
				args[35] = info.getTotalTolerance();
				args[36] = info.getPartialShipment();
				args[37] = StringUtils.isBlank(info.getPartialShipmentAmount())?"0":info.getPartialShipmentAmount();
				args[38] = info.getExposureCurrency(); //38
				args[39] = info.getVesselId(); //38
				args[40] = info.getReferralType();
				args[41] = StringUtils.isBlank(info.getPolicyFee())?"0":info.getPolicyFee();
				args[42] =  StringUtils.isBlank(info.getGovtTax())?"0":info.getGovtTax();
				args[43] = info.getEmergencyFund();
				args[44] = StringUtils.isBlank(info.getExcessPremium())?"0":info.getExcessPremium();
				args[45] = info.getAdminReferralYN();
				args[46] = info.getChannelType();				
				args[47] = rg;
				args[48] = info.getVia();
				args[49] = info.getApplicationNo(); //38
				args[50] = "Y";//39
				args[51] = info.getAmendId();//39
				sql=getQuery(DBConstants.MARINE_DATA_UPDATE);
				logger.info("Marine update query=>"+sql);
				logger.info("Marine update args=>"+StringUtils.join(args,","));
				
				this.mytemplate.update(sql, replaceEmptyIfNull(args));
				
				sql=getQuery(DBConstants.MARINE_UPDATE_LINKED_STATUS);
				this.mytemplate.update(sql, new String[]{info.getApplicationNo()});
			}
			insertOrUpdateTrackingInfo(info.getSessionId(), info.getApplicationNo(), info.getLoginId(), info.getProductId());
		}catch(Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("insertOrUpdateMarineInfo - Exit");
	}
	public void insertOrUpdateTrackingInfo(String sessionId,String applicationNo,String loginId, String productId)
	{
		logger.info("insertOrUpdateTrackingInfo - Enter || applicationNo: "+applicationNo+" loginId: "+loginId);
		sql=getQuery(DBConstants.MARINE_TRACKING_COUNT);
		int count=this.mytemplate.queryForInt(sql, new String[]{applicationNo, loginId, sessionId});
		if(count<=0){
			sql=getQuery(DBConstants.MARINE_TRACKING_INSERT);
			this.mytemplate.update(sql, new String[]{sessionId, loginId, "2", applicationNo, productId, "Remarks","Y"});
		}else{
			sql=getQuery(DBConstants.MARINE_TRACKING_UPDATE);
			this.mytemplate.update(sql, new String[]{"2", applicationNo,"Y", sessionId, loginId});
		}
		logger.info("insertOrUpdateTrackingInfo - Exit");
	}
	public String insertOrUpdateCustomerInfo(WebServicePolicyInfo info) 
	{
		logger.info("insertOrUpdateCustomerInfo - Enter ");
		String customerId=info.getCustomerId();
		String[] args=null;
		int count=0;
		try{
			if(getSource().equalsIgnoreCase("ORACLE")){
				customerId = getValue("GET_CUST_SEQ", new String[]{info.getApplicationNo(),customerId});
			}else{
				SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName("cust_Seq_creation");
		     	Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
		     	inputValues.put("pvappid", info.getApplicationNo());
		     	inputValues.put("pvcustomer", customerId);
		     	inputValues.put("pvBranch", info.getBranchCode());
		     	inputValues.put("pnProduct", info.getProductId());
		     	inputValues.put("nextval", "");
		     	logger.info("Args==> " + inputValues.toString());
		     	Map<String, Object> outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
		     	customerId=outputValues.get("nextval")==null?"":outputValues.get("nextval").toString();
			}
			sql=getQuery(DBConstants.MARINE_CUSTOMER_COUNT);
			if(StringUtils.isEmpty(customerId)){
				//customerId = new CommonDAO().getPolicyNo("01", "03", "CUSTOMER_TYPE_ID");//getValue("GET_CUST_ID_MAX");
				customerId =new CommonDAO().getSequenceNo("","","CUSTOMER_ID");
				info.setCustomerId(customerId);
			} else {
				info.setCustomerId(customerId);
				count=this.mytemplate.queryForInt(sql, new String[]{info.getCustomerId()});
			}
			if (count<=0)
			{
				//customerId = getValue("GET_CUST_ID_MAX");
				args = new String[20];
				args[0] = customerId;
				args[1] = "1";
				args[2] = info.getCustTitle();
				args[3] = info.getCustomerName();
				args[4] = "";
				args[5] = info.getAmendId();
				args[6] = info.getMobileNo();
				args[7] = info.getEmail();
				args[8] = info.getAddress1();
				args[9] = info.getAddress2();
				args[10] = info.getPoBox();
				args[11] = info.getEmirate();
				args[12] = "Y";
				args[13] = info.getLoginId();
				args[14] = info.getCustCoreCode();
				args[15] = info.getClientCustomerId();
				args[16] = info.getCustArNo();
				//args[17] = info.getCoreCustomerName();
				args[17] = info.getCustomerName();
				args[18] = info.getCustVatRegNo();
				args[19] = info.getCustomerNameAr();
				sql=getQuery(DBConstants.MARINE_CUSTOMER_INSERT);
				logger.info("Customer insert args=>"+StringUtils.join(args,","));
				this.mytemplate.update(sql, args);
			}
			else 
			{
				args = new String[18];
				args[0] = "1";
				args[1] = info.getCustTitle();
				args[2] = info.getCustomerName();
				args[3] = "";
				args[4] = info.getMobileNo();
				args[5] = info.getEmail();
				args[6] = info.getAddress1();
				args[7] = info.getAddress2();
				args[8] = info.getPoBox();
				args[9] = info.getEmirate();
				args[10] = "Y";
				args[11] = info.getCustCoreCode();
				args[12] = info.getClientCustomerId();
				args[13] = info.getCustArNo();
				//args[14] = info.getCoreCustomerName();
				args[14] = info.getCustomerName();
				args[15] = info.getCustVatRegNo();
				args[16] = info.getCustomerNameAr();
				args[17] = info.getCustomerId();
				sql=getQuery(DBConstants.MARINE_CUSTOMER_UPDATE);
				logger.info("Customer update args=>"+StringUtils.join(args,","));
				this.mytemplate.update(sql, args);
			}
		}catch(Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("insertOrUpdateCustomerInfo - Exit || Result: "+customerId);
		return customerId;
	}

	/*public String insertOrUpdateLcInfo(WebServicePolicyInfo info) 
	{
		logger.info("insertOrUpdateLcInfo - Enter ");
		String customerId=info.getCustomerId();
		Object[] args=null;
		int amendId=0;
		String balanceAmt="0", lcId="";
		try{
			if(info.getLcNumber()!=null && !"".equals(info.getLcNumber())){
				sql="select OCLM.LC_ID, OCLM.amend_id, OCLM.LC_BALANCE_AMOUNT from OPEN_COVER_LC_MASTER OCLM where OCLM.lc_number=? and OCLM.amend_id=(select max(OCLMM.amend_id) from OPEN_COVER_LC_MASTER OCLMM where OCLM.lc_number=OCLMM.lc_number)";
				logger.info("Query==>" + sql);
				List lcNoList=this.mytemplate.queryForList(sql,new String[]{info.getLcNumber()});
				if(lcNoList!=null && lcNoList.size()==1){
					Map map=(Map)lcNoList.get(0);
					lcId=map.get("LC_ID")==null?"":map.get("LC_ID").toString();
					amendId=Integer.parseInt(map.get("amend_id")==null?"0":map.get("amend_id").toString())+1;
					balanceAmt=map.get("LC_BALANCE_AMOUNT")==null?"0":map.get("LC_BALANCE_AMOUNT").toString();
				}
			}
			if(amendId<=0){
				lcId=(String)this.mytemplate.queryForObject("select nvl(max(lc_id),'0')+1 lc_id from open_cover_lc_master where open_cover_No=?", new Object[]{info.getOpenCoverPolicyNo()}, String.class);
				args = new Object[13];
				args[0] = info.getLcNumber();
				args[1] = info.getLcAmount();
				args[2] = info.getIssuingBank();
				args[3] = amendId;
				args[4] = info.getLcDate();
				args[5] = "Normal";
				args[6] = "Y";
				args[7] = info.getOpenCoverPolicyNo();
				args[8] = info.getOpenCoverPolicyNo();
				args[9] = info.getLcCurrency();
				args[10] = balanceAmt;
				args[11] = String.valueOf(Double.parseDouble(info.getLcAmount()==null?"0":info.getLcAmount())*Double.parseDouble(info.getLcExchangeValue()==null?"0":info.getLcExchangeValue()));
				args[12] = info.getBranchCode();
				sql=getQuery("INS_LC_NEW_VALUE_QUOTE");
			}else{
				args = new Object[10];
				args[0] = info.getLcAmount();
				args[1] = info.getIssuingBank();
				args[2] = amendId;
				args[3] = info.getLcDate();
				args[4] = info.getLcCurrency();
				args[5] = String.valueOf(Double.parseDouble(info.getLcAmount()==null?"0":info.getLcAmount())*Double.parseDouble(info.getLcExchangeValue()==null?"0":info.getLcExchangeValue()));;
				args[6] = info.getBranchCode();
				args[7] = info.getOpenCoverPolicyNo();
				args[8] = info.getLcNumber();
				args[9] = lcId;
				sql=getQuery("UPD_LC_VALUE_QUOTE");
			} 
			logger.info("insertOrUpdateLcInfo Query=>"+sql);
			logger.info("insertOrUpdateLcInfo args=>"+StringUtils.join(args,","));
			this.mytemplate.update(sql, args);
			if(lcId!=null && !"".equals(lcId))
				info.getLcId();

		}catch(Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("insertOrUpdateLcInfo - Exit");
		return customerId;
	}*/

	public Map<String,Object> getPolicyFeeConst(final String branchCode,final String productId,final String openCoverNo,String brokerCode)
	{
		logger.info("getPolicyFeeConst - Enter || branchCode: "+branchCode);
		Map<String,Object> map=new HashMap<String, Object>();
		try{
			if("11".equalsIgnoreCase(productId)){
				map=(Map<String,Object>)getResultMap(DBConstants.MARINE_POLICY_FEE_OC, new String[]{openCoverNo, branchCode});
			}else{
				map=(Map<String,Object>)getResultMap(DBConstants.MARINE_POLICY_FEE, new String[]{brokerCode,brokerCode});
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("getPolicyFeeConst - Exit || Result: "+map.size());
		return map;
	}
	public Map<String, Object> getOpenCoverMasterInfo(String openCoverNo)
	{
		Map<String, Object> map=null;
		try
		{
			sql = getQuery(DBConstants.MARINE_OC_MASTER);
			map=(Map<String, Object>)this.mytemplate.queryForMap(sql, new String[]{openCoverNo});
		}
		catch(Exception e)
		{
			logger.debug("Exception @ {"+e+"}");
		}
		return map;
	}
	public Map<String, Object> getSuminsuredLimitInfo(String loginId,String productId, String openCoverNo, String modeOfTransport)
	{
		Map<String, Object> map=null;
		try
		{
			if("3".equals(productId)){
				sql = getQuery(DBConstants.REFERRAL_SUMINSURED);
				map=(Map<String, Object>)this.mytemplate.queryForMap(sql, new String[]{loginId, productId});
			}else if("11".equals(productId)){
				sql = getQuery(DBConstants.REFERRAL_OCSUMINSURED);
				map=(Map<String, Object>)this.mytemplate.queryForMap(sql, new String[]{openCoverNo, modeOfTransport});
			}
		}
		catch(Exception e)
		{
			logger.debug("Exception @ {"+e+"}");
		}
		return map;
	}
	public Object[] replaceEmptyIfNull(Object[] args){
		if(args!=null){
			for (int i = 0; i < args.length; i++) {
				if(args[i]==null){
					args[i]="";
				}
			}
		}
		return args;
	}
	public String insertOrUpdateQuoteInfo(WebServicePolicyInfo info)
	{
		logger.info("insertOrUpdateQuoteInfo - Enter || applicationNo: "+info.getApplicationNo());
		String quoteNo=info.getQuoteNo();
		String args[] = new String[0];
		String applicationId=StringUtils.isEmpty(info.getIssuer())?"1":info.getIssuer();
		int count=0;
		try
		{
			sql = getQuery(DBConstants.MARINE_QUOTE_COUNT);
			if(StringUtils.isNotEmpty(quoteNo)){
				count=this.mytemplate.queryForInt(sql, new String[]{quoteNo, info.getAmendId()});
			}
			if(count<=0){
				if (getSource().equalsIgnoreCase("ORACLE")) {
					if("3".equals(info.getProductId())){
						quoteNo=getValue(DBConstants.MARINE_MAX_QUOTE_NO);
					}else{
						quoteNo=getValue(DBConstants.MARINE_MAX_QUOTE_NO_OC);
					}
				} else {
					if("3".equals(info.getProductId())){
						//quoteNo= new CommonDAO().getPolicyNo("01", "03", "QUOTE_TYPE_ID");//getValue(DBConstants.MARINE_MAX_QUOTE_NO);
						quoteNo=getValue(DBConstants.MARINE_MAX_QUOTE_NO);
					}else{
						//quoteNo=new CommonDAO().getPolicyNo("01", "11", "QUOTE_TYPE_ID");
						quoteNo=getValue(DBConstants.MARINE_MAX_QUOTE_NO_OC);
					}
				} 
				args = new String[15];
				args[0] = info.getProductId();
				args[1] = info.getLoginId();
				args[2] = info.getCompanyId();
				args[3] = info.getApplicationNo();
				args[4] = info.getAmendId();
				args[5] = quoteNo;
				args[6] = info.getCustomerId();
				args[7] = applicationId;
				args[8] = "Y";
				args[9] = StringUtils.isBlank(info.getExcessPremium())?"0":info.getExcessPremium();
				args[10] = info.getBusinessType();
				args[11] = new ReportDAO().getOriginalPolicyNo(info.getOpenCoverPolicyNo());
				args[12] = info.getOpenCoverPolicyNo();
				args[13] = info.getReferralStatus();
				args[14] = StringUtils.isBlank(info.getTotalPremium())?"0":info.getTotalPremium();
				this.mytemplate.update(getQuery(DBConstants.MARINE_QUOTE_INSERT), replaceEmptyIfNull(args));
			}else{
				this.mytemplate.update(getQuery(DBConstants.MARINE_QUOTE_UPDATE), new String[]{info.getCustomerId(), info.getExcessPremium(),info.getReferralStatus(),StringUtils.isBlank(info.getTotalPremium())?"0":String.valueOf(trunc("round",info.getTotalPremium(),"0")),applicationId,new ReportDAO().getOriginalPolicyNo(info.getOpenCoverPolicyNo()),info.getApplicationNo(),info.getQuoteNo(), info.getAmendId()});
			}
			//new CommodityCountryRateDAO().updateWarrantyClauses(info.getLoginId(), info.getProductId(), info.getApplicationNo());
		}
		catch(Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("insertOrUpdateQuoteInfo - Exit || Result: "+info.getQuoteNo());
		return quoteNo;
	}
	public String insertOrUpdateMarinePolicyInfo(WebServicePolicyInfo info)
	{
		logger.info("insertOrUpdateMarinePolicyInfo - Enter || quoteNo: "+info.getQuoteNo());
		String quoteNo=info.getQuoteNo();
		String args[] = new String[0];
		int count=0;
		try
		{
			sql = getQuery("CNT_MARINE_POLICY");
			if(StringUtils.isNotEmpty(quoteNo)){
				count=this.mytemplate.queryForInt(sql, new String[]{quoteNo, info.getAmendId()});
			}
			if(count<=0){
				sql = getQuery("INSRT_MPD",new Object[]{(StringUtils.isBlank(info.getBlAwbDate())?"":info.getBlAwbDate()),(StringUtils.isBlank(info.getLcDate())?"":info.getLcDate()),(StringUtils.isBlank(info.getSailingDate())?"":info.getSailingDate())});
				args = new String[19];
				args[0] = info.getQuoteNo();
				args[1] = info.getCustomerId();
				args[2] = info.getBlAwbNumber();
				//args[3] = info.getBlAwbDate();
				args[3] = StringUtils.isBlank(info.getSettlingAgent())?StringUtils.isBlank(info.getSettlingAgentName())?"0":"0":info.getSettlingAgent();
				args[4] = info.getVesselName();
				args[5] = info.getLcNumber();
				//args[7] = info.getLcDate();
				args[6] = info.getIssuingBank();
				args[7] = info.getPartialShipment();
				args[8] = "";
				args[9] = info.getCompanyId();
				args[10] = info.getAmendId();
				args[11] = info.getSettlingAgentName();
				//args[14] = info.getSailingDate();
				args[12] = info.getPackageType();
				args[13] = info.getCustContractNo();
				args[14] = info.getCustFmsCaseNo();
				args[15] = info.getCustRefNo();
				args[16] = info.getConsigneeDetail();
				args[17] = info.getSpecialTerm();
				args[18] = info.getAddCustomerName();
				logger.info("Query==> " + sql);
				logger.info("Args==> " + StringUtils.join(args,"~~~"));
				this.mytemplate.update(sql, args);
			}else{
				sql=getQuery("UPDATE_MPD", new Object[]{(StringUtils.isBlank(info.getBlAwbDate())?"":info.getBlAwbDate()),(StringUtils.isBlank(info.getLcDate())?"":info.getLcDate()),(StringUtils.isBlank(info.getSailingDate())?"":info.getSailingDate())});
				args = new String[19];
				args[0] = info.getCustomerId();
				args[1] = info.getBlAwbNumber();
				//args[2] = info.getBlAwbDate();
				args[2] = info.getSettlingAgent();
				args[3] = info.getVesselName();
				args[4] = info.getLcNumber();
				//args[6] = info.getLcDate();
				args[5] = info.getIssuingBank();
				args[6] = info.getPartialShipment();
				args[7] = "";
				args[8] = info.getCompanyId();
				args[9] = info.getSettlingAgentName();
				//args[12] = info.getSailingDate();
				args[10] = info.getPackageType();
				args[11] = info.getCustContractNo();
				args[12] = info.getCustFmsCaseNo();
				args[13] = info.getCustRefNo();
				args[14] = info.getConsigneeDetail();
				args[15] = info.getSpecialTerm();
				args[16] = info.getAddCustomerName();

				args[17] = info.getQuoteNo();
				args[18] = info.getAmendId();
				
				logger.info("Query==> " + sql);
				logger.info("Args==> " + StringUtils.join(args,"~~~"));
				this.mytemplate.update(sql, args);
			}
		}
		catch(Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("insertOrUpdateMarinePolicyInfo - Exit || Result: "+info.getQuoteNo());
		return quoteNo;
	}
	public void insertOrUpdateMarineResultInfo(WebServicePolicyInfo info) 
	{
		logger.info("insertOrUpdateMarineResultInfo - Enter || quoteNo: "+info.getQuoteNo());
		try
		{
			int count=this.mytemplate.queryForInt(getQuery("CNT_MARINE_RESULT"),new String[]{info.getQuoteNo(), info.getApplicationNo(), info.getAmendId()});
			String query="";
			if (count==0){
				String args[] = new String[11];
				args[0] = info.getApplicationNo();
				args[1] = info.getQuoteNo();
				args[2] = info.getCompanyId();
				args[3] = info.getAmendId();
				args[4] = info.getCustomerId();
				args[5] = info.getTotalSumInsured();
				args[6] = StringUtils.isBlank(info.getTotalPremium())?"0":info.getTotalPremium();
				args[7] = StringUtils.isBlank(info.getPolicyFee())?"0":info.getPolicyFee();
				args[8] = StringUtils.isBlank(info.getPremium())?"0":info.getPremium();
				args[9] = "";
				args[10] = StringUtils.isBlank(info.getPremium())?"0":info.getPremium();
				query=getQuery("INS_MARINE_RESULT");
				logger.info("Query "+query);
				logger.info("args "+StringUtils.join(replaceEmptyIfNull(args),","));
				this.mytemplate.update(query, replaceEmptyIfNull(args));
			}else{
				String args[] = new String[10];
				args[0] = info.getTotalSumInsured();
				args[1] = StringUtils.isBlank(info.getPremium())?"0":info.getPremium();
				args[2] = StringUtils.isBlank(info.getPolicyFee())?"0":info.getPolicyFee();
				args[3] = StringUtils.isBlank(info.getPremium())?"0":info.getPremium();
				args[5] = "";
				args[4] = StringUtils.isBlank(info.getPremium())?"0":info.getPremium();
				args[6] = info.getCustomerId();
				args[7] = info.getQuoteNo();
				args[8] = info.getApplicationNo();
				args[9] = info.getAmendId();
				query=getQuery("UPD_MARINE_RESULT");
				logger.info("Query "+query);
				logger.info("args "+StringUtils.join(replaceEmptyIfNull(args),","));
				this.mytemplate.update(query, replaceEmptyIfNull(args));
			}
		}catch (Exception e){
			logger.debug("Exception @{"+e+"}");e.printStackTrace();
		}
		logger.info("insertOrUpdateMarineResultInfo - Exit");
	}
	public String generatePolicy(WebServicePolicyInfo info,String belongingBranch) 
	{
		logger.info("generatePolicy - Enter || quoteNo: "+info.getQuoteNo());
		String policyNo = "", debitNoteNo="",creditNoteNo="",commission="0",certNo="", result="",commissionAmt="0",taxAmt="0", error="", status="", debitTo="", creditTo="", debitToId="", creditToId="";
		Map<String, Object> quoteInfo=null;
		Map<String, Object> lcInfo=null;
		Map<String, Object> commissionInfo=null;
		Map<String, String> map=null;
		int count=0;
		double usedSI=0, lcBal=0,available=0;
		try 
		{
			quoteInfo=getResultMap("GET_QUOTE_STATUS", new String[]{info.getQuoteNo()});
			//this.mytemplate.update("update marine_data set marine_premium=nvl(premium,0)-nvl(war_premium,0)-round(nvl(policy_fee,0))-round(nvl(govt_tax,0))-round(nvl(emergency_fund,0)) where application_no=?",new Object[]{info.getApplicationNo()});
			count=this.mytemplate.queryForInt(getQuery("CNT_QUOTE"), new String[]{info.getQuoteNo()});
			if(quoteInfo!=null && !quoteInfo.isEmpty() && count>0){
				if("Referal".equalsIgnoreCase((String)quoteInfo.get("REMARKS"))){
					policyNo="ERROR: QUOTE REFERRAL";
				}else if("P".equalsIgnoreCase((String)quoteInfo.get("STATUS"))){
					policyNo=(String)quoteInfo.get("POLICY_NO");
				}else if(Double.parseDouble(quoteInfo.get("PREMIUM").toString())<=0 && !"GHQ".equalsIgnoreCase(info.getBrokerType()) && !info.isEndt()){
					policyNo="ERROR: INVALID PREMIUM";
				}else if("Y".equalsIgnoreCase((String)quoteInfo.get("STATUS")) || "E".equalsIgnoreCase((String)quoteInfo.get("STATUS"))){
					/*if("11".equals(info.getProductId()) && !"E".equalsIgnoreCase((String)quoteInfo.get("STATUS"))){
						certNo=getCertNo(new ReportDAO().getOriginalPolicyNo(info.getOpenCoverPolicyNo()));
					}
					if("11".equals(info.getProductId()) && StringUtils.isEmpty(certNo) && !"E".equalsIgnoreCase((String)quoteInfo.get("STATUS"))){
						policyNo="ERROR: INVALID CERT NO";
					}else{*/
						if(!info.isEndt()){
							//policyNo=getPolicyNo(info.getBranchCode(), info.getProductId(), info.getOpenCoverPolicyNo())+certNo;
							policyNo=getPolicyNo(info.getQuoteNo(),info.getBranchCode(), info.getProductId(), info.getOpenCoverPolicyNo(), belongingBranch);
						}else{
							policyNo=(String)quoteInfo.get("POLICY_NO");
						}
						count=this.mytemplate.queryForInt(getQuery("CNT_POLICY_NO"), new String[]{policyNo, info.getQuoteNo()});
						if(count>0){
							policyNo="ERROR: INVALID POLICY NO";
						}else{
							int depositPremiumCount = 0;
							
							if("11".equals(info.getProductId())) {
								depositPremiumCount = this.mytemplate.queryForInt(getQuery("GET_DEPOSITPREMIUM_STATUS"),new Object[]{info.getOpenCoverPolicyNo()});
								
							}
							if(depositPremiumCount<=0) {
								commission=getValue("GET_POL_COM", new String[]{info.getApplicationNo()});
							
							
								if(StringUtils.isEmpty(commission)){
									//commission=getCommissionPercent(info.getLoginId(), info.getProductId(), info.getOpenCoverPolicyNo(),info.getIssuer());
									commission = getCommissionPercent(info.getLoginId(), info.getProductId(), info.getOpenCoverPolicyNo(),info.getIssuer(),info.getApplicationNo(),info.getBranchCode());
								}
								if(StringUtils.isNotBlank(commission) && !"0".equals(commission)) {
									commissionInfo=getResultMap("GET_COMMISSION", new String[]{commission,info.getBrokerTax(),info.getApplicationNo()});
									if(commissionInfo!=null && !commissionInfo.isEmpty()){
										commissionAmt=commissionInfo.get("COMMISSION").toString();
										//taxAmt=commissionInfo.get("TAX").toString();
									}
								}
								/*String directStatus = new QuotationDAO().getDirectStatus(info.getApplicationNo(),info.getBranchCode());
								if("Y".equalsIgnoreCase(directStatus) && !"5".equals(info.getExecutive())) {
									commission = getExecutiveCommission(info.getExecutive(),info.getProductId(),info.getOpenCoverPolicyNo());
									if(StringUtils.isNotBlank(commission) && !"0".equals(commission)) {
										commissionInfo=getResultMap("GET_COMMISSION", new String[]{commission,info.getBrokerTax(),info.getApplicationNo()});
										if(commissionInfo!=null && !commissionInfo.isEmpty()){
											commissionAmt=commissionInfo.get("COMMISSION").toString();
											//taxAmt=commissionInfo.get("TAX").toString();
										}
									}
								}*/
								Map<String, String> DebitCreditTo = new CommonDAO().getDebitCreditTo(info.getApplicationNo(),info.getProductId(), info.getOpenCoverPolicyNo(), info.getChannelType(), info.getLoginId(), info.getCustomerId(),info.getBranchCode(), quoteInfo.get("PREMIUM").toString(), commissionAmt,info.getQuoteNo());
								debitTo = DebitCreditTo.get("DEBIT")==null?"":DebitCreditTo.get("DEBIT");
								creditTo = DebitCreditTo.get("CREDIT")==null?"":DebitCreditTo.get("CREDIT");
								debitToId = DebitCreditTo.get("DEBIT_ID")==null?"":DebitCreditTo.get("DEBIT_ID");
								creditToId = DebitCreditTo.get("CREDIT_ID")==null?"":DebitCreditTo.get("CREDIT_ID");
								debitNoteNo = DebitCreditTo.get("DEBIT_NOTE_NO")==null?"":DebitCreditTo.get("DEBIT_NOTE_NO");
								creditNoteNo = DebitCreditTo.get("CREDIT_NOTE_NO")==null?"":DebitCreditTo.get("CREDIT_NOTE_NO");
							}
							
							//result=getValue("GET_SYSDATE", new String[]{info.getBranchCode(), info.getQuoteNo()});
							Object args[] = new Object[21];
							args[0] = policyNo;
							args[1] = info.getPdfPremiumYN();
							args[2] = info.getPdfBankerYN();
							args[3] = info.getPdfGenerateStatus();
							args[4] = info.getPdfBankerAssuredYN();
							args[5] = info.getPdfCurrencyYN();
							args[6] = new ReportDAO().getOriginalPolicyNo(info.getOpenCoverPolicyNo());
							args[7] = info.getNoteType();
							args[8] = info.getPaymentMode();
							args[9] = info.getBasisVal();
							args[10] = info.getDebitCustomerId();
							args[11] = info.getCertClausesYN();
							args[12] = Double.parseDouble(commissionAmt.length()<=0?"0.0":commissionAmt);
							args[13] = Double.parseDouble(taxAmt.length()<=0?"0.0":taxAmt);
							args[14] = info.getEndtPremYN();
							args[15] = info.getEndtClausesYN();
							args[16] = info.getPdfExcessYN();
							args[17] = info.getPdfRubberStampYN();
							args[18] = Double.parseDouble(commission.length()<=0?"0.0":commission);
							args[19] = info.getQuoteNo();
							args[20] = info.getAmendId();
							String issueDate="";
							String closingInfo[][]=getMonthEndClosingInfo(info.getBranchCode());
							if(closingInfo!=null && closingInfo.length>0 ){
								issueDate=closingInfo[0][0]==null?"":closingInfo[0][0];
							}
							String DubaiTradeStatus=getDubaiTradeStatus(info.getLoginId(), info.getBranchCode()); 
							if("Y".equalsIgnoreCase(DubaiTradeStatus)){
								issueDate=getSysdate();
							}
							logger.info("args >> "+StringUtils.join(replaceEmptyIfNull(args),","));							
							this.mytemplate.update(getQuery("UPD_POLICY_INFO"), replaceEmptyIfNull(args));
							this.mytemplate.update(getQuery("UPD_WEBSERVICE_MARINE_QUOTE_POLICY_INFO"), new String[]{policyNo, "P", info.getQuoteNo()});
							this.mytemplate.update(getQuery("UPD_INCEPTION_DATE"), new String[]{issueDate,issueDate,info.getQuoteNo()});
							
							if(StringUtils.isEmpty(info.getIssuer())){
								new com.maan.quotation.dao.PremiumDAO().updateEndtEffDate(issueDate,info.getQuoteNo(),"User");
							}
							new VatPremiumCalc().updateMarineVatinfo(info.getQuoteNo(),info.getBranchCode(),info.getProductId());

							/**Policy Generation without Intragation Valiation - Start**/
							this.mytemplate.update(getQuery("UPD_POLICY_STS"), replaceEmptyIfNull(new String[]{ issueDate,issueDate, issueDate , debitNoteNo, creditNoteNo, debitTo, creditTo, debitToId, creditToId,info.getQuoteNo(), info.getAmendId()}));
							/**Policy Generation without Intragation Valiation - End**/
							if(info.isEndt()){
								//map=(Map<String, String>)policyIntegration(policyNo);
								//map=(Map<String, String>)policyIntegrationNormal(info.getQuoteNo());
							}else{
								//map=(Map<String, String>)policyIntegrationNormal(info.getQuoteNo());
							}
							/**Policy Generation without Intragation Valiation - Start**/
							/*if(!map.isEmpty()){
								error=(StringUtils.isBlank((String)map.get("ERROR"))?"":(String)map.get("ERROR")).toUpperCase();
								if(StringUtils.isEmpty(error)) {
									this.mytemplate.update(getQuery("UPD_POLICY_STS"), replaceEmptyIfNull(new String[]{issueDate, issueDate,issueDate, issueDate, issueDate, debitNoteNo, creditNoteNo, info.getQuoteNo(), info.getAmendId()}));*/
							/**Policy Generation without Intragation Valiation - End**/
									if("11".equalsIgnoreCase(info.getProductId())){
										
										//To update utilized amount.
										String sumInsured="";
										if("E".equalsIgnoreCase((String)quoteInfo.get("STATUS"))){
											Map<String,Object> temp = this.mytemplate.queryForMap(getQuery("GET_SUM_INSURED_ENDT"), new Object[]{info.getApplicationNo()});
											double sumIns=Double.parseDouble(temp.get("SUMINSURED")==null?"0":temp.get("SUMINSURED").toString());
											double sumInsPrevious=Double.parseDouble(temp.get("SUMINSURED_PREV")==null?"0":temp.get("SUMINSURED_PREV").toString());
											sumInsured=String.valueOf(sumIns-sumInsPrevious);
										}else{
											sumInsured=(String)this.mytemplate.queryForObject(getQuery("GET_SUM_INSURED"),new Object[]{info.getApplicationNo()}, String.class);
										}
										this.mytemplate.update(getQuery("UPDATE_OPEN_COVER_UTILIZED_AMOUNT"),new Object[]{sumInsured,info.getOpenCoverPolicyNo()});
										
										
										//To update LC utilized amount.
										/*lcInfo=this.mytemplate.queryForMap(getQuery("GET_LC_INFO"), new String[]{info.getQuoteNo()});
										if(lcInfo!=null && !lcInfo.isEmpty()){
											if(info.isEndt()){
												result = getValue("GET_ENDT_SI_DIFF", new String[]{info.getQuoteNo()});
											}else{
												result = getValue("GET_TOTAL_USED_SI", new String[]{StringUtils.isBlank(lcInfo.get("OPEN_LC_ID").toString())?"":lcInfo.get("OPEN_LC_ID").toString(),StringUtils.isBlank(lcInfo.get("OPEN_BANK_ID").toString())?"":lcInfo.get("OPEN_BANK_ID").toString(),info.getOpenCoverPolicyNo(),info.getQuoteNo()});
											}
											usedSI = Double.parseDouble(StringUtils.isBlank(result)?"0":result);
											result = getValue("GET_LC_BAL_AMT", new String[]{StringUtils.isBlank(lcInfo.get("OPEN_LC_ID").toString())?"":lcInfo.get("OPEN_LC_ID").toString(),StringUtils.isBlank(lcInfo.get("OPEN_BANK_ID").toString())?"":lcInfo.get("OPEN_BANK_ID").toString(),info.getOpenCoverPolicyNo()});
											lcBal = Double.parseDouble(StringUtils.isBlank(result)?"0":result);
											available = lcBal - usedSI;
											this.mytemplate.update(getQuery("UPD_LC_INFO"), new String[]{String.valueOf(available),StringUtils.isBlank(lcInfo.get("OPEN_LC_ID").toString())?"":lcInfo.get("OPEN_LC_ID").toString(),StringUtils.isBlank(lcInfo.get("OPEN_BANK_ID").toString())?"":lcInfo.get("OPEN_BANK_ID").toString(),info.getOpenCoverPolicyNo()});
										}	*/
									}
								/**Policy Generation without Intragation Valiation - Start**/
								/*} else{
									policyNo=error;
								}
							}else{
								policyNo="INTEGRATION ERROR";
							}*/
							/**Policy Generation without Intragation Valiation - End**/
							//Cr_dr table insert marineIntegrationInsert
							new CommonDAO().drCrInsert(policyNo, info.getBranchCode(), "Certificate","","",info.getProductId());
							new CommonDAO().marineIntegrationInsert(policyNo, info.getBranchCode(), "ONEOFFCERTIFICATE","","",info.getProductId());
						}
					/*}*/
				}
			}else{
				policyNo="ERROR: INVALID QUOTE";
			}
		}catch (Exception e){
			logger.debug("Exception @{"+e+"}");
			e.printStackTrace();
		}
		logger.info("generatePolicy - Exit || Result: "+policyNo);
		return policyNo;
	}
	public String getCertNo(String openCoverNo) throws BaseException,SQLException
	{
		logger.info("getCertNo - Enter || openCoverNo: " + openCoverNo);
		String certNo = "", ckey = "";
		CallableStatement cstmt = null;
		Connection con = null;
		try {
			ckey = getValue("GET_OC_CKEY", new String[] {openCoverNo});
			if (StringUtils.isNotEmpty(ckey)) {
				con = this.mytemplate.getDataSource().getConnection();
				cstmt = con.prepareCall(getQuery("GET_CERT_NO"));
				cstmt.setString(1, ckey);
				cstmt.setString(2, "C02");
				cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				cstmt.execute();
				certNo = cstmt.getString(3);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (cstmt != null)
					cstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null && !con.isClosed())
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("getCertNo - Exit || certNo: " + certNo);
		return certNo;
	}
	public String getPolicyNo(String quoteNo, String branchCode,String productId,String openCoverNo,String belongingBranch) {
		logger.info("getPolicyNo - Enter");
		String result=""/*, productPrefix=""*/;
		String args[]=null;
		CallableStatement cstmt=null;
		Connection con=null;
		try{
			if(getSource().equalsIgnoreCase("ORACLE")){
				if("3".equals(productId)){
					sql=getQuery("GET_PROD_PREFIX");
					String productPrefix=(String)this.mytemplate.queryForObject(sql,new String[]{productId, branchCode},String.class);
					sql="SELECT A.BRANCH_PREFIX||B.REMARKS||?||C.DETAIL_NAME||LPAD(POLICY_NUMBER_SEQ_?.NEXTVAL,C.REMARKS,0) FROM BRANCH_MASTER A, CONSTANT_DETAIL B, CONSTANT_DETAIL C  WHERE A.BRANCH_CODE=? AND B.BRANCH_CODE=A.BRANCH_CODE AND B.CATEGORY_ID=124 AND B.CATEGORY_DETAIL_ID=1 AND C.CATEGORY_ID=143 AND C.BRANCH_CODE=A.BRANCH_CODE";
					args=new String[]{productPrefix,branchCode,branchCode};
				}else{
					openCoverNo=new ReportDAO().getOriginalPolicyNo(openCoverNo);
					sql=getQuery("GET_POL_NO");
					args=new String[]{openCoverNo,branchCode};
				}
			}else{
				sql = getQuery("GET_POLICY_GENERATE_MARINE");
				
				SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName(getQuery("GET_POLICY_GENERATE_MARINE"));
		     	Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
		     	inputValues.put("Pvquote", quoteNo);
		     	inputValues.put("Pvbranch", branchCode);
		     	inputValues.put("Pvtype", "Policy");
		     	inputValues.put("PvProduct", productId);
		     	inputValues.put("pvout", "");		     			     	
		     	logger.info("Args==> " + inputValues.toString());
		     	Map<String, Object> outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
				logger.info("SP OUT SP=>"+outputValues.get("pvout"));
				result=outputValues.get("pvout").toString();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("getPolicyNo - Exit || policyNo: " + result);
		return result;
	}
	public boolean getOpenCoverNoteStatus(String openCoverNo)
	{
		logger.info("getOpenCoverNoteStatus - Enter || openCoverNo: "+openCoverNo);
		int count=0;
		try{
			sql=getQuery("GET_OC_NOTE_CNT");
			count=this.mytemplate.queryForInt(sql,new String[]{openCoverNo});
			logger.info("sql=>"+sql);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("getOpenCoverNoteStatus - Exit || Result: " + (count>0));
		return count>0;
	}
	/*public String getCommissionPercent(String loginId, String productId,String openCoverNo, String issuer) {
		logger.info("getCommissionPercent - Enter");
		String commission="";
		if("3".equals(productId)){
			//if(issuer!=null && !"".equals(issuer))
				//commission=getValue("GET_COMMISSION_PERCENT_ISSUER_ONEOFF", new String[]{loginId});
			if(commission==null || "".equals(commission))
				commission=getValue("GET_COMMISSION_PERCENT", new String[]{loginId, productId});
		}else if("11".equals(productId)){
			//if(issuer!=null && !"".equals(issuer))
				//commission=getValue("GET_COMMISSION_PERCENT_ISSUER_OPENCOVER", new String[]{loginId});
			if(commission==null || "".equals(commission))
				commission=getValue("GET_OC_COMMISSION_PERCENT", new String[]{openCoverNo});
		}
		logger.info("getCommissionPercent - Exit || Result: "+commission);
		return commission;
	}*/
	public String getCommissionPercent(String loginId, String productId,String openCoverNo, String issuer, String applicationNo, String branchCode) {
		logger.info("getCommissionPercent - Enter");
		String commission="";
		try {
			if(isEndt(applicationNo)) {
				commission = getValue("GET_ENDT_COMMISSION_PERCENT", new String[]{applicationNo});
			}
			else {
				String directStatus = new CommonDAO().getDirectStatus(applicationNo,branchCode);
				String executiveId = getValue("GET_EXECUTIVE_ID", new String[]{applicationNo});
				if("3".equals(productId)){
					if(!"Y".equalsIgnoreCase(directStatus)) {
						commission=getValue("GET_COMMISSION_PERCENT", new String[]{loginId, productId, loginId});
					}
					else if("Y".equalsIgnoreCase(directStatus) && !"5".equals(executiveId)) {
						commission = getValue("GET_EXECUTIVE_PERCENT",new String[]{executiveId});
					}
				} else if("11".equals(productId)){
					if(!"Y".equalsIgnoreCase(directStatus)) {
						commission=getValue("GET_OC_COMMISSION_PERCENT", new String[]{openCoverNo});
					}
					else if("Y".equalsIgnoreCase(directStatus) && !"5".equals(executiveId)) {
						commission = getValue("GET_OPENCOVER_EXECUTIVE_PERCENT",new String[]{openCoverNo,openCoverNo});
					}
				}
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		logger.info("getCommissionPercent - Exit || Result: "+commission);
		return commission;
	}
	public static String round(String value, String currencyId, String brokerType,String branchWiseCountry)
	{
		logger.info("round - Enter || currencyId: "+currencyId+" Value: "+value);
		if(NumberUtils.isNumber(value)){
			try{
				/*if("GHQ".equalsIgnoreCase(brokerType)){
					value=String.valueOf(Double.parseDouble(value)-Math.floor(Double.parseDouble(value))<0.51?Math.floor(Double.parseDouble(value)):Math.ceil(Double.parseDouble(value)));
				}*/
				value = new QuotationDAO().getSingleInfo("round", new String[]{value, currencyId, branchWiseCountry});
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		logger.info("round - Exit || Result: "+value);
		return value;
	}

	public static String roundGHQ(String value, String currencyId, String brokerType,String branchWiseCountry) {
		logger.info("round - Enter || currencyId: "+currencyId+" Value: "+value);
		if(NumberUtils.isNumber(value)){
			try{
				if("GHQ".equalsIgnoreCase(brokerType)){
					value=String.valueOf(Double.parseDouble(value)-Math.floor(Double.parseDouble(value))<0.51?Math.floor(Double.parseDouble(value)):Math.ceil(Double.parseDouble(value)));
				}
				value = new QuotationDAO().getSingleInfo("round", new String[]{value, currencyId, branchWiseCountry});
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		logger.info("round - Exit || Result: "+value);
		return value;
	}

	public Map<String, String> policyIntegration(final String policyNo)
	{
		logger.info("policyIntegration - Enter || policyNo: "+policyNo);
		Map<String, String> map=new HashMap<String, String>();
		CallableStatement cstmt = null;
		Connection con = null;
		try {
			con = DBConnection.getInstance().getDBConnection();
			cstmt = con.prepareCall("CALL INTEGRATION_TYPE_ENDT(?,?,?,?,?)");
			cstmt.setString(1, policyNo);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR); 
			cstmt.registerOutParameter(3, java.sql.Types.CHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			cstmt.execute();
			map.put("ERROR", cstmt.getString(2));
			map.put("STATUS", cstmt.getString(3));
			map.put("DN", cstmt.getString(4));
			map.put("CN", cstmt.getString(5));
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (cstmt != null)
					cstmt.close();
			} catch (Exception e) { e.printStackTrace();} 
			try {		
				if (con != null && !con.isClosed())
					con.close();
			} catch (Exception e) { e.printStackTrace(); }
		}
		logger.info("policyIntegration - Exit ");
		return 	map;
	}
	/*public Map<String, String> policyIntegrationNormal(final String policyNo) {
		logger.info("policyIntegrationNormal - Enter || policyNo: "+policyNo);
		Map<String, String> map=new HashMap<String, String>();
		CallableStatement cstmt = null;
		Connection con = null;
		try {
			con = DBConnection.getInstance().getDBConnection();
			cstmt = con.prepareCall("CALL INTEGRATION_TYPE(?,?,?,?,?)");
			cstmt.setString(1, policyNo);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.CHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			cstmt.execute();
			map.put("ERROR", cstmt.getString(2));
			map.put("STATUS", cstmt.getString(3));
			map.put("DN", cstmt.getString(4));
			map.put("CN", cstmt.getString(5));
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (cstmt != null)
					cstmt.close();
			} catch (Exception e) { e.printStackTrace();} 
			try {		
				if (con != null && !con.isClosed())
					con.close();
			} catch (Exception e) { e.printStackTrace(); }
		}
		logger.info("policyIntegrationNormal - Exit ");
		return 	map;
	}*/
	public Map<String, String> policyIntegrationNormal(final String quoteNo) {
		logger.info("policyIntegrationNormal - Enter || quoteNo: "+quoteNo);
		Map<String, String> map=new HashMap<String, String>();
		CallableStatement cstmt = null;
		Connection con = null;
		try {
			con = DBConnection.getInstance().getDBConnection();
			cstmt = con.prepareCall("CALL UPDATE_INTEGRATION_NEW(?,?)");
			cstmt.setString(1, quoteNo);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.execute();
			map.put("ERROR", cstmt.getString(2));
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (cstmt != null)
					cstmt.close();
			} catch (Exception e) { e.printStackTrace();} 
			try {		
				if (con != null && !con.isClosed())
					con.close();
			} catch (Exception e) { e.printStackTrace(); }
		}
		logger.info("policyIntegrationNormal - Exit ");
		return 	map;
	}

	public void updateMarineAndWarPremium(final String quoteNo)
	{
		logger.info("updateMarineAndWarPremium - Enter || quoteNo: "+quoteNo);
		try{
			this.mytemplate.update(getQuery("CAL_PROC_UPD_PREMIUM"), new String[]{quoteNo});
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("updateMarineAndWarPremium - Exit ");
	}
	public String updateApplicaitonNo(WebServicePolicyInfo info)
	{
		logger.info("updateApplicaitonNo - Enter || refNo: "+info.getRefNo());
		String result="";
		try 
		{
			String[] args=new String[2];
			args[0]=info.getApplicationNo();
			args[1]=info.getRefNo();
			this.mytemplate.update(getQuery("UPD_WS_QUOTE_APPNO"), args);
			this.mytemplate.update(getQuery("UPD_WS_COMM_APPNO"), args);
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("updateApplicaitonNo - Exit || Result: "+result);
		
		return result;
	}
	public void updateMarineCommodityInfo(String applicationNo, String[][] commodityInfo) 
	{
		try{
			if(commodityInfo!=null && commodityInfo.length>0){
				for (int i = 0; i < commodityInfo.length; i++) {
					this.mytemplate.update(getQuery("UPD_MRD_COMM_INFO"), new String[]{StringUtils.isBlank(commodityInfo[i][6])?"":commodityInfo[i][6].replaceAll("\n"," "), StringUtils.isBlank(commodityInfo[i][7])?"":commodityInfo[i][7].replaceAll("\n"," "), StringUtils.isBlank(commodityInfo[i][8])?"":commodityInfo[i][8].replaceAll("\n"," "), applicationNo,  StringUtils.isBlank(commodityInfo[i][0])?"":commodityInfo[i][0]});
				}
			}
		} 
		catch (Exception e) {
			System.out.println("ERROR in updateMarineCommodityInfo " + e.toString());e.printStackTrace();
		}
	}
	/*public boolean isEndt(String applicationNo)
	{
		logger.info("isEndt - Enter || applicationNo: "+applicationNo);
		int count=0;
		try{
			count=this.mytemplate.queryForInt(getQuery("CNT_POL_ENDT"),new String[]{applicationNo});
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("isEndt - Exit || Result: " + (count>0));
		return count>0;
	}*/
	/*public boolean isFinancial(String applicationNo)
	{
		logger.info("isFinancial - Enter || applicationNo: "+applicationNo);
		String endtType="";
		int count=0;
		boolean result=false;
		try{
			endtType=getValue("GET_POL_ENDT", new String[]{applicationNo});
			count=this.mytemplate.queryForInt(getQuery("CNT_ENDT_FINANCIAL").replace("?",endtType));
			result=count>0;
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("isFinancial - Exit || Result: " + (count>0));
		return result;
	}*/
	public void updateEndtPremium(final String quoteNo)
	{
		logger.info("updateEndtPremium - Enter || quoteNo: "+quoteNo);
		try{
			this.mytemplate.update(getQuery("CAL_UPD_ENDT_PRE"), new String[]{quoteNo});
		}catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		logger.info("updateEndtPremium - Exit ");
	}
	public boolean endtPolicyFee(String applicationNo)
	{
		logger.info("endtPolicyFee - Enter || applicationNo: "+applicationNo);
		int count=0;
		boolean result=false;
		try{
			count=this.mytemplate.queryForInt(getQuery("CNT_ENDT_POL_FEE"), new String[]{applicationNo});
			result=count>0;
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("endtPolicyFee - Exit || Result: " + (count>0));
		return result;
	}
	public void updateEndtPolicyFee(final String applicationNo, final String policyFee, final String govtTax)
	{
		logger.info("updateEndtPremium - Enter || applicationNo: "+applicationNo);
		try{
			this.mytemplate.update(getQuery("UPD_ENDT_MD_FEE"), new String[]{policyFee,govtTax,applicationNo});
			this.mytemplate.update(getQuery("UPD_MD_FEE"), new String[]{policyFee,govtTax,applicationNo});
			this.mytemplate.update(getQuery("UPD_PM_FEE"), new String[]{policyFee,govtTax,applicationNo});
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("updateEndtPremium - Exit ");
	}
	public boolean isOpenCoverDeposit(String openCoverNo)
	{
		logger.info("endtPolicyFee - Enter || openCoverNo: "+openCoverNo);
		int count=0;
		boolean result=false;
		try{
			count=this.mytemplate.queryForInt(getQuery("CNT_OC_DEPOSIT"), new String[]{openCoverNo});
			result=count>0;
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("endtPolicyFee - Exit || Result: " + (count>0));
		return result;
	}
	public String getNoteTypeInfo(String applicationNo)
	{
		logger.info("getNoteTypeInfo - Enter || applicationNo: "+applicationNo);
		String result="";
		try{
			sql = getQuery("GET_NOTE_TYPE");
			result=(String)this.mytemplate.queryForObject(sql, new String[]{applicationNo}, String.class);
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("getNoteTypeInfo - Exit || Result: "+result);
		return result;
	}
	public String getPaymentModeInfo(String applicationNo)
	{
		logger.info("getPaymentModeInfo - Enter || applicationNo: "+applicationNo);
		String result="";
		try{
			sql = getQuery("GET_PAYMENT_MODE");
			result=(String)this.mytemplate.queryForObject(sql, new String[]{applicationNo}, String.class);
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("getPaymentModeInfo - Exit || Result: "+result);
		return result;
	}
	public String getEndtType(String applicationNo)
	{
		logger.info("getEndtType - Enter || applicationNo: "+applicationNo);
		String endtType="";
		try 
		{
			endtType=getValue("GET_POL_ENDT", new String[]{applicationNo});
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getEndtType - Exit || Result: "+endtType);
		
		return endtType;
	}
	public String[][] getMonthEndClosingInfo(String branchCode)
	{
		logger.info("getMonthEndClosingInfo- Enter || branchCode: "+branchCode);
		//String[][] closingInfo=runner.multipleSelection("SELECT NVL((SELECT TO_CHAR(CLO_MONTHEND_DT, 'DD-MM-YYYY') FROM t_trn_closing WHERE   TO_DATE (SYSDATE, 'DD-MM-YYYY') BETWEEN TO_DATE (CLO_DATE_OPENED,'DD-MM-YYYY')  AND  TO_DATE (CLO_DATE_CLOSED,'DD-MM-YYYY')  AND branch_code = ? AND PRODUCT_CORE_CODE=1),TO_CHAR (SYSDATE, 'DD-MM-YYYY HH24:MI:SS') ) CLO_MONTHEND_DT, decode(NVL((SELECT   TO_DATE (CLO_MONTHEND_DT, 'DD-MM-YYYY') FROM   t_trn_closing WHERE   TO_DATE (SYSDATE, 'DD-MM-YYYY') BETWEEN TO_DATE (CLO_DATE_OPENED,'DD-MM-YYYY') AND  TO_DATE (CLO_DATE_CLOSED, 'DD-MM-YYYY')  AND branch_code =?  AND PRODUCT_CORE_CODE=1),TRUNC(SYSDATE)),TRUNC(SYSDATE),'N','Y') flag  FROM DUAL",new String[]{branchCode,branchCode});
		String[][] closingInfo=runner.multipleSelection(getQuery("CLOSETRN_BLOCK"),new String[]{branchCode});
		logger.info("getMonthEndClosingInfo - Exit || Result: "+closingInfo);
		return closingInfo;
	}
	public String getSysdate()
	{
		logger.info("getSysdate- Enter || branchCode: ");
		String Sysdate=runner.singleSelection(getQuery("GET_SYSDATECL"));
		logger.info("getSysdate - Exit || Result: "+Sysdate);
		return Sysdate;
	}
	public String getDubaiTradeStatus(String loginId, String loginBranch)
	{
		String DubaiTradeStatus=runner.singleSelection(getQuery("GET_DUBAI_TRADE"),new String[]{loginId,loginBranch});
		return DubaiTradeStatus;
	}
	public String getPromationalPremium(String promotinalCode, String brokerCode, String loginBranch) {
		String discountRate="0";
		logger.info("GET PROMATIONAL PREMIUM- ENTER || PROMOTINALCODE:" +promotinalCode +"|| BROKERCODE:" +brokerCode + " || LOGINBRANCH:" +loginBranch);
		try{
			discountRate=runner.singleSelection(getQuery("GET_PROMOTION"),new String[]{promotinalCode,loginBranch});
		}catch(Exception e){
			discountRate="0";
		}
		logger.info("EXIT FROM GETPROMATIONALPREMIUM");
		return discountRate;
	}

	public void updateDiscountPercentage(String discountPercentage, String promotinalCode, String applicationNo)
	{
		logger.info("UPDATE DISCOUNT PERCENTAGE- ENTER || DISCOUNT PERCENTAGE:" +discountPercentage +"|| PROMOTINALCODE:" +promotinalCode + " || APPLICATIONNO:" +applicationNo);
		try{
			runner.multipleUpdation(getQuery("UPD_PD_CODE"),new String[]{promotinalCode,discountPercentage,applicationNo});
			runner.multipleUpdation(getQuery("UPD_WSB_CODE"),new String[]{discountPercentage,applicationNo});
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("EXIT FROM UPDATEDISCOUNTPERCENTAGE");
	}
	public boolean checkFinancialEndtCategory(String endtType) {
		logger.info("getEndtYype - Enter || branchCode: "+endtType);
		boolean financialEndt=true;
		List endtCategory=null;
		try {
			sql = getQuery("GET_ENDT_CODE",new Object[]{endtType});
			endtCategory=this.mytemplate.queryForList(sql);
			if(endtCategory!=null && endtCategory.size()==1){
				financialEndt="1".equals(((Map)endtCategory.get(0)).get("ENDT_TYPE_CATEGORY_ID").toString())?false:true;
			}
		}catch(Exception e){
			logger.debug("Exception @ {"+e+"}");
		}
		logger.info("getEndtYype - Exit");
		return financialEndt;
	}

	public String getCoverReferral(String coverage, String coverageValue,String[] values) {
		String discountRate="0";
		logger.info("getCoverReferral - ENTER");
		try{
			sql=getQuery("rate.coverreferral", new Object[]{coverage,coverageValue});
			discountRate=(String)this.mytemplate.queryForObject(sql, values, String.class);
		}catch(Exception e){
			discountRate="0";
		}
		logger.info("EXIT FROM getCoverReferral");
		return discountRate;
	}
	public String getBelongingBranch(String branchCode) {
		String belongingBranch = "";
		try {
			String sql = getQuery("GET_BLONG_BRANCH");
			belongingBranch = (String) this.mytemplate.queryForObject(sql, new Object[]{branchCode},String.class);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return belongingBranch;
	}
	/*public String getExecutiveCommission(String executiveId, String productId, String openCoverNo) {
		String commission = "";
		try {
			if("3".equals(productId)) {
				commission = getValue("GET_EXECUTIVE_PERCENT",new String[]{executiveId});
			}
			else if("11".equals(productId)) {
				commission = getValue("GET_OPENCOVER_EXECUTIVE_PERCENT",new String[]{openCoverNo,openCoverNo});
			}
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return commission;
	}
	public String getBrokerCommission(String applicationNo, String productId) {
		 String commision="0";
		 try{
			 
			 sql=getQuery("GET_COMMISSION_DETAILS");
				Map map = this.mytemplate.queryForMap(sql,new String[]{applicationNo,productId});
				commision=map.get("COMMISSION")==null?"0":map.get("COMMISSION").toString();
		 }catch (Exception e) {
			 logger.debug(e);
		}
		return commision; 
	 }*/
	public void updateCommission(String brokerCommission,String applicationNo) {
		try{
			 	 sql=getQuery("UPD_COMMISSION_DETAILS");
			 	 this.mytemplate.update(sql,new String[]{brokerCommission,applicationNo});
		 }catch (Exception e) {
			 logger.debug(e);
		}
		
	}
	public String getEndtYype(String quoteNo) {
		logger.info("getEndtYype - Enter || applicationNo: "+quoteNo);
		String endtType=null;
		try {
			sql = getQuery("get_pd_ENDTYPE");
			endtType=(String)this.mytemplate.queryForObject(sql,  new String[]{quoteNo}, String.class);
		}catch(Exception e){
			logger.debug("Exception @ {"+e+"}");
		}
		logger.info("getEndtYype - Exit");
		return endtType;
	}
	public Map<String,Object> quoteMailList(String applicationNo, String branchCode, String mailType) throws Exception {
		Map<String,Object> resultMap= new HashMap<String,Object>();
		String query = "";
		String directStatus = new CommonDAO().getDirectStatus(applicationNo,branchCode);
		Object[] args = null;
		if("quoteMail".equalsIgnoreCase(mailType)) {
			if("Y".equalsIgnoreCase(directStatus)) {
				query = getQuery("GET_QUOTE_USER_MAILIDS");
			}
			else {
				query = getQuery("GET_QUOTE_MAILIDS");
			}
			args = new Object[]{applicationNo};
		}
		else if("referralRequest".equalsIgnoreCase(mailType)) {
			//query = getQuery("GET_REFERRAL_REQ_MAILIDS");
			query = getQuery("GET_UW_REFLIST");
			args = new Object[]{applicationNo,branchCode};
		}
		else if("referralResponse".equalsIgnoreCase(mailType)) {
			if("Y".equalsIgnoreCase(directStatus)) {
				query = getQuery("GET_QUOTE_USER_MAILIDS");
			}
			else {
				query = getQuery("GET_QUOTE_MAILIDS");
			}
			args = new Object[]{applicationNo};
		}
		else if("branchReport".equalsIgnoreCase(mailType)) {
			query = getQuery("GET_BRANCH_MAILIDS");
			args = new Object[]{branchCode};
		}else if("claimIntimation".equalsIgnoreCase(mailType)) {
			query = getQuery("GET_CLAIM_INFO");
			args = new Object[]{branchCode};
		}
		
		//Executing in Query
		if(!"referralRequest".equalsIgnoreCase(mailType)){
			resultMap= this.mytemplate.queryForMap(query,args);
		}else{
			// Only For "referralRequest"
			List<Map<String,Object>> referrlList = this.mytemplate.queryForList(query,args);
			String mailids="";
			for(int i=0;i<referrlList.size();i++){
				mailids+=referrlList.get(i).get("USER_MAIL").toString()+",";
			}
			resultMap.put("TO_ADDRESS", "".equals(mailids)?null:mailids.substring(0, mailids.length()-1));
		}
		
		return resultMap;
	}
	public String validateSumInsured(String applicationNo, String openCoverNo) {
		String sumInsured="",status="";
		try{
			if(isEndt(applicationNo)){
				logger.info("Sum Ins ENDT "+getQuery("GET_SUM_INSURED_ENDT")+"\n args "+applicationNo);
				Map<String,Object> temp = this.mytemplate.queryForMap(getQuery("GET_SUM_INSURED_ENDT"), new Object[]{applicationNo});
				double sumIns=Double.parseDouble(temp.get("SUMINSURED")==null?"0":temp.get("SUMINSURED").toString());
				double sumInsPrevious=Double.parseDouble(temp.get("SUMINSURED_PREV")==null?"0":temp.get("SUMINSURED_PREV").toString());
				sumInsured=String.valueOf(sumIns-sumInsPrevious);
			}else{
				logger.info("Sum Ins Normal "+getQuery("GET_SUM_INSURED")+"\n args "+applicationNo);
				sumInsured=(String)this.mytemplate.queryForObject(getQuery("GET_SUM_INSURED"),new Object[]{applicationNo}, String.class);
			}
			   status=(String)this.mytemplate.queryForObject(getQuery("validate.sum.insured"),new Object[]{sumInsured,openCoverNo}, String.class);
			   logger.info("isValidSumIns===> "+status);
			}catch(Exception e){
				e.printStackTrace();
			}
		 return status;
	}
	public  double trunc(String type,String valueOf,String round) {
		double value=0.0;
			try{
				if("trunc".equalsIgnoreCase(type)){
				  value =(Double)this.mytemplate.queryForObject(getQuery("GET_TRUNC"),new Object[]{valueOf,round}, Double.class);
				}else{
					value =(Double)this.mytemplate.queryForObject(getQuery("GET_ROUND"),new Object[]{valueOf,round}, Double.class);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		logger.info("round - Exit || Result: "+value);
		return value;
	}
	public Map<String,Object>  getPolicyFeeYN(String applicationNo)
	{
		logger.info("getEndtType - Enter || applicationNo: "+applicationNo);
		Map<String, Object> policyFeeList=null;
		try 
		{
			policyFeeList=(Map<String,Object>)getResultMap("GET_POLICFEEYN", new String[]{applicationNo});;
		} catch (Exception e) {
			logger.debug(e);
		}
		logger.info("getPolicyFeeYN - Exit || Result: "+policyFeeList);
		
		return policyFeeList;
	}
}
