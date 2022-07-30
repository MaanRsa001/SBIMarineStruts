package com.maan.NewConditions;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.common.LogUtil;
import com.maan.quotation.QuotationAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ConditionAction extends ActionSupport implements ModelDriven<ConditionBean> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final Logger logger = LogUtil.getLogger(QuotationAction.class);
	HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	ConditionBean bean=new ConditionBean();
	ConditionService service=new ConditionService();
	private static final String FIELD = "ELEMENT_NAME";
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public ConditionBean getModel() {
		bean.setBelongingBranch(session.get("BelongingBranch")==null?"01":session.get("BelongingBranch").toString());
		bean.setBranchCode(session.get("BranchCode")==null?"":session.get("BranchCode").toString());
		return bean;
	}
	public List<Object>getCoverClausesList(){
		return service.getCoverClausesList(bean);
	}
	public String clausesPopup() {
		service.getEditClauses(bean);
		return "clausesPopup";
	}
	public String addClauses() {
		service.addClauses(bean);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				Map map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}else {
			bean.setMode("edit");
		}
		return "clausesPopup";
	}
	public String warrantyPopup() {
		if(StringUtils.isNotBlank(bean.getCoverId())) {
			service.getEditWarranty(bean);
		}
		return "warrantyPopup";
	}
	public String addWarranty() {
		service.addWarranty(bean);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				Map map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}else {
			bean.setMode("edit");
		}
		return "warrantyPopup";
	}
	public String exclusionPopup() {
		if(StringUtils.isNotBlank(bean.getCoverId())) {
			service.getEditExclusion(bean);
		}
		return "exclusionPopup";
	}
	
	public String addExclusion() {
		service.addExclusion(bean);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				Map map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}else {
			bean.setMode("edit");
		}
		return "exclusionPopup";
	}
	public String warPopup() {
		service.getEditWar(bean);
		return "warPopup";
	}
	public String addWar() {
		service.addWar(bean);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				Map map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}else {
			bean.setMode("edit");
		}
		return "warPopup";
	}
	public String othersPopup() {
		if(StringUtils.isNotBlank(bean.getCoverId())) {
			service.getEditOthers(bean);
		}
		return "othersPopup";
	}
	public String addOthers() {
		service.addOthers(bean);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				Map map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}else {
			bean.setMode("edit");
		}
		return "othersPopup";
	}
}
