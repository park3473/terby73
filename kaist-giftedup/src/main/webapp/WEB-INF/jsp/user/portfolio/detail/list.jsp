<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %> 

        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %> 
        </section>
    </header>

    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <c:if test="${
                            fn:indexOf(requestURI, '/member/') > -1
                            || fn:indexOf(requestURI, '/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/program/') > -1
                            || fn:indexOf(requestURI, '/mypage/survey/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/activity_allowance/') > -1 }">
                            <h2>마이페이지</h2>
                            </c:if>
                        </div>
                        
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '1'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>

                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>${model.USER.pageDomain.NAME}학생의 포트폴리오</p>
                                </div>
                                <div class="info_wrap">
                                    <div class="info_wrap">
                                        <div class="title mr-0 student_stat_box">
                                        	<div class="stat_box">
	                                            <h2>
	                                                <!-- <span class="orange_c">${model.USER.pageDomain.YEAR}</span> -->
	                                                <!-- <span class="purple_c">
	                                                    <c:choose>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '21'}">초등학교</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '22'}">중학교</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '23'}">고등학교</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '4'}">초등학교4학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '5'}">초등학교5학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '6'}">초등학교6학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '7'}">중학교1학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '8'}">중학교2학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '9'}">중학교3학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '10'}">고등학교1학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '11'}">고등학교2학년</c:when>
	                                                    <c:when test="${model.USER.pageDomain.SCHOOL_YEAR == '12'}">고등학교3학년</c:when>
	                                                    <c:otherwise></c:otherwise>
	                                                    </c:choose>
	                                                </span> 의  -->
	                                                <span class="orange_c" style="font-weight: 600;">${model.USER.pageDomain.NAME}</span>	학생의 <span class="purple_c" style="font-weight: 600;">포트폴리오 목록</span> 입니다.
	                                            </h2>
	                                            <div class="port_stat_con">
	                                            	<p><span style="margin-right:10px"><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>참여중인 현재 교육과정 중 총 <span><span class="counter">${model.SUMM.SUM_A}</span>시간</span> 수료하셨습니다.</p>
	                                            	<p><span style="margin-right:10px"><img src="${pageContext.request.contextPath}/resources/img/circle.png" alt="서브타이틀"></span>참여중인 프로그램 만족도는 <span><span class="counter">${model.SUMM.AVG_A}</span>점</span> 입니다.</p>
	                                            	<div class="port_bars_box">
	                                            		<div class="port_icon">
	                                            			<div class="icon_box">
	                                            				<img src="${pageContext.request.contextPath}/resources/img/port_icon_01.png" alt="수료"/>
	                                            			</div>
	                                            			<p>${model.SUMM.SUM_A}시간</p>
	                                            		</div>
	                                            		<div class="port_bars">
	                                            			<div class="gauge_bar" style="width:0;"></div>
	                                            			<script>
	                                            				var per = parseInt("${model.SUMM.SUM_A}",10)*100/48;
	                                            				
	                                            				if(per > 100){
	                                            					per == 100;
	                                            				}
	                                            				
	                                            				$("div.gauge_bar").animate({width : per+'%'},1800);
	                                            			</script>
	                                            		</div>
	                                            		<div class="port_icon">
	                                            			<div class="iocn_box">
	                                            				<img src="${pageContext.request.contextPath}/resources/img/port_icon_02.png" alt="수료"/>
	                                            			</div>
	                                            			<p>48시간</p>
	                                            		</div>
	                                            	</div>
	                                            </div>
                                            </div>
                                            <c:if test="${ssion_member_type == '1'}">
                                            <div class="stat_img_box">
                      							<img src="${pageContext.request.contextPath}/resources/img/stat_img_box.png" alt="학생이미지"/>
                                            </div>
                                            </c:if>
                                            <c:if test="${ssion_member_type == '2'}">
                                            <div class="stat_img_box">
                      							<img src="${pageContext.request.contextPath}/resources/img/stat_img_box_02.png" alt="교사이미지"/>
                                            </div>
                                            </c:if>
                                        </div>
                                        
                                        <c:if test="${ssion_member_type == '1'}">
	                                        <!-- 학생용 리스트 -->
	                                        <div class="table_scroll">
		                                        <table class="txt project_txt">
		                                            <tr>
		                                            	<%--
		                                                <th class="check"><input type="checkbox" value="" name="chk_calc_all" id="chk_calc_all"></th>
		                                            	 --%>
		                                                <th class="number">순번</th>
		                                                <th class="join_time">체험날짜</th>
		                                                <th class="program_name">교육과정</th>
		                                                <th class="program_name">프로그램 명</th>
		                                                <th class="area">장소</th>
		                                                <th class="time">시간</th>
		                                                <th class="level">학생<br>만족도</th>
		                                                <th class="feedback">멘토교사<br>피드백</th>
		                                            </tr>
		                                            
		                                            <c:forEach var="item" items="${model.list}" varStatus="status">
		                                            <tr>
		                                            	<%--
		                                                <td><input type="checkbox" value="" name="chk_calc" id="chk_calc" data-id="${item.IDX}"></td>
		                                            	 --%>
		                                                <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
		                                                <td>${fn:substring(item.START_TM,0,16)}<br> ~ <br>${fn:substring(item.END_TM,0,16)}</td>
		                                                <td>
		                                                	<a href="${pageContext.request.contextPath}/user/portfolio/detail/${item.IDX}/view.do">
			                                                	<c:choose>
			                                                		<c:when test="${item.COURSE == 1}">찾아가는 영재교육 프로그램</c:when>
			                                                		<c:when test="${item.COURSE == 2}">체험진로탐색 프로그램</c:when>
			                                                		<c:when test="${item.COURSE == 3}">창의융합캠프</c:when>
			                                                		<c:when test="${item.COURSE == 4}">기타 프로그램</c:when>
			                                                		<c:otherwise>미등록</c:otherwise>
			                                                	</c:choose>
		                                                	</a>
		                                                </td>
		                                                <td><a href="${pageContext.request.contextPath}/user/portfolio/detail/${item.IDX}/view.do">${item.PRGM_NM}</a></td>
		                                                <td>${item.PLACE}</td>
		                                                <td>${item.RTICIPATION_TM}</td>
		                                                <td>${item.STFT}</td>
		                                                <td>
		                                                	<c:choose>
		                                                		<c:when test="${fn:length(item.EVALUATION_TACHER) > 0}"><p class="port_btn">완료</p></c:when>
		                                                		<c:otherwise><p class="port_btn_02">진행중</p></c:otherwise>
		                                                	</c:choose>
		                                                </td>
		                                            </tr>
		                                            </c:forEach>
		                                        </table>
	                                        </div>
	                                        <!-- 학생용 리스트  end -->
                                        </c:if>
                                        
                                        <c:if test="${ssion_member_type == '2'}">
                                        <!-- 교사용 리스트 -->
                                        <div class="table_scroll">
	                                        <table class="txt project_txt">
	                                            <tr>
	                                            	<%--
	                                                <th class="check"><input type="checkbox" value="" name="chk_calc_all" id="chk_calc_all"></th>
	                                            	 --%>
	                                                <th class="number">순번</th>
	                                                <th class="join_time">체험날짜</th>
	                                                <th class="program_name">교육과정</th>
	                                                <th class="program_name">프로그램 명</th>
	                                                <th class="area">장소</th>
	                                                <th class="time">시간</th>
	                                                <th class="level">학생<br>만족도</th>
	                                                <th class="feedback">피드백<br>공개여부</th>
	                                                <th class="feedback">피드백</th>
	                                            </tr>
	                                            
	                                            <c:forEach var="item" items="${model.list}" varStatus="status">
		                                            <tr>
		                                            	<%--
		                                                <td><input type="checkbox" value="" name="chk_calc" id="chk_calc" data-id="${item.IDX}"></td>
		                                            	 --%>
		                                                <td>${model.itemtotalcount - (status.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
		                                                <td>${fn:substring(item.START_TM,0,16)}<br> ~ <br>${fn:substring(item.END_TM,0,16)}</td>
		                                                <td>
		                                                	<a href="${pageContext.request.contextPath}/user/portfolio/detail/${item.IDX}/view.do?MEMBER_ID=${model.MEMBER_ID}">
			                                                	<c:choose>
			                                                		<c:when test="${item.COURSE == 1}">찾아가는 영재교육 프로그램</c:when>
			                                                		<c:when test="${item.COURSE == 2}">체험진로탐색 프로그램</c:when>
			                                                		<c:when test="${item.COURSE == 3}">창의융합캠프</c:when>
			                                                		<c:when test="${item.COURSE == 4}">기타 프로그램</c:when>
			                                                		<c:otherwise>미등록</c:otherwise>
			                                                	</c:choose>
		                                                	</a>
		                                                </td>
		                                                <td><a href="${pageContext.request.contextPath}/user/portfolio/detail/${item.IDX}/view.do?MEMBER_ID=${model.MEMBER_ID}">${item.PRGM_NM}</a></td>
		                                                <td>${item.PLACE}</td>
		                                                <td>${item.RTICIPATION_TM}</td>
		                                                <td>${item.STFT}</td>
		                                                <td>
		                                                	<c:choose>
		                                                		<c:when test="${item.EVAL_OPEN_YN == '0' }"><p class="port_btn">공개</p></c:when>
		                                                		<c:otherwise><p class="port_btn_02">비공개</p></c:otherwise>
		                                                	</c:choose>
		                                               	</td>
		                                                <td>
		                                                	<c:choose>
		                                                		<c:when test="${item.EVALUATION_TACHER != '' }"><p class="port_btn">완료</p></c:when>
		                                                		<c:otherwise><p class="port_btn_02">진행중</p></c:otherwise>
		                                                	</c:choose>
		                                                </td>
		                                            </tr>
	                                            </c:forEach>
	                                        </table>
                                        </div>
                                        <!-- 교사용 리스트  end -->
                                        </c:if>
										<!--페이지 넘버-->
                                <nav class="paging_number">
                                    <ul class="page">
    <c:if test="${model.page > 0}"> 
    <c:if test="${model.itempagestart-model.itemCount > 0}">
    <div id="first_a">
        <a href="javascript:pageChanged(${model.itempagestart-model.itemCount}, ${model.itempageend});">
            <img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음">
        </a>
    </div>
    <li id="prev_a">
        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});">
            <img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로">
        </a>
    </li>
    </c:if>
    <c:if test="${model.itempagestart-model.itemCount <= 0}">
    <li id="first_a">
        <a href="javascript:pageChanged(0,0);">
            <img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음">
        </a>
    </li>
    <li id="prev_a">
        <a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});">
            <img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로">
        </a>
    </li>
    </c:if>
    </c:if>

    <c:if test="${model.page <= 0}">
    <li id="first_a">
        <a href="#">
            <img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음">
        </a>
    </li>
    <li id="prev_a">
        <a href="#">
            <img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로">
        </a>
    </li>
    </c:if>

    <c:if test="${model.itempageend > 0}">
    <c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
    <c:choose>
    
    <c:when test="${model.page == i }">
    <li class="number page_active"><a href="#">${i+1}</a></li>
    </c:when>
    
    <c:otherwise>
    <li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
    </c:otherwise>
    
    </c:choose>
    </c:forEach>
    </c:if>

    <c:if test="${model.itempageend == 0}">
    <li class="number">1</li>
    </c:if>
    <c:if test="${model.itempageend < 0}">
    <li class="number">1</li>
    </c:if>

    <c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
    <li id="next_a">
        <a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});">
            <img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음">
        </a>
    </li>
    </c:if>
    <c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
    <li id="next_a">
        <a href="#">
            <img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음">
        </a>
    </li>
    </c:if>

    <fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
    <c:choose>
    
    <c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
    <li id="end_a">
        <a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});">
            <img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝">
        </a>
    </li>
    </c:when>
    
    <c:otherwise>
    <li id="end_a">
        <a href="#">
            <img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝">
        </a>
    </li>
    </c:otherwise>
    
    </c:choose>
