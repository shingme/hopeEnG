package org.hope.web.service;

import java.util.List;
import java.util.Map;

import org.hope.web.controller.HomeController;
import org.hope.web.dao.HomeDAO;
import org.hope.web.domain.HomeVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	HomeDAO HomeDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Override
	public List<HomeVO> selectHome(Map<String, String> map) {
		// TODO Auto-generated method stub
		return HomeDAO.select(map);
	}



	/*
	 * @Override public void insertBoardFile(HomeFileVO HomeFileVO) {
	 * HomeDAO.insertHomeFile(HomeFileVO); }
	 */
    

}
