package com.maan.vessel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class VesselAction extends ActionSupport implements ModelDriven<VesselBean> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String FIELD = "ELEMENT_NAME";
	VesselBean bean=new VesselBean();
	VesselService service=new VesselService();
	private HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	private HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	@Override
	public VesselBean getModel() {
		return bean;
	}

	public String searchList() {
		service.veseelSearch(bean);
		if("imo".equals(bean.getSearchBy())) {
			getRequest().setAttribute(FIELD, "byimo");
		}else if("name".equals(bean.getSearchBy())){
			getRequest().setAttribute(FIELD, "byName");
		}else if("exname".equals(bean.getSearchBy())){
			getRequest().setAttribute(FIELD, "byexName");
		}
		return "vesselAjax";
		
	}
	public String viewList() {
		bean.setSearchBy("imo");
		service.veseelSearch(bean);
				
		return "viewAjax";
		
	}
	public String pointing() {
		service.shipLocation(bean);
		return "showInMap";
	}
}
