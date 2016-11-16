package com.ibm.poc.vw.promotion.bo.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.poc.vw.promotion.bo.PromotionBo;
import com.ibm.poc.vw.promotion.dao.impl.PromotionDaoImpl;
import com.ibm.poc.vw.promotion.model.Promotion;

@Service("promotionBo")
@Transactional
public class PromotionBoImpl implements PromotionBo {
	@Autowired
	PromotionDaoImpl promotionDaoImpl;

	@Override
	public Promotion findById(int id) {
		return promotionDaoImpl.findById(id);
	}

	@Override
	public List<Promotion> getAll() {
		return promotionDaoImpl.getAll();
	}

}