</ul>
                                </nav>
                                <!--페이지 넘버 end-->  
										
										
                                        <!--보드 검색_버튼-->
                                        <div class="board_btn_wrap">
                                            <div class="board_btn">
                                            	<c:if test="${ssion_member_type == '1'}">
                                            	<a class="delete" href="javascript:showinsert();">포트폴리오 작성</a>
                                            	</c:if>
                                            	<%--
                                            	<a class="cancel" href="#">삭제</a>
                                            	 --%>
                                            </div>
                                        </div>
                                        <!--보드 검색_버튼 end-->
										
										
										<div class="title mr-0">
                                            <h2>
                                                2020 영재키움 프로젝트 수료 여부
                                            </h2>
                                        </div>
                                        
                                        <div class="table_scroll">
	                                        <table class="txt project_txt">
	                                            <tr>
	                                                <th class="number">과목</th>
	                                                <th class="program_name">찾아가는 영재교육</th>
	                                                <th class="program_name">체험진로탐색</th>
	                                                <th class="program_name">창의융합캠프</th>
	                                                <th class="program_name">기타</th>
	                                                <th class="time">합계</th>
	                                                <th class="level">수료 여부</th>
	                                            </tr>
	                                            
	                                            <tr>
	                                                <th>시간</th>
	                                                <td>${model.SUMM.SUM_1}</td>
	                                                <td>${model.SUMM.SUM_2}</td>
	                                                <td>${model.SUMM.SUM_3}</td>
	                                                <td>${model.SUMM.SUM_4}</td>
	                                                <td>${model.SUMM.SUM_A}</td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${model.SUMM.SUM_A > 47}"><p class="port_btn">수료</p></c:when>
	                                                		<c:otherwise><p class="port_btn_02">미수료</p></c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                            </tr>
	                                        </table>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                
                
            </div>
        </div>
    </section>
    <!--본문 end-->
	<!--주의 모달-->
    <div class="danger_modal_area">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>본 사이트는 <span>Chrome, Safari, Firefox 및 IE11</span> 이상의<br> 최신 브라우저에 최적화 되어있습니다.</h2>
                <p>HTML5, CSS3 기반으로 제작되어 IE9 버전 이하에서는 일부 기능이 정상적으로 작동하지 않을수 있습니다.</p>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none');$('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a onclick="javascript:insert('${model.USER.pageDomain.MEMBER_ID}')">포트폴리오작성</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="danger_bg"></div>
    <!--주의 모달 end-->
	
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    <%@ include file="../../include/footerJs.jsp" %> 
</body>

