package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.BraaVO;

public interface BraaService {
	public void insertBraa(BraaVO braaVO) throws Exception;

	public Map<String, Object> selectBraa(Map<String, Object> map);
	
	public BraaVO selectDetailBraa(String bordNum);
	
	public int increViewsBraa(String bordNum);
	
	public void updateBraa(BraaVO braaVO);
	
	public int deleteBraa(BraaVO braaVO);
	
	public Boolean confirmPasswd(Map<String, String> map) throws Exception;
	
}
