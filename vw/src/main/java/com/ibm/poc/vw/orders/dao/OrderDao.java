package com.ibm.poc.vw.orders.dao;

import com.ibm.poc.vw.orders.model.Order;

public interface OrderDao {
	Order findById(int id);
}
