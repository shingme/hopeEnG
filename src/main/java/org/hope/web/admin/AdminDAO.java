package org.hope.web.admin;

import org.hope.web.admin.AdminVO;
import org.hope.web.admin.LoginDTO;


public interface AdminDAO {

	public AdminVO loginCheck(LoginDTO dto)throws Exception;
	
}
