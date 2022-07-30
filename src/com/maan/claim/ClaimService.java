package com.maan.claim;

import java.util.List;

public class ClaimService {
	private ClaimDao dao=new ClaimDao();
	public void getclaimDetails(ClaimBean bean, String policyNo) {
		dao.getclaimDetails(bean, policyNo);
	}
	public Integer countPolicyNo(ClaimBean bean) {
		return dao.getCountPolicyNo(bean);
	}
	public int saveLossDetails(ClaimBean bean) {
		return dao.saveLossDetails(bean);
	}
	public List<Object> getClaimIntimation(ClaimBean bean) {
		return dao.getClaimIntimation(bean);
	}
	public List<Object> getClaimPendingDetails(ClaimBean bean) {
		return dao.getClaimPendingDetails(bean);
	}
	public void getclaimIntimationDetails(ClaimBean bean) {
		dao.getclaimIntimationDetails(bean);
	}
	public int updateClaimIntimation(ClaimBean bean) {
		return dao.updateClaim(bean);
	}
	public int countClaimPolicyNo(ClaimBean bean) {
		return dao.countClaimPolicyNo(bean);
	}

}
