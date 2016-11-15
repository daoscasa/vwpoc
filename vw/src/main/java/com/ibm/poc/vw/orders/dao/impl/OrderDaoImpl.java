package com.ibm.poc.vw.orders.dao.impl;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibm.poc.vw.orders.dao.OrderDao;
import com.ibm.poc.vw.orders.model.Order;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Order findById(int id){
//		return (Order) getSessionFactory().getCurrentSession().get(Order.class, id);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery("select * from `order` where id = "+id);
		query.addEntity(Order.class);
		Order aOrder = (Order) query.uniqueResult();
		return aOrder;
	}
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
