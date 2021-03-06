﻿package egovframework.kaist.admin.matching.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.matching.service.AdminMatchingService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.program.service.AdminProgramService;

@Controller
public class AdminMatchingController {

	@Autowired
	AdminMatchingService adminMatchingService;

	@Autowired
	AdminProgramService adminProgramService;
	
	@Autowired
	AdminMemberService adminMemberService;


	private static final Logger Logger = LoggerFactory.getLogger(AdminMatchingController.class);

	@RequestMapping(value = "/admin/matching/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
				
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		

		adminMatchingVo.setPAGE(Integer.parseInt(PAGE));
		adminMatchingVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMatchingVo.getPAGE() * adminMatchingVo.getITEM_COUNT();
		
		adminMatchingVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMatchingVo.setOFFSET(pagelimit);
		
	
    			
		
		model = adminMatchingService.getList(adminMatchingVo);
		
		model.put("SEARCH_TYPE", adminMatchingVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMatchingVo.getSEARCH_TEXT());
		
		
		
		model.put("beforeDomain", adminMatchingVo);

		model.put("YEARLIST", adminMatchingService.getListGroupByYear());


		//교수리스트
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("2");
		adminMemberVo.setLIMIT(999999);
		
		model.put("MEMBER", adminMemberService.getList(adminMemberVo));
		
		return new ModelAndView("admin/matching/list", "model", model);
	}

	
	
	@RequestMapping(value = "/admin/matching/{matchingid}/insertAjax.do", method = RequestMethod.GET)
	public ModelAndView insertAjax(@PathVariable("matchingid") String matchingid,
			HttpServletRequest request, HttpServletResponse response) 
	{
		String LOCATION = request.getParameter("LOCATION") != null ? request
				.getParameter("LOCATION") : "";
				
		ModelMap model = new ModelMap();
		
		model = adminMemberService.getView(matchingid);
		AdminMemberVo vo =  (AdminMemberVo) model.get("pageDomain");
		//model = adminMatchingService.getView(matchingid);
		
		AdminMatchingVo adminMatchingVo = new AdminMatchingVo();
		adminMatchingVo.setTYPE("1");
		adminMatchingVo.setLIMIT(999999);
		adminMatchingVo.setMEMBER_ID(matchingid);
		
		if(LOCATION.equals("") || LOCATION.equals("undefined"))
		{
			adminMatchingVo.setLOCATION(vo.getADDRESS_LOCAL());	
		}else
		{
			adminMatchingVo.setLOCATION(LOCATION);
		}
		adminMatchingVo.setPROFESSOR_MEMBER_ID(matchingid);
		
		model.put("MEMBER", adminMatchingService.getList(adminMatchingVo));
		//매칭되지 않은 사용자
		model.put("MEMBER_NOT", adminMatchingService.getMatchingNotMemberList(adminMatchingVo));
		
		model.put("LOCATION", adminMatchingVo.getLOCATION());
		model.put("PROFESSOR_MEMBER_ID", matchingid);
		return new ModelAndView("admin/matching/insertAjax", "model", model);
	}
	
	
	@RequestMapping(value = "/admin/matching/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("1");
		adminMemberVo.setLIMIT(999999);
		adminMemberService.getList(adminMemberVo);
		
	
		
		AdminMemberVo adminMemberVo2 = new AdminMemberVo();
		adminMemberVo2.setTYPE("2");
		adminMemberVo2.setLIMIT(999999);
		adminMemberService.getList(adminMemberVo2);
		model.put("MEMBER2", adminMemberService.getList(adminMemberVo2));

		
		
		
		
		model.put("SCHOOLNAME", adminMemberService.getListGroupBySchoolName());
		;
		
		
		Random random = new Random();
		
        String hak = SUtil.getNowDate().replaceAll("-", "");
        hak += random.nextInt(1000); 
        
        model.put("HAKBUN", hak);
		
		
		return new ModelAndView("admin/matching/insert", "model", model);
	}

	@RequestMapping(value = "/admin/matching/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo,
			HttpServletRequest  request, 
			HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/matching/";
		 
		/*
		String filename = SUtil.setFileUpload(request, drv);
		adminMatchingVo.setFILES(filename);
		*/
		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo userMemberDomain = adminMatchingVo;
				
				model = adminMemberService.getView(arrIdx[i]);
				AdminMemberVo vo =  (AdminMemberVo) model.get("pageDomain");
				userMemberDomain.setSCHOOL_NAME(vo.getSCHOOL_NAME());
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				adminMatchingService.setInsert(userMemberDomain);		
			}
		}
		
		return "redirect:./list.do";
	}
	
	
	@RequestMapping(value = "/admin/matching/{matchingid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("matchingid") String matchingid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminMatchingService.getView(matchingid);
		
		model.put("SCHOOLNAME", adminMemberService.getListGroupBySchoolName());

		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("1");
		adminMemberVo.setLIMIT(999999);
		adminMemberService.getList(adminMemberVo);
		model.put("MEMBER", adminMemberService.getList(adminMemberVo));

		
		AdminMemberVo adminMemberVo2 = new AdminMemberVo();
		adminMemberVo2.setTYPE("2");
		adminMemberVo2.setLIMIT(999999);
		adminMemberService.getList(adminMemberVo2);
		model.put("MEMBER2", adminMemberService.getList(adminMemberVo2));

		
		
		return new ModelAndView("admin/matching/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/matching/{matchingid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/matching/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 1)
		{
			;
		}else
		{
			filename = "";
		}
		
		adminMatchingVo.setFILES(filename);
		
		
		boolean rtn = adminMatchingService.setUpdate(adminMatchingVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/matching/{matchingid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("matchingid") String matchingid, @ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		adminMatchingVo.setMEMBER_ID(matchingid);
		boolean rtn = adminMatchingService.setDelete(adminMatchingVo);
		
		return "redirect:../list.do"; 
		
	}
	@RequestMapping(value = "/admin/matching/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(
			@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo userMemberDomain = new AdminMatchingVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				//userMemberDomain.setPROFESSOR_MEMBER_ID(PROFESSOR_MEMBER_ID);
				adminMatchingService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value = "/admin/matching/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo vo = new AdminMatchingVo();
				vo.setMEMBER_ID(arrIdx[i]);
				vo.setSEARCH_TYPE(adminMatchingVo.getSEARCH_TYPE());
				vo.setSEARCH_TEXT(adminMatchingVo.getSEARCH_TEXT());
				adminMatchingService.setUpdateTypeToText(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
