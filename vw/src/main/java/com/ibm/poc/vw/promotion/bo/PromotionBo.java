package com.ibm.poc.vw.promotion.bo;

import java.util.List;

import com.ibm.poc.vw.promotion.model.Promotion;

public interface PromotionBo {
	Promotion findById(int id);
	List<Promotion> getAll();
	
	
	

}
