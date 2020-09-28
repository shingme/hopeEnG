package org.hope.web.dao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.hope.web.domain.GlaaFileVO;
import org.hope.web.domain.GlaaVO;

@Repository
public class GlaaDAO extends superDAO{
	
	public int insert(GlaaVO glaaVO) throws DataAccessException{ 
		insert("GlaaMapper.Glaa1000_insert", glaaVO);
		return glaaVO.getgllyNo();
	}
	
	public void insertGlaaFile(GlaaFileVO glaaFileVO) throws DataAccessException{
		insert("GlaaMapper.Glaa1000_insertFile", glaaFileVO);
	}
	
	@SuppressWarnings("unchecked")
	public List<GlaaVO> select(Map<String, Object> map) throws DataAccessException{ 
		return (List<GlaaVO>) selectList("GlaaMapper.Glaa1000_select", map);
	}
	
	public GlaaVO selectDetail(String gllyNo) throws DataAccessException{ 
		return (GlaaVO) selectOne("GlaaMapper.Glaa1000_selectDetail", gllyNo);
	}

	@SuppressWarnings("unchecked")
	public List<GlaaFileVO> selectImagePath(String gllyNo) throws DataAccessException{
		return (List<GlaaFileVO>) selectList("GlaaMapper.Glaa1000_selectFileList", gllyNo);
	}
	
	public int updateGlaa(GlaaVO glaa) throws DataAccessException{
		return update("GlaaMapper.Glaa1000_update", glaa);
	}
	
	// 게시물 수 
	public int selectTotalCnt(Map<String, Object> map) throws DataAccessException{
		return (int) selectOne("GlaaMapper.Glaa1000_totalCnt", map);
	}
	
	// 삭제
	public int deleteGlaa(String gllyNo) throws DataAccessException{
		return delete("GlaaMapper.Glaa1000_delete", gllyNo);
	}

}
