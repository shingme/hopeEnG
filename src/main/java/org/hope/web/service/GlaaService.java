package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.springframework.ui.Model;

public interface GlaaService {
	public void insertGlaa(GlaaVO glaaVO) throws Exception;


	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception;
	public List<GlaaVO> selectGlaa(Map<String, String> map);
	
	public GlaaVO selectDetailGlaa(String bordNum);
	
	public int updateGlaa(Model model);
	public List<Map<String, String>> getImagePathGlaa(Map<String, String> map);
	
	
}
