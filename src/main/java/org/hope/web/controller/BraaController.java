package org.hope.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.hope.web.domain.BraaVO;
import org.hope.web.service.BraaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/braa")
public class BraaController {

	@Autowired
	BraaService braaService;

	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
		  @RequestMapping(value = "/braa.do", method = RequestMethod.GET) public String
		  home(Locale locale, Model model) {
		  logger.info("Welcome home! The client locale is {}.", locale);
		  
		  Date date = new Date(); DateFormat dateFormat =
		  DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		  
		  String formattedDate = dateFormat.format(date);
		  
		  model.addAttribute("serverTime", formattedDate );
		  model.addAttribute("pageName", "BraaPage");
		  
		/* return "home"; */
		  return "BraaPage"; 
		  };
		 

	@RequestMapping("/Braa1000_mainRegister")
	public void BraaRegister(@ModelAttribute BraaVO braaVO) {
		System.out.println("qqq");
		logger.info("zzz");
		logger.info(braaVO.getContent());
		logger.info(braaVO.getName());
		logger.info(braaVO.getPasswd());
		logger.info(braaVO.getTellNm());
		braaService.insertBraa(braaVO);

	}

	@GetMapping("/{name}.html")
	public String hello(@PathVariable String name, Model model) {
		model.addAttribute("pageName", name);
		return "home";
	};

}
