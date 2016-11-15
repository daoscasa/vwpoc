package com.ibm.poc.vw.orders.bo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.poc.vw.orders.bo.OrderBo;
import com.ibm.poc.vw.orders.dao.OrderDao;
import com.ibm.poc.vw.orders.model.Order;

@Service("orderBo")
@Transactional
public class OrderBoImpl implements OrderBo{
	@Autowired
	OrderDao orderDao;
	
	public Order findById(int id){
		return orderDao.findById(id);
	}
}
