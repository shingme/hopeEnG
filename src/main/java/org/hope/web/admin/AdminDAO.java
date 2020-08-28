package org.hope.web.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.hope.web.admin.AdminVO;
import org.hope.web.admin.LoginDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


public interface AdminDAO {
	
	public AdminVO loginCheck(LoginDTO dto)throws Exception;
	
}
