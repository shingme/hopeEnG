package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;
import org.springframework.ui.Model;

public interface GlaaService {
	public void insertGlaa(GlaaVO glaaVO) throws Exception;


	public List<GlaaFileVO> getGlaaFileInfo(GlaaVO glaaVO) throws Exception;
	public Map<String, Object> selectGlaa(Map<String, Object> map);
	
	public GlaaVO selectDetailGlaa(String bordNum);
	
	public int updateGlaa(GlaaVO glaa);

	
	public int deleteGlaa(String gllyNo);
}
