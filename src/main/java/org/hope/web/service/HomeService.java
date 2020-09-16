package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.HomeVO;

public interface HomeService {
	public List<HomeVO> selectHomeTop(Map<String, String> map)throws Exception;
	public List<HomeVO> selectHomeBottm(Map<String, String> map)throws Exception;
}
