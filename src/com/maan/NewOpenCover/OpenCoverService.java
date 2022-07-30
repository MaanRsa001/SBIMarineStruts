package com.maan.NewOpenCover;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;

import com.maan.NewOpenCover.Api.ApiForCommodity;
import com.maan.NewOpenCover.Api.ApiForCover;
import com.maan.NewOpenCover.Api.ApiForCustomer;
import com.maan.NewOpenCover.Api.ApiForDestCountry;
import com.maan.NewOpenCover.Api.ApiForDropDown;
import com.maan.NewOpenCover.Api.ApiForEndorsement;
import com.maan.NewOpenCover.Api.ApiForModeOfTransport;
import com.maan.NewOpenCover.Api.ApiForOrgCountry;
import com.maan.NewOpenCover.Api.ApiForPolicyGen;
import com.maan.NewOpenCover.Api.ApiForPremiumCal;
import com.maan.NewOpenCover.Api.ApiForQuotationinfo;
import com.maan.NewOpenCover.Api.ApiForSaleTerm;
import com.maan.NewOpenCover.Api.ApiForSharePercent;
import com.maan.NewOpenCover.Api.ApiForTolerance;
import com.maan.NewOpenCover.Api.ApiForVehicle;
import com.maan.NewOpenCover.Api.ApiForWarrate;
import com.maan.NewOpenCover.thread.MyTaskList;
import com.opensymphony.xwork2.ActionContext;


public class OpenCoverService {
	Map<String, Object> session=ActionContext.getContext().getSession();
	public static ForkJoinPool forkJoinPool = new ForkJoinPool(2);

