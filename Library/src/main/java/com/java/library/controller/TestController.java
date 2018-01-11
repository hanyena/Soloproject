package com.java.library.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.TestServiceInterface;
import com.java.library.util.HttpUtil;

@Controller
public class TestController {
	
	@Autowired
	TestServiceInterface tsi;

	

  @RequestMapping(value = "/testDB", method = RequestMethod.GET)
  public ModelAndView testDB(){
	    System.out.println(tsi.test());
		return HttpUtil.returnJson(tsi.test());
 }
  
	

	
}
