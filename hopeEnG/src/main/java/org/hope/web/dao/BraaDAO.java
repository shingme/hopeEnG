package org.hope.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import org.hope.web.controller.BraaController;
import org.hope.web.domain.BraaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class BraaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(BraaVO braaVO) throws DataAccessException{ 
		// TODO Auto-generated method stub
		logger.info("DAO단계:" + braaVO.getName());
		sqlSession.insert("BraaMapper.BRCC0100_mainInsert", braaVO);

	}
	

}
