package egovframework.giftednote.user.accept_log.service.impl;

import java.util.List;

import egovframework.giftednote.user.accept_log.model.UserAcceptLogVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
         
@Mapper("UserAcceptLogMapper")
public interface UserAcceptLogMapper {

	public void setLog(String clientIp);

	
}