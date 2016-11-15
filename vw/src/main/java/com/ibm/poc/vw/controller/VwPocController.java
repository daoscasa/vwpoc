package com.ibm.poc.vw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ibm.poc.vw.orders.bo.OrderBo;

@Controller
public class VwPocController {
	@Autowired
	OrderBo orderBo;
	
	
	@RequestMapping(value ={"/", "/welcome**"}, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		orderBo.findById(1);
		return new ModelAndView("login");
	}
}
