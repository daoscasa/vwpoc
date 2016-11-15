package com.ibm.poc.vw.orders.bo;

import com.ibm.poc.vw.orders.model.Order;

public interface OrderBo {
	Order findById(int id);
}