</html>

<script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
<script>			
    function pageChanged(page, endpage) {
        if (page < 0) {
            page = 0;
        }
        
        if (endpage < 0) {
            endpage = 0;
        }
        
        if (page >= endpage) {
            page = endpage;
        }

        var URL = "list.do?PAGE="+page;

        if('${model.beforeDomain.ITEM_COUNT}}' == '') {
            URL = URL + "&ITEM_COUNT=" + '10';
        }else {
            URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
        }
        
        location.href = URL;
    }
</script>
<script type="text/javascript">

    $(document).on("click", "#chk_calc_all", function(e) {
        if ($(this).prop('checked')) {
            $('input[name="chk_calc"]').prop('checked', true);
        } else {
            $('input[name="chk_calc"]').prop('checked', false);
        }
    });
    
    $(document).ready(function($) {
        $('.counter').counterUp({
            delay: 10,
            time: 500
        });
    });
    
    
    
    function update(id, idx) {
        var URL = './'+id+ '/' +idx +'/update.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }
    
    function showinsert(){
    	$('.danger_modal_area').css('display','block');
        $('.danger_bg').show();
    }
    
    
    /*20년 12월22일 추가된 */
	function insert(id){
		var id = id
		var URL = './'+id+'/insert.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
	}
	
	
	/*기존 사용되었던 포트폴리오 이동 경로
    function insert(id) {
        var URL = './'+id+'/insert.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }
    */
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">