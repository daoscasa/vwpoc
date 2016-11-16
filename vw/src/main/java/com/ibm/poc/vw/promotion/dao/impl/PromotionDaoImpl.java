package com.ibm.poc.vw.promotion.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibm.poc.vw.promotion.dao.PromotionDao;
import com.ibm.poc.vw.promotion.model.Promotion;

@Repository("promotionDao")
public class PromotionDaoImpl implements PromotionDao{
		
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Promotion findById(int id) {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery("select * from `promotions` where id = "+id);
		query.addEntity(Promotion.class);
		Promotion aPromotion = (Promotion) query.uniqueResult();
		return aPromotion;
		
	}

	@Override
	public List<Promotion> getAll() {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery("select * from `promotions`");
		query.addEntity(Promotion.class);
		List<Promotion> result = (List<Promotion>) query.list();
		
		return result;
	}

}
