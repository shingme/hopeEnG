package org.hope.web.admin;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.hope.web.admin.LoginDTO;
import org.hope.web.admin.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "AdminMapper";
	
	@Override
	public AdminVO loginCheck(LoginDTO dto) throws Exception{
		
		AdminVO vo = session.selectOne(namespace + ".loginCheck",dto);
		
		System.out.println("adminVO : "  + vo);
		
		return vo;
	}
	
}
