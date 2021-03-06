﻿package egovframework.kaist.user.portfolio.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.kaist.user.portfolio.model.UserPortfolioVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userPortfolioMapper")
public interface UserPortfolioMapper {

	public List<?> getListAll();
	
	public int setInsert(UserPortfolioVo userPortfolioDomain);

	public boolean setUpdate(UserPortfolioVo userPortfolioDomain);

	public boolean setDelete(UserPortfolioVo userPortfolioDomain) ;

	public UserPortfolioVo getView(String Id) ;

	public List<?> getList(UserPortfolioVo userPortfolioVo);

	public int getListCnt(UserPortfolioVo userPortfolioVo);

	public UserPortfolioVo getView2(String idx);
	
	public HashMap<String,String> getSummary(UserPortfolioVo userPortfolioVo);
	
}
