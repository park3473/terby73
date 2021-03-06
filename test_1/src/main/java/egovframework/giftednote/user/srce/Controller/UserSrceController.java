package egovframework.giftednote.user.srce.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.giftednote.user.exploring.model.UserExploringVo;
import egovframework.giftednote.user.srce.Service.UserSrceService;
import egovframework.giftednote.user.srce.model.UserSrceVo;

@Controller
public class UserSrceController {
	@Autowired
	UserSrceService userSrceService;
	
	@RequestMapping(value="/srce/srce.do" , method = RequestMethod.GET)
	public ModelAndView Srce(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response){
		UserSrceVo.setN_IDX(request.getParameter("N_IDX"));
		
		ModelMap model = new ModelMap();
		String N_IDX = UserSrceVo.getN_IDX();
		model = userSrceService.getList(UserSrceVo);
		model.put("N_IDX", N_IDX);
		
		return new ModelAndView("/user/srce/srce","model",model);
	}
	@RequestMapping(value="/srce/srce.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	@ResponseBody
	public String SrceAJAX(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response)throws JsonProcessingException {
		List<?> list = userSrceService.getListAJAX(UserSrceVo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	@RequestMapping(value="/srce/setInsert.do", method = RequestMethod.POST)
	public void SrceInsert(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response) {
		userSrceService.setInsert(UserSrceVo);
	}
	
	@RequestMapping(value="/srce/setUpdate.do", method = RequestMethod.POST)
	public void SrceUpdate(@ModelAttribute("UserSrceVo") UserSrceVo UserSrceVo,HttpServletRequest request, HttpServletResponse response) {
		userSrceService.setUpdate(UserSrceVo);
	}
	
}
