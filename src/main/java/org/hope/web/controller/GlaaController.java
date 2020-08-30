package org.hope.web.controller;

import java.io.File;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hope.web.domain.BraaVO;
import org.hope.web.domain.GlaaVO;
import org.hope.web.service.GlaaService;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/glaa")
public class GlaaController {

	@Autowired
	GlaaService glaaService;

	//문의 게시판 목록 이동 
	@RequestMapping(value = "/glaa.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "GlaaList";
	} 
			
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET) 
	public String showUploadForm() { 
		return "GlaaUploadForm"; 
	}

	//온라인 문의글 상세 조회 
	@RequestMapping("/Glaa1000_moveDetailPage.do")
	//@ResponseBody 
	public String glaaMoveDetailpage(@RequestParam String gllyNo, Model model) throws Exception{
	
		/*
		 * model.addAttribute("gllyNo", gllyNo); 
		 * System.out.println("gllyNo = "+gllyNo);
		 */
		return "GlaaPage";
	}
	
	/** 게시판 - 상세 조회  */
    @RequestMapping(value = "/Glaa1000_getGllyDetail")
    @ResponseBody
    public GlaaVO getGllyDetail(HttpServletRequest request, HttpServletResponse response, String gllyNo) throws Exception {
 
        //MDC.put("TRANSACTION_ID", String.valueOf(glaaParam));
    	 MDC.put("TRANSACTION_ID", gllyNo);
        System.out.println("상세보자 : ");
        //System.out.println(glaaParam.toString());
        // GlaaVO glaa = glaaService.selectDetailGlaa(String.valueOf(glaaParam.getgllyNo()));
        GlaaVO glaa = glaaService.selectDetailGlaa(gllyNo);
        
        MDC.remove("TRANSACTION_ID");
        
        return glaa;
    }
	
	  // 온라인 문의글 목록 조회
	  
	@RequestMapping("/Glaa1000_select.do")
	@ResponseBody 
	public Map<String, List<GlaaVO>> glaaSelect(@RequestParam HashMap<String, String> paramMap) {
		  //paramMap.forEach((key, value) -> Logger.info(key + ":" + value));
	  
	Map<String, List<GlaaVO>> map = new HashMap<String, List<GlaaVO>>();
	  
	List<GlaaVO> glaaList = glaaService.selectGlaa(paramMap);
	System.out.println("첫번째파일경로");
	System.out.println(glaaList.get(0).getFirstFilePath());
	//System.out.println(glaaList.get(25).toString()); 
	
	map.put("glaaList",glaaList); 
	  
	return map; 
	}
	 


	// 갤러리 게시물 작성
	@RequestMapping(value = "/Glaa1000_insert.do", method = RequestMethod.POST)
	@ResponseBody 
	public String glaaInsert(@ModelAttribute GlaaVO glaaVO, Model model) throws Exception{
		
		try {
			glaaService.insertGlaa(glaaVO);
			return "SUCCESS";
		} catch (Exception e) {
			return "FALSE";
		}
		
	}
}
