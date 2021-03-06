package egovframework.kaist.admin.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminMemberMapper")
public interface AdminMemberMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminMemberVo userMemberDomain);

	public boolean setUpdate(AdminMemberVo userMemberDomain);

	public boolean setDelete(AdminMemberVo userMemberDomain) ;

	public AdminMemberVo getView(String Id) ;

	public List<?> getList(AdminMemberVo adminMemberVo);

	public int getListCnt(AdminMemberVo adminMemberVo);

	public List<?> getAdviserALL();

	public boolean setUpdateTypeToText(AdminMemberVo userMemberDomain);

	public List<?> getListGroupBySchoolName();

	public void setDORMANCY();

	public List<?> getListMemberIdIn(String mEMBER_ID);

	public List<?> getListAllHuman();

	public void setUpdateShoolNumber();

	public void setInfo_AgreementUpdate();

	public List<HashMap> getListPortfolio(AdminMemberVo adminMemberVo);

	public int getListPortfolioCnt(AdminMemberVo adminMemberVo);

	public List<HashMap> getListPortfolioMemberIdIn(String mEMBER_ID);
	
}
