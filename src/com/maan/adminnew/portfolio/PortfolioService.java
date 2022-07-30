package com.maan.adminnew.portfolio;

import java.util.List;

public class PortfolioService {

	PortfolioDAO dao=new PortfolioDAO();
	public List<Object> getProducts(String branchCode) {
		return dao.getProducts(branchCode);
		
	}
	public List<Object> getPortfolioList(Object[] val) {
		return dao.getPortfolioList(val);
	}
	public String updatePortfolioPolicyCancelStatus(Object[] val) {
		return dao.updatePortfolioPolicyCancelStatus(val);
	}
	
	public List<Object> getViewList(Object[] val) {
		return dao.getViewlist(val);
		
	}
	public List<Object> getPortFolio(String sdate, String edate, String status,
			String pid, String branchCode, String brokerCodes,
			String freightStatus) // Approved_Policy_PortFoolio.jsp
	{
		return dao.getPortFolio(sdate, edate, status, pid, branchCode, brokerCodes, freightStatus);
	}
	public List<Object> getPortfolioByDate(String eDate, String status, String pid, String branchCode, String brokerCodes,String freightStatus,String searchBy,String SearchValue) // PortFolio_ByDate.jsp BrokerCodes  Restriction
	{
		return dao.getPortfolioByDate(eDate,  status, pid, branchCode, brokerCodes, freightStatus,searchBy,SearchValue);
	}
	
	public List<Object> getPolicyTreatyInfo(PortfolioBean bean) {
		return dao.getPolicyTreatyInfo(bean);
	}
	
	public int saveTreaty(PortfolioBean bean) {
		return dao.saveTreaty(bean);
	}
	
	public List<Object> facultativeInfo(PortfolioBean bean) {
		return dao.facultativeInfo(bean);
	}
	
	public int insertFacultativeinfo(PortfolioBean bean) {
		return dao.insertFacultativeinfo(bean);
	}
	
	public List<Object> getRiList() {
		return dao.getRiList();
	}
	
	public String getbranchWiseCountry(String branchCode){
		 return dao.getbranchWiseCountry(branchCode);
	}
	public List<Object> getSearchList(String rep, String productID,String searchBy,String searchValue) {
		
		return dao.getSearchList(rep, productID,searchBy,searchValue);
	}
	
}
