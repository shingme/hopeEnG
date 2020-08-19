package org.hope.web.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;
	
	@Override
	public AdminVO login(LoginDTO dto)throws Exception{
		
		return dao.login(dto);
	}
	

}
