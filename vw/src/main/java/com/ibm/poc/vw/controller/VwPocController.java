package com.ibm.poc.vw.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ibm.poc.vw.orders.bo.OrderBo;
import com.ibm.poc.vw.promotion.bo.PromotionBo;
import com.ibm.poc.vw.promotion.model.Promotion;

@Controller
public class VwPocController {
	List<Promotion> promotions;
	@Autowired
	OrderBo orderBo;
	@Autowired
	PromotionBo promotionBo;
	
	
	
	@RequestMapping(value ={"/", "/welcome**"}, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		promotions = new ArrayList<>();
		promotions=promotionBo.getAll();
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("promotions",promotions);
		//orderBo.findById(1);
		return mav;
	}
	
	@RequestMapping(value={"/promotions"} , method=RequestMethod.GET)
	public ModelAndView getAllPromotions(){
		promotions = new ArrayList<>();
		promotions=promotionBo.getAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("promotions",promotions);
		return mav;
		
	}
}
