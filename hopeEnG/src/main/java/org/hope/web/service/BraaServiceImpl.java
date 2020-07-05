package org.hope.web.service;

import org.hope.web.dao.BraaDAO;
import org.hope.web.domain.BraaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BraaServiceImpl implements BraaService{
	@Autowired
	BraaDAO braaDAO;
	
	@Override
	public void insertBraa(BraaVO braaVO) {
		// TODO Auto-generated method stub
		braaDAO.insert(braaVO);
		
	}

}
