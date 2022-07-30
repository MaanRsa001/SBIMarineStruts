package com.maan.NewConditions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ConditionBean {

	private String springtoken;
	private String proposalNo;
	private String branchCode;
	private String belongingBranch;
	private List<String>clausescheck;
	private List<String>clausesId;
	private List<String>clausesName;
	private List<String>commodityIds;
	private List<String>commodityId;
	private List<String>commodityName;
	private String modeOfTransport;
	private String modeOfTransportName;
	private String coverId;
	private String coverName;
	private String type;
	private String mode;
	private List<String>warrantycheck;
	private List<String>warrantyId;
	private List<String>warrantyName;
	private List<String>exclusioncheck;
	private List<String>exclusionId;
	private List<String>exclusionName;
	private List<String>warcheck;
	private List<String>warrId;
	private List<String>warName;
	private List<String>otherscheck;
	private List<String>othersId;
	private List<String>othersName;
	private List<String>warcoverId;
	private List<String>warcoverName;
	
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	
	public String getSpringtoken() {
		return springtoken;
	}
	public void setSpringtoken(String springtoken) {
		this.springtoken = springtoken;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public List<String> getClausescheck() {
		return clausescheck;
	}
	public void setClausescheck(List<String> clausescheck) {
		this.clausescheck = clausescheck;
	}
	public List<String> getClausesId() {
		return clausesId;
	}
	public void setClausesId(List<String> clausesId) {
		this.clausesId = clausesId;
	}
	public List<String> getClausesName() {
		return clausesName;
	}
	public void setClausesName(List<String> clausesName) {
		this.clausesName = clausesName;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}
	public List<String> getCommodityIds() {
		return commodityIds;
	}
	public void setCommodityIds(List<String> commodityIds) {
		this.commodityIds = commodityIds;
	}
	public List<String> getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(List<String> commodityId) {
		this.commodityId = commodityId;
	}
	public List<String> getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(List<String> commodityName) {
		this.commodityName = commodityName;
	}
	public String getModeOfTransport() {
		return modeOfTransport;
	}
	public void setModeOfTransport(String modeOfTransport) {
		this.modeOfTransport = modeOfTransport;
	}
	public String getModeOfTransportName() {
		return modeOfTransportName;
	}
	public void setModeOfTransportName(String modeOfTransportName) {
		this.modeOfTransportName = modeOfTransportName;
	}
	public String getCoverId() {
		return coverId;
	}
	public void setCoverId(String coverId) {
		this.coverId = coverId;
	}
	public String getCoverName() {
		return coverName;
	}
	public void setCoverName(String coverName) {
		this.coverName = coverName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<String> getWarrantycheck() {
		return warrantycheck;
	}
	public void setWarrantycheck(List<String> warrantycheck) {
		this.warrantycheck = warrantycheck;
	}
	public List<String> getWarrantyId() {
		return warrantyId;
	}
	public void setWarrantyId(List<String> warrantyId) {
		this.warrantyId = warrantyId;
	}
	public List<String> getWarrantyName() {
		return warrantyName;
	}
	public void setWarrantyName(List<String> warrantyName) {
		this.warrantyName = warrantyName;
	}
	public List<String> getExclusioncheck() {
		return exclusioncheck;
	}
	public void setExclusioncheck(List<String> exclusioncheck) {
		this.exclusioncheck = exclusioncheck;
	}
	public List<String> getExclusionId() {
		return exclusionId;
	}
	public void setExclusionId(List<String> exclusionId) {
		this.exclusionId = exclusionId;
	}
	public List<String> getExclusionName() {
		return exclusionName;
	}
	public void setExclusionName(List<String> exclusionName) {
		this.exclusionName = exclusionName;
	}
	public List<String> getWarcheck() {
		return warcheck;
	}
	public void setWarcheck(List<String> warcheck) {
		this.warcheck = warcheck;
	}
	
	public List<String> getWarrId() {
		return warrId;
	}
	public void setWarrId(List<String> warrId) {
		this.warrId = warrId;
	}
	public List<String> getWarName() {
		return warName;
	}
	public void setWarName(List<String> warName) {
		this.warName = warName;
	}
	public List<String> getOtherscheck() {
		return otherscheck;
	}
	public void setOtherscheck(List<String> otherscheck) {
		this.otherscheck = otherscheck;
	}
	public List<String> getOthersId() {
		return othersId;
	}
	public void setOthersId(List<String> othersId) {
		this.othersId = othersId;
	}
	public List<String> getOthersName() {
		return othersName;
	}
	public void setOthersName(List<String> othersName) {
		this.othersName = othersName;
	}
	public List<String> getWarcoverId() {
		return warcoverId;
	}
	public void setWarcoverId(List<String> warcoverId) {
		this.warcoverId = warcoverId;
	}
	public List<String> getWarcoverName() {
		return warcoverName;
	}
	public void setWarcoverName(List<String> warcoverName) {
		this.warcoverName = warcoverName;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getBelongingBranch() {
		return belongingBranch;
	}
	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}



	
	
	
	
	
}
