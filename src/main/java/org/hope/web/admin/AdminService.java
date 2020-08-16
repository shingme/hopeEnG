package org.hope.web.admin;

import org.hope.web.admin.AdminVO;
import org.hope.web.admin.LoginDTO;

public interface AdminService {

	public AdminVO login(LoginDTO dto)throws Exception;
	
}
