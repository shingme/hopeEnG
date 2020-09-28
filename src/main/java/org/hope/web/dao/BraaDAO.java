package org.hope.web.dao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.BraaVO;

@Repository
public class BraaDAO extends superDAO{
	
	public void insert(BraaVO braaVO) throws DataAccessException{
		// TODO Auto-generated method stub
		insert("BraaMapper.Braa1000_insert", braaVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<BraaVO> select(Map<String, Object> map) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return (List<BraaVO>) selectList("BraaMapper.Braa1000_select", map);
	}
	
	public BraaVO selectDetail(String bordNum) throws DataAccessException{ 
		// TODO Auto-generated method stub
		return (BraaVO) selectOne("BraaMapper.Braa1000_selectDetail", bordNum);
	}
	
	public int update(BraaVO braaVO) throws DataAccessException{
		return update("BraaMapper.Braa1000_update", braaVO);
	}
	
	public String selectPassWd(String bordNum) throws DataAccessException{
		return (String) selectOne("BraaMapper.Braa1000_selectPassWd", bordNum);
	}
	
	public int delete(BraaVO braaVO) throws DataAccessException{
		return update("BraaMapper.Braa1000_delete", braaVO);
	}

	public int updateIncreViewsBraa(String bordNum) throws DataAccessException{
		return update("BraaMapper.Braa1000_updateIncreViews", bordNum);
	}
	
	public int selectTotalCnt(Map<String, Object> map) throws DataAccessException{
		return (int) selectOne("BraaMapper.Braa1000_totalCnt", map);
	}

}
