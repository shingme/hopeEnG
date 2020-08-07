package org.hope.web.comm.admin;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.hope.web.comm.admin.LoginDTO;
import org.hope.web.comm.admin.AdminVO;

public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "AdminMapper";
	
	@Override
	public AdminVO login(LoginDTO dto) throws Exception{
		return session.selectOne(namespace + ".login",dto);
	}
	
}
