package com.ibm.poc.vw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ibm.poc.vw.config.AppConfig;
import com.ibm.poc.vw.orders.bo.OrderBo;
import com.ibm.poc.vw.orders.model.Order;

public class AppTest {
	public static void main(String[] args) {
		ApplicationContext context =  new AnnotationConfigApplicationContext(AppConfig.class);

		OrderBo order = (OrderBo) context.getBean("userBo");
		Order aOrder = order.findById(1);
	
		System.out.println(aOrder.toString());
	}
}