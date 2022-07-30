package com.maan.NewConditions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ForkJoinPool;

import com.maan.NewConditions.Api.ApiForClauses;
import com.maan.NewConditions.Api.ApiForExclusion;
import com.maan.NewConditions.Api.ApiForOthers;
import com.maan.NewConditions.Api.ApiForWar;
import com.maan.NewConditions.Api.ApiForWarranty;
import com.opensymphony.xwork2.ActionContext;


public class ConditionService {
	Map<String, Object> session=ActionContext.getContext().getSession();
	public static ForkJoinPool forkJoinPool = new ForkJoinPool(2);
	
	
	public void getEditClauses(ConditionBean bean) {
		try {
			ApiForClauses grid=null;		
				grid=new ApiForClauses(bean,"editclauses");	
			if(grid!=null)
				grid.getEditClauses();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addClauses(ConditionBean bean) {
		try {
			ApiForClauses grid=null;		
				grid=new ApiForClauses(bean,"addclauses");	
			if(grid!=null)
				grid.addClauses();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEditWarranty(ConditionBean bean) {
		try {
			ApiForWarranty grid=null;		
				grid=new ApiForWarranty(bean,"editwarranty");	
			if(grid!=null)
				grid.getEditWarranty();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addWarranty(ConditionBean bean) {
		try {
			ApiForWarranty grid=null;		
				grid=new ApiForWarranty(bean,"addwarranty");	
			if(grid!=null)
				grid.addWarranty();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEditExclusion(ConditionBean bean) {
		try {
			ApiForExclusion grid=null;		
				grid=new ApiForExclusion(bean,"editexclusion");	
			if(grid!=null)
				grid.getEditExclusion();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void addExclusion(ConditionBean bean) {
		try {
			ApiForExclusion grid=null;		
				grid=new ApiForExclusion(bean,"addexclusion");	
			if(grid!=null)
				grid.addExclusion();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEditWar(ConditionBean bean) {
		try {
			ApiForWar grid=null;		
				grid=new ApiForWar(bean,"editwar");	
			if(grid!=null)
				grid.getEditWar();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addWar(ConditionBean bean) {
		try {
			ApiForWar grid=null;		
				grid=new ApiForWar(bean,"addwar");	
			if(grid!=null)
				grid.addWar();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getEditOthers(ConditionBean bean) {
		try {
			ApiForOthers grid=null;		
				grid=new ApiForOthers(bean,"editothers");	
			if(grid!=null)
				grid.getEditOthers();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addOthers(ConditionBean bean) {
		try {
			ApiForOthers grid=null;		
				grid=new ApiForOthers(bean,"addothers");	
			if(grid!=null)
				grid.addOthers();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getCoverClausesList(ConditionBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForClauses grid=null;		
				grid=new ApiForClauses(bean,"coverclauseslist");	
			if(grid!=null)
				result=grid.getCoverClausesList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
