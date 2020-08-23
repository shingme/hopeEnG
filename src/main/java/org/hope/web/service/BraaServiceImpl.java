package org.hope.web.service;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;

import org.hope.web.controller.BraaController;
import org.hope.web.dao.BraaDAO;
import org.hope.web.domain.BraaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BraaServiceImpl implements BraaService{
	@Autowired
	BraaDAO braaDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BraaController.class);
	
	@Override
	public void insertBraa(BraaVO braaVO) throws Exception {
		// TODO Auto-generated method stub
		braaVO.setUserPw(sha256(braaVO.getUserPw())); //sha256 공통으로 빼면 애 controller로 빼기
		braaDAO.insert(braaVO);
	}

	@Override
	public List<BraaVO> selectBraa(Map<String, String> map) {
		// TODO Auto-generated method stub
		return braaDAO.select(map);
	}

	@Override
	public BraaVO selectDetailBraa(String bordNum) {
		// TODO Auto-generated method stub
		int num = increViewsBraa(bordNum);
		logger.debug("num:"+num);
		return braaDAO.selectDetail(bordNum);
	}
	
	@Override
	public int increViewsBraa(String bordNum) {
		// TODO Auto-generated method stub
		return braaDAO.updateIncreViewsBraa(bordNum);
	}
	
	@Override
	public void updateBraa(BraaVO braaVO) {
		// TODO Auto-generated method stub
		int num = braaDAO.update(braaVO);
		logger.debug("num:"+num);
		
	}

	@Override
	public Boolean confirmPasswd(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		String newPw = map.get("pw");
		String savPw = braaDAO.selectPassWd(map.get("bordNum"));

		return comparePw(sha256(newPw), savPw);
	}
	
	public String sha256(String value) throws Exception{
		//SHA 해싱
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(value.getBytes("utf-8"));
		byte[] bytes = md.digest();
		
		//byte를 Hex 값으로변환
		StringBuilder builder = new StringBuilder();
		for(byte b : bytes){
			builder.append(String.format("%02x", b));
		}
		
		return builder.toString();
	}
	
	public Boolean comparePw(String newPw, String orinPw){
		if(newPw.equals(orinPw)){
			return true;
		}
		return false;
	}

	@Override
	public int deleteBraa(BraaVO braaVO) {
		// TODO Auto-generated method stub
		return braaDAO.delete(braaVO);
		
	}

	//지울예정
	public void temp() throws Exception{
		List<BraaVO> list = braaDAO.hexTemp();
		String str = "";
		for(BraaVO val : list){
			str = sha256(val.getUserPw());
		}
		
	}

}
