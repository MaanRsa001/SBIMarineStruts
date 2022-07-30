package com.maan.adminnew.customerManagement;

import java.util.List;

public class CustomerMgtService
{	
	CustomerMgtDAO dao=new CustomerMgtDAO();
	
    public List <Object> getAdminCustomerList(String agencyCode){
    	return dao.getAdminCustomerList(agencyCode);
    }
    public List <Object> getCustomerDetails(final CustomerMgtBean ba){
    	return dao.getCustomerDetails(ba);
    }
    public List <Object> getCommisionData(String cagencyCode){
    	return dao.getCommisionData(cagencyCode);
    }
    public List <Object> getOpenCoverList(final CustomerMgtBean ba){
    	return dao.getOpenCoverList(ba);
    }
    public List<Object> getCustomerListAjax(String agencyCode, String searchBy, String searchValue){
  	  return dao.getCustomerListAjax(agencyCode, searchBy, searchValue);
    }
	public List<Object> getCoreCustomerList(String branchCode) {
		return dao.getCoreCustomerList(branchCode);
	}
	public void editCoreCustomer(CustomerMgtBean bean) {		
		dao.editCoreCustomer(bean);
	}
	public boolean updateCoreCustomer(CustomerMgtBean bean) {	 
		return dao.updateCoreCustomer(bean);
	}
}