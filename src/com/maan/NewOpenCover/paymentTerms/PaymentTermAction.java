package com.maan.NewOpenCover.paymentTerms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.NewOpenCover.reports.ReportRegAction;
import com.maan.common.LogUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PaymentTermAction extends ActionSupport implements ModelDriven<PaymentTermBean> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final Logger logger = LogUtil.getLogger(ReportRegAction.class);
	HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	PaymentTermBean bean=new PaymentTermBean();
	PaymentTermService service=new PaymentTermService();
	@Override
	public PaymentTermBean getModel() {
		bean.setBranchCode(session.get("BranchCode")==null?"01":session.get("BranchCode").toString());
		bean.setUserType(session.get("usertype")==null?"01":session.get("usertype").toString());
		return bean;
	}
	public List<Object> getUserSelection(){
		return service.getUserSelection(bean);
	}
	public List<Object> getOpenCoverNoList(){
		return service.getOpenCoverNoList(bean);
	}
	public List<Object> getPaymentDuelist(){
		return service.getPaymentDuelist(bean);
	}
	
	public String init() {
		bean.setReqFrom(StringUtils.isBlank(bean.getReqFrom())?"display":bean.getReqFrom());
		if("display".equalsIgnoreCase(bean.getReqFrom())){
			bean.setPaymentTermsDetails(service.getPaymentTermsDetails(bean));

		}else if("paymentTermsView".equalsIgnoreCase(bean.getReqFrom())){
			bean.setPaymentTerms(service.getPaymentTerms(bean));
			bean.setPaymentTermsList(service.getPaymentTermsViewList(bean));
		}
		else if("paymentTermsNew".equalsIgnoreCase(bean.getReqFrom())){
			bean.setPaymentTerms(service.getPaymentTerms(bean));
			bean.setPaymentTermsList(service.getPaymentTermsList(bean));
		}
		return "newpaymentTerms";
	}
	public String add() {
		String result=service.addPaymentTerms(bean);
		validation();
		if(!hasActionErrors()) {
			addActionMessage(result);
			bean.setPaymentTermsList(service.getPaymentTermsList(bean));
		}
		bean.setReqFrom("paymentTermsNew");
		bean.setPaymentTerms(service.getPaymentTerms(bean));
		return "newpaymentTerms";
	}
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
	public String delete() {
		String output=service.deletePayment(bean);
		if("false".equals(output)) {
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			List<String>  openCoverNum=new ArrayList<>();
			List<String>  dueamount=new ArrayList<>();
			List<String>  duepercent=new ArrayList<>();
			List<String>  dueDate=new ArrayList<>();
			List<String>  effectiveDate=new ArrayList<>();
			List<String>  dueList=new ArrayList<>();
			bean.getDueList().remove(bean.getSno());
			for (int i = 0; i < bean.getDueList().size(); i++) {
				Map<String, Object> doubleMap = new HashMap<String, Object>();
				doubleMap.put("one", new Double(1.0));
				result.add(doubleMap);

			}
			int j = 1;
			for (int k = 0; k < bean.getDueList().size(); k++) {
				int value = Integer.parseInt(bean.getSno())-1;
				if (k < value) {
					dueList.add(bean.getDueList().get(k));
					openCoverNum.add(bean.getOpenCoverNum().get(k));
					dueamount.add(bean.getDueamount().get(k));
					duepercent.add(bean.getDuepercent().get(k));
					dueDate.add(bean.getDueDate().get(k));
					effectiveDate.add(bean.getEffectiveDate().get(k));
				} else {
					dueList.add(bean.getDueList().get(j));
					openCoverNum.add(bean.getOpenCoverNum().get(j));
					if (StringUtils.isNotBlank(bean.getDueamount().get(j))) {
						dueamount.add(bean.getDueamount().get(j));
					}
					if (StringUtils.isNotBlank(bean.getDuepercent().get(j))) {
						duepercent.add(bean.getDuepercent().get(j));
					}
					if (StringUtils.isNotBlank(bean.getDueDate().get(j))) {
						dueDate.add(bean.getDueDate().get(j));
					}
					if (StringUtils.isNotBlank(bean.getEffectiveDate().get(j))) {
						effectiveDate.add(bean.getEffectiveDate().get(j));
					}
					//
				}
				j++;
			}
			bean.setDueList(dueList);
			bean.setOpenCoverNum(openCoverNum);
			bean.setDueamount(dueamount);
			bean.setDueDate(dueDate);
			bean.setDuepercent(duepercent);
			bean.setEffectiveDate(effectiveDate);
		}else {
			bean.setPaymentTermsList(service.getPaymentTermsList(bean));
		}
		bean.setReqFrom("paymentTermsDel");
		bean.setPaymentTerms(service.getPaymentTerms(bean));
		return "newpaymentTerms";
	}

}
