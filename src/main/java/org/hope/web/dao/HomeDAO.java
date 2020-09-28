package org.hope.web.dao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.HomeVO;

@Repository
public class HomeDAO extends superDAO{
	
	@SuppressWarnings("unchecked")
	public List<HomeVO> selectTop(Map<String, String> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return (List<HomeVO>) selectList("HomeMapper.Home1000_selectTop", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HomeVO> selectBottm(Map<String, String> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return (List<HomeVO>) selectList("HomeMapper.Home1000_selectBottm", map);
	}

}
