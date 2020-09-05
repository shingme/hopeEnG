package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.HomeVO;

public interface HomeService {
	public List<HomeVO> selectHome(Map<String, String> map)throws Exception;
	
}