	public List<Object> getDropDownList(OpenCoverBean bean, String type) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForDropDown grid=null;		
				grid=new ApiForDropDown(bean,type,"");	
			if(grid!=null)
				result=grid.getDropDownList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getCustomerList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCustomer grid=null;		
				grid=new ApiForCustomer(bean,"customerlist");	
			if(grid!=null)
				result=grid.getCustomerList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String insertCustomerApi(OpenCoverBean bean) {
		String result="";
		try {
			ApiForCustomer grid=null;		
				grid=new ApiForCustomer(bean,"insertcustomer");	
			if(grid!=null)
				result=grid.insertCustomerApi();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String insertQuoteInfoApi(OpenCoverBean bean) {
		String result="";
		try {
			ApiForQuotationinfo grid=null;		
				grid=new ApiForQuotationinfo(bean,"insertquoteinfo");	
			if(grid!=null)
				result=grid.insertQuoteInfoApi();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getQuoteInformation(OpenCoverBean bean) {
		try {
			ApiForQuotationinfo grid=null;		
				grid=new ApiForQuotationinfo(bean,"editquoteinfo");	
			if(grid!=null)
				grid.getQuoteInformation();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getCountryList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"countrylist");	
			if(grid!=null)
				result=grid.getCountryList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getContientList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"contientlist");	
			if(grid!=null)
				result=grid.getContinentList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getCommodityList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"commoditylist");	
			if(grid!=null)
				result=grid.getCommodityList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getSaleTermList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForSaleTerm grid=null;		
				grid=new ApiForSaleTerm(bean,"saletermlist");	
			if(grid!=null)
				result=grid.getSaleTermList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getToleranceList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForTolerance grid=null;		
				grid=new ApiForTolerance(bean,"tolerancelist");	
			if(grid!=null)
				result=grid.getToleranceList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getIncludeExcludeCountryList(OpenCoverBean bean) {
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"includeexcludecountrylist");	
			if(grid!=null)
				grid.getIncludeExcludeCountryList();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getIncludeExcludeSaleList(OpenCoverBean bean) {
		try {
			ApiForSaleTerm grid=null;		
				grid=new ApiForSaleTerm(bean,"includeexcludesaletermlist");	
			if(grid!=null)
				grid.getIncludeExcludeSaleTermList();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getIncludeExcludeToleranceList(OpenCoverBean bean) {
		try {
			ApiForTolerance grid=null;		
				grid=new ApiForTolerance(bean,"includeexcludetolerancelist");	
			if(grid!=null)
				grid.getIncludeExcludeToleranceList();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertModeCoverApi(OpenCoverBean bean) {
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"insertmodecover");	
			if(grid!=null)
				grid.insertmodecover();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void savecommodity(OpenCoverBean bean) {
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"insertcommodity");	
			if(grid!=null)
				grid.savecommodity();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void editcommodity(OpenCoverBean bean) {
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"editcommodity");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void saveOrgcountry(OpenCoverBean bean) {
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"saveorgcountry");	
			if(grid!=null)
				grid.saveorgcountry();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editOrgcountry(OpenCoverBean bean) {
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"editorgcountry");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void savedestcountry(OpenCoverBean bean) {
		try {
			ApiForDestCountry grid=null;		
				grid=new ApiForDestCountry(bean,"savedestcountry");	
			if(grid!=null)
				grid.savedestcountry();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editdestcountry(OpenCoverBean bean) {
		try {
			ApiForDestCountry grid=null;		
				grid=new ApiForDestCountry(bean,"editdestcountry");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void saveSaleterm(OpenCoverBean bean) {
		try {
			ApiForSaleTerm grid=null;		
				grid=new ApiForSaleTerm(bean,"savesaleterm");	
			if(grid!=null)
				grid.savesaleterm();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editsaleterm(OpenCoverBean bean) {
		try {
			ApiForSaleTerm grid=null;		
				grid=new ApiForSaleTerm(bean,"editsaleterm");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void saveTolerance(OpenCoverBean bean) {
		try {
			ApiForTolerance grid=null;		
				grid=new ApiForTolerance(bean,"savetolerance");	
			if(grid!=null)
				grid.savetolerance();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void edittolerance(OpenCoverBean bean) {
		try {
			ApiForTolerance grid=null;		
				grid=new ApiForTolerance(bean,"edittolerance");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getModeOfTransportList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"modeoftransport");	
			if(grid!=null)
				result=grid.getModeOfTransportList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getCoverageList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCover grid=null;		
				grid=new ApiForCover(bean,"coverlist");	
			if(grid!=null)
				result=grid.getCoverageList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public void getSecondPageInfo(OpenCoverBean bean) {
		
		List<Callable<Object>> queue = new ArrayList<Callable<Object>>();
		
		try {
			bean.setSpringtoken(session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			ApiForOrgCountry editorgcountry=new ApiForOrgCountry(bean,"editorgcountry");		
			queue.add(editorgcountry);
			
			ApiForDestCountry editdestcountry=new ApiForDestCountry(bean,"editdestcountry");		
			queue.add(editdestcountry);
				
			ApiForCommodity editcommodity=new ApiForCommodity(bean,"editcommodity");		
			queue.add(editcommodity);
			
			ApiForSaleTerm editsaleterm=new ApiForSaleTerm(bean,"editsaleterm");
			queue.add(editsaleterm);
			
			ApiForTolerance edittolerance=new ApiForTolerance(bean,"edittolerance");	
			queue.add(edittolerance);
			
			ApiForCustomer editchcustomer=new ApiForCustomer(bean,"editchcustomer");	
			queue.add(editchcustomer);
			
			if(queue!=null && queue.size()>0) {
				MyTaskList taskList = new MyTaskList(queue);
				ConcurrentLinkedQueue<Future<Object>> invoke = (ConcurrentLinkedQueue<Future<Object>>) forkJoinPool
						.invoke(taskList);

				int success = 0;
				for (Future<Object> callable : invoke) {
					System.out.println(callable.getClass() + "," + callable.isDone());
					if (callable.isDone()) {
						System.out.println("getSecondPageInfo List is Done");
						success++;
					}
				}
				String complete = (queue.size() == success) ? "yes" : "No";
				System.out.println("Dropdown Completed related to  " + complete);
			}else {
				System.out.println("getSecondPageInfo List is Empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void savechcustomer(OpenCoverBean bean) {
		try {
			ApiForCustomer grid=null;		
				grid=new ApiForCustomer(bean,"savechcustomer");	
			if(grid!=null)
				grid.savechcustomer();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editchcustomer(OpenCoverBean bean) {
		try {
			ApiForCustomer grid=null;		
				grid=new ApiForCustomer(bean,"editchcustomer");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void geteditModeofCover(OpenCoverBean bean) {
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"editmodecover");	
			if(grid!=null)
				grid.call();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getEditCommodityList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"editcommoditylist");	
			if(grid!=null)
				result=grid.getEditCommodityList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void commodityRate(OpenCoverBean bean) {
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"editcommodityrate");	
			if(grid!=null)
				grid.editcommodityRate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addCommodityRate(OpenCoverBean bean) {
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"addcommodityrate");	
			if(grid!=null)
				grid.addCommodityRate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getCovertypeList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCover grid=null;		
				grid=new ApiForCover(bean,"covertypelist");	
			if(grid!=null)
				result=grid.getCovertypeList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getCoverClausesList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCover grid=null;		
				grid=new ApiForCover(bean,"coverclauseslist");	
			if(grid!=null)
				result=grid.getCoverClausesList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getCommodityInfo(OpenCoverBean bean) {
		try {
			ApiForCommodity grid=null;		
				grid=new ApiForCommodity(bean,"commodityinfo");	
			if(grid!=null)
				grid.getCommodityInfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<Object> getWarCityList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForOrgCountry grid=null;		
				grid=new ApiForOrgCountry(bean,"warcitylist");	
			if(grid!=null)
				result=grid.getWarCityList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Object> getEditModeTransportList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"warmodelist");	
			if(grid!=null)
				result=grid.getEditModeTransportList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getModewarRateList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"warmoderatelist");	
			if(grid!=null)
				result=grid.getModewarRateList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getpremiuminfo(OpenCoverBean bean) {
		try {
			ApiForPremiumCal grid=null;		
				grid=new ApiForPremiumCal(bean,"getpremiuminfo");	
			if(grid!=null)
				grid.getPremiumInformation();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void insertpremiuminfo(OpenCoverBean bean) {
		try {
			ApiForPremiumCal grid=null;		
				grid=new ApiForPremiumCal(bean,"insertpremiuminfo");	
			if(grid!=null)
				grid.insertpremiuminfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void calculatepremium(OpenCoverBean bean) {
		try {
			ApiForPremiumCal grid=null;		
				grid=new ApiForPremiumCal(bean,"calculatepremium");	
			if(grid!=null)
				grid.calculatepremium();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void savesharepercent(OpenCoverBean bean) {
		try {
			ApiForSharePercent grid=null;		
				grid=new ApiForSharePercent(bean,"savesharepercent");	
			if(grid!=null)
				grid.savesharepercent();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getCompanyList(OpenCoverBean bean) {
		try {
			ApiForSharePercent grid=null;		
				grid=new ApiForSharePercent(bean,"companylist");	
			if(grid!=null)
				grid.getCompanyList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addWarRate(OpenCoverBean bean) {
		try {
			ApiForWarrate grid=null;		
				grid=new ApiForWarrate(bean,"addwarrate");	
			if(grid!=null)
				grid.addWarRate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getWarRateList(OpenCoverBean bean) {
		try {
			ApiForWarrate grid=null;		
				grid=new ApiForWarrate(bean,"warratelist");	
			if(grid!=null)
				grid.getWarRateList();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editWarRate(OpenCoverBean bean) {
		try {
			ApiForWarrate grid=null;		
				grid=new ApiForWarrate(bean,"editwarrate");	
			if(grid!=null)
				grid.editWarRate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<Object> getConveyanceList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"conveyancelist");	
			if(grid!=null)
				result=grid.getConveyanceList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getDepositList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"depositdetails");	
			if(grid!=null)
				result=grid.getDepositList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getInstallmentList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"installmentinfo");	
			if(grid!=null)
				result=grid.getInstallmentList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String getOpenCoverType(OpenCoverBean bean) {
		String result="";
		try {
			ApiForDropDown grid=null;		
				grid=new ApiForDropDown(bean,"opencovertype","");	
			if(grid!=null)
				result=grid.getOpenCoverType();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getDepositInfo(OpenCoverBean bean) {
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"depositinfo");	
			if(grid!=null)
				grid.getDepositInfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getDepositPremiumInfo(OpenCoverBean bean) {
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"getpremiuminfo");	
			if(grid!=null)
				grid.getDepositPremiumInfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void convertPolicy(OpenCoverBean bean) {
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"convertpolicy");	
			if(grid!=null)
				grid.convertPolicy();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getPolicyGenInfo(OpenCoverBean bean) {
		try {
			ApiForPolicyGen grid=null;		
				grid=new ApiForPolicyGen(bean,"policygeninfo");	
			if(grid!=null)
				grid.getPolicyGenInfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void endorsement(OpenCoverBean bean) {
		try {
			ApiForEndorsement grid=null;		
				grid=new ApiForEndorsement(bean,"endorsement");	
			if(grid!=null)
				grid.endorsement();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getEndorsementList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForEndorsement grid=null;		
				grid=new ApiForEndorsement(bean,"endorsementlist");	
			if(grid!=null)
				result=grid.getEndorsementList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getEndtEdit(OpenCoverBean bean) {
		try {
			ApiForEndorsement grid=null;		
				grid=new ApiForEndorsement(bean,"editendorsement");	
			if(grid!=null)
				grid.editendorsement();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateEndt(OpenCoverBean bean) {
		try {
			ApiForEndorsement grid=null;		
				grid=new ApiForEndorsement(bean,"updateendorsement");	
			if(grid!=null)
				grid.updateEndt();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void getSecondPageValid(OpenCoverBean bean) {
		try {
			ApiForModeOfTransport grid=null;		
				grid=new ApiForModeOfTransport(bean,"secondpagevalid");	
			if(grid!=null)
				grid.getSecondPageValid();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getmoptransactionlist(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPremiumCal grid=null;		
				grid=new ApiForPremiumCal(bean,"moptransactionlist");	
			if(grid!=null)
				result=grid.getmoptransactionlist();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void getCommoditySaveValid(OpenCoverBean bean) {
		try {
			ApiForPremiumCal grid=null;		
				grid=new ApiForPremiumCal(bean,"commoditysavevalid");	
			if(grid!=null)
				grid.getCommoditySaveValid();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String deleteWarRate(OpenCoverBean bean) {
		String result="false";
		try {
			ApiForWarrate grid=null;		
				grid=new ApiForWarrate(bean,"deletewarrate");	
			if(grid!=null)
				result=grid.deleteWarRate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void renew(OpenCoverBean bean) {
		try {
			ApiForEndorsement grid=null;		
				grid=new ApiForEndorsement(bean,"renew");	
			if(grid!=null)
				grid.renew();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editcustomer(OpenCoverBean bean) {
		try {
			ApiForCustomer grid=null;		
				grid=new ApiForCustomer(bean,"editcustomer");	
			if(grid!=null)
				grid.editcustomer();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getWarSrcYN(OpenCoverBean bean) {
		String result="";
		try {
			ApiForDropDown grid=null;		
				grid=new ApiForDropDown(bean,"warsrcyn","");	
			if(grid!=null)
				result=grid.getWarSrcYN();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void addvehicleInfo(OpenCoverBean bean) {
		try {
			ApiForVehicle grid=null;		
				grid=new ApiForVehicle(bean,"addvehicle");	
			if(grid!=null)
				grid.addvehicleInfo();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getVehicleList(OpenCoverBean bean) {
		try {
			ApiForVehicle grid=null;		
				grid=new ApiForVehicle(bean,"vehiclelist");	
			if(grid!=null)
				grid.getVehicleList();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getHaulierType(OpenCoverBean bean) {
		String result="";
		try {
			ApiForDropDown grid=null;		
				grid=new ApiForDropDown(bean,"haulierType","");	
			if(grid!=null)
				result=grid.getHaulierType();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String deleteVehicle(OpenCoverBean bean) {
		String result="false";
		try {
			ApiForVehicle grid=null;		
				grid=new ApiForVehicle(bean,"deletevehicle");	
			if(grid!=null)
				result=grid.deleteVehicle();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getOptedSaleTermList(OpenCoverBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForSaleTerm grid=null;		
				grid=new ApiForSaleTerm(bean,"optedsaletermlist");	
			if(grid!=null)
				result=grid.getOptedSaleTermList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
}
