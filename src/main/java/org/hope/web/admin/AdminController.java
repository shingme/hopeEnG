package org.hope.web.admin;

import org.hope.web.admin.LoginDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Inject
	private  AdminService service;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		//관리자 로그인 화면
		@RequestMapping(value = "", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {

			return "admin/AdminLogin";
		} 
		
		
		@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
		public void loginCheck(LoginDTO dto, HttpSession session, Model model)throws Exception {
			
			AdminVO vo = service.loginCheck(dto);
			if(vo == null) {
				return;
			}
			
			model.addAttribute("adminVO", vo);
			
			
		}
	



}
