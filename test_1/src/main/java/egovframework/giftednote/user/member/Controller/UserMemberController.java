package egovframework.giftednote.user.member.Controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import egovframework.giftednote.user.member.Service.UserMemberService;
import egovframework.giftednote.user.member.model.UserMemberVo;

@Controller
public class UserMemberController {
	
	
	@Autowired
	UserMemberService userMemberService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberController.class);
	
	@RequestMapping(value="/user/member/login.do" , method = RequestMethod.POST)
	public void MemberLogin(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		System.out.println(userMembervo.getEMAIL());
		System.out.println(userMembervo.getPASSWORD());
		ModelMap model = new ModelMap();
		
		UserMemberVo userMembervo2 = userMemberService.getView(userMembervo);
		//System.out.println(userMembervo2);
		if(userMembervo2 == null) {
			Logger.debug("이메일 혹은 패스워드를 재확인 해주십시오.");
			try {
				response.getWriter().println("false:-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println(userMembervo2.getIDX());
			Logger.debug("로그인 성공 하였습니다.");
			HttpSession session = request.getSession();
			session.setAttribute("session_login", "ok");
			System.out.println(userMembervo2.getIDX());
			session.setAttribute("session_idx", userMembervo2.getIDX());
			session.setAttribute("session_email", userMembervo2.getEMAIL());
			session.setAttribute("session_name", userMembervo2.getNAME());
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value="/user/member/pw_re.do" , method = RequestMethod.POST)
	public ModelAndView MemberPwRe(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		String pw = userMemberService.getPW(userMembervo);
		System.out.println(pw);
		return new ModelAndView("view/index" , "PASSWORD" , pw);
	}
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.GET)
	public ModelAndView MemberRegister(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("view/member/register");
	}
	@RequestMapping(value="/user/member/register.do" , method = RequestMethod.POST)
	public ModelAndView Register(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response){
		
		userMemberService.insertMember(userMembervo);
		return new ModelAndView("view/index");
	}
	
	@RequestMapping(value="/user/member/view.do" ,  method = RequestMethod.POST)
	public ModelAndView MemberView(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("view/index");
	}
	@RequestMapping(value="/user/member/search.do" ,  method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String search(@ModelAttribute("UserMemberVo") UserMemberVo userMembervo , HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		List<?> list = userMemberService.getList(userMembervo);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
}
