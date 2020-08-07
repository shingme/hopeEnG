package org.hope.web.comm.admin;

import org.hope.web.comm.admin.AdminVO;
import org.hope.web.comm.admin.LoginDTO;

public interface AdminDAO {

	public AdminVO login(LoginDTO dto)throws Exception;
	
}
