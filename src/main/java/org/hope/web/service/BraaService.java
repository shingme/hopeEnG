package org.hope.web.service;

import java.util.List;

import org.hope.web.domain.BraaVO;

public interface BraaService {
	public void insertBraa(BraaVO braaVO);

	public List<BraaVO> selectBraa(BraaVO braaVO);

}
