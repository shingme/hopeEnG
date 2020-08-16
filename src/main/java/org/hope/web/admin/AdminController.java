package org.hope.web.admin;

import org.hope.web.admin.LoginDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

	

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		//관리자 로그인 화면
		@RequestMapping(value = "", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

			return "comm/AdminLogin";
		} 
		
		
//		@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
//		public ModelAndView loginCheck(@ModelAttribute LoginDTO dto, HttpSession session) {
//			
//			//boolean result = 
//			
//		}
	



}
