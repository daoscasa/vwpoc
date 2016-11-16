package com.ibm.poc.vw.promotion.dao;

import java.util.List;

import com.ibm.poc.vw.promotion.model.Promotion;

public interface PromotionDao {
	Promotion findById(int id);
	List<Promotion> getAll();

}
