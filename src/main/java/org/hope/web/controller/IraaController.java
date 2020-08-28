package org.hope.web.controller;

import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/iraa")
public class IraaController {

	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
		//회사 소개  이동 
		@RequestMapping(value = "/iraa.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "IraaPage";
		} 
		

}
