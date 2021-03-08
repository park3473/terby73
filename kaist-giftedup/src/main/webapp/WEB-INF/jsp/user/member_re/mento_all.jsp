<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
</head>

<style>
    #new_sub_hd .title>p:first-of-type {
        display: none;
    }
</style>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../include/header.jsp" %>

        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %>
        </section>
    </header>
    
    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>선발</h2>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/check.do">신입생지원 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/inquiry.do">지원서/합격자 조회 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">


                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>학생 (온라인지원서)</p>
                                    </div>
                                   	 <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data" autocomplete="off">
                                        <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden" name="IDX" value="${model.view.IDX}" />
                                        <input type="hidden" name="PASSWORD" value=${model.view.PASSWORD }>
                                    <div class="member_input_wrap" style="padding: 0; margin-bottom: 60px;">
                                        <ul class="member_input nanumgothic">
                                            <li>
                                                <span class="list_t">학생명</span>
                                                <input class="input_size mr-2" type="text" name="NAME" id="NAME" value="${model.view.NAME}" >
                                                <label class="blind" for="NAME">이름</label>
                                           
                                            </li>
                                            
                                            <!--2020년3월27일 추가개발-->
                                            <li>
                                            	<c:if test="${model.view.SEX == '남자' }">
	                                            	<span class="list_t">성별</span>
	                                                <input type="radio" name="SEX" id="man" value="남자" checked>
	                                                <label for="man">남자</label>
	                                                <input type="radio" name="SEX" id="woman" value="여자" >
	                                                <label for="woman">여자</label>
	                                            </c:if>
	                                            <c:if test="${model.view.SEX == '여자' }">
	                                            	<span class="list_t">성별<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SEX" id="man" value="남자" >
	                                                <label for="man">남자</label>
	                                                <input type="radio" name="SEX" id="woman" value="여자" checked>
	                                                <label for="woman">여자</label>
	                                            </c:if>
                                            </li>
                                            <li>
                                                 <c:if test="${model.view.SCHOOL_TYPE == '초' }">
	                                                <span class="list_t">학교급</span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE1" value="초" checked>
	                                                <label for="SCHOOL_TYPE_1">초</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE2" value="중" >
	                                                <label for="SCHOOL_TYPE_2">중</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE3" value="고" >
	                                                <label for="SCHOOL_TYPE_3">고</label>
	                                             </c:if>
	                                             <c:if test="${model.view.SCHOOL_TYPE == '중' }">
	                                                <span class="list_t">학교급<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE1" value="초" >
	                                                <label for="SCHOOL_TYPE_1">초</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE2" value="중" checked>
	                                                <label for="SCHOOL_TYPE_2">중</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE3" value="고" >
	                                                <label for="SCHOOL_TYPE_3">고</label>
	                                             </c:if>
	                                             <c:if test="${model.view.SCHOOL_TYPE == '고' }">
	                                                <span class="list_t">학교급<b class="relate_c">＊</b></span>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE1" value="초" >
	                                                <label for="SCHOOL_TYPE_1">초</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE2" value="중" >
	                                                <label for="SCHOOL_TYPE_2">중</label>
	                                                <input type="radio" name="SCHOOL_TYPE" id="SCHOOL_TYPE3" value="고" checked>
	                                                <label for="SCHOOL_TYPE_3">고</label>
	                                             </c:if>
                                            </li>
                                            <!--2020년3월27일 추가개발 end-->
                                            <!-- 2020년 11 월 05일 추가개발 start -->
                                            <li>
                                                <span class="list_t">멘토교사 여부</span>
                                                <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE1" value="확정" <c:if test="${model.view.TEACHER_TYPE == '확정'}">checked</c:if> >
                                                <label for="TEACHER_TYPE1">있음</label>
                                                <input type="radio" name="TEACHER_TYPE" id="TEACHER_TYPE2" value="미확정" <c:if test="${model.view.TEACHER_TYPE == '미확정'}">checked</c:if> >
                                                <label for="TEACHER_TYPE2">없음</label>
                                                <span class="relate_c">멘토교사가 결정되지 않은 경우에만 반드시 '없음'으로 선택 후, 학생 관련 정보만 입력해주세요.</span>
                                 			</li>
                                 			<li>
                                 				<span class="list_t">학교 명</span>
                                 				<input class="input_size mr-2 input_size_2" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME_1" value="${model.view.SCHOOL_NAME }" readonly>
                                 				<label for="SCHOOL_NAME"></label>
                                 			</li>
                                            <!-- 2020년 11 월 05일 추가 개발 end -->
                                            <li>
                                                <span class="list_t">학년</span>
                          						<select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                               		<option value="">선택해주세요</option>
                                           			<option value="4"  <c:if test="${model.view.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                          			<option value="5"  <c:if test="${model.view.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                    				<option value="6"  <c:if test="${model.view.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                    <option value="7"  <c:if test="${model.view.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
   		                                            <option value="8"  <c:if test="${model.view.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
          		                                    <option value="9"  <c:if test="${model.view.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
            			                            <option value="10"  <c:if test="${model.view.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                   				                    <option value="11"  <c:if test="${model.view.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                        				            <option value="12"  <c:if test="${model.view.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                       			</select>
                                                <label class="blind" for="SCHOOL_YEAR">학년</label>
                                                <span class="list_t">반</span>
                                                <input class="input_size" type="number" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.view.SCHOOL_GROUP}" >
                                                <label class="blind" for="SCHOOL_GROUP"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.view.BIRTH }" >
                                                <label class="blind" for="BIRTH">생년월일</label>
                                                <span class="relate_c">클릭해서 생년월일을 선택해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">집주소</span>
                                                <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" readonly value="${model.view.ZIPCODE }">
                                                <label class="blind" for="ZIPCODE">집주소</label>
                                                <button type="button" onClick="zipCode();">우편번호</button>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" value="${model.view.ADDRESS }" readonly>
                                                    <label class="blind" for="ADDRESS"></label>
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.view.ADDRESS_DETAIL }" >
                                                    <label class="blind" for="ADDRESS_DETAIL"></label>
                                                    <input class="input_address" type="hidden" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL" value="${model.view.ADDRESS_LOCAL }" >
                                                    <label class="blind" for="ADDRESS"></label>
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="number" name="PHONE" id="PHONE" value="${model.view.PHONE }" >
                                                <label class="blind" for="PHONE"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">보호자 연락처</span>
                                                <input class="input_size" type="number" name="TEL" id="TEL" value="${model.view.TEL }" >
                                                <label class="blind" for="TEL">보호자 연락처</label>
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.view.EMAIL }" >
                                                <label class="blind" for="EMAIL"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">지원 유형</span>
                                                <select class="input_size mr-2" id="SUPPORT_AREA" name="SUPPORT_AREA">
                                 					<option <c:if test="${model.view.SUPPORT_AREA == '수학'}">selected</c:if>>수학</option>
                                                   	<option <c:if test="${model.view.SUPPORT_AREA == '과학'}">selected</c:if>>과학</option>
                                 			        <option <c:if test="${model.view.SUPPORT_AREA == '수·과'}">selected</c:if>>수·과학</option>
                      				                <option <c:if test="${model.view.SUPPORT_AREA == '발명'}">selected</c:if>>발명</option>
                			                        <option <c:if test="${model.view.SUPPORT_AREA == '정보'}">selected</c:if>>정보</option>
                	                                <option <c:if test="${model.view.SUPPORT_AREA == '인문사회'}">selected</c:if>>인문사회</option>
                                                </select>
                                                <label class="blind" for="SUPPORT_AREA">지원 유형</label>
                                                <span class="list_t">지원 자격</span>
                                                <select class="input_size" id="ELIGIBILITY" name="ELIGIBILITY">
                                                    <option value="교육급여수급자" <c:if test="${model.view.ELIGIBILITY == '교육급여수급자' }" > selected</c:if> >교육급여수급자</option>
                                                    <option value="특수교육대상자" <c:if test="${model.view.ELIGIBILITY == '특수교육대상자' }" > selected</c:if> >특수교육대상자</option>
                                                    <option value="도서·벽지 거주자" <c:if test="${model.view.ELIGIBILITY == '도서·벽지 거주자' }" > selected</c:if> >도서·벽지 거주자</option>
                                                    <option value="읍·면지역 거주자" <c:if test="${model.view.ELIGIBILITY == '읍·면지역 거주자' }" > selected</c:if> >읍·면지역 거주자</option>
                                                    <option value="학교장 추천" <c:if test="${model.view.ELIGIBILITY == '학교장 추천'}" > selected</c:if> >학교장 추천</option>
                                                    <option value="국가보훈처 지정 교육보호대상자" <c:if test="${model.view.ELIGIBILITY == '국가보훈처 지정 교육보호대상자'}" > selected</c:if> >국가보훈처 지정 교육보호대상자</option>
                                                    <option value="북한이탈주민 또는 그 자녀" <c:if test="${model.view.ELIGIBILITY == '북한이탈주민 또는 그 자녀'}" > selected</c:if> >북한이탈주민 또는 그 자녀</option>
                                                    <option value="법정차상위계층" <c:if test="${model.view.ELIGIBILITY == '법정차상위계층'}" > selected</c:if> >법정차상위계층</option>
                                                    <option value="한부모 가정보호 대상자" <c:if test="${model.view.ELIGIBILITY == '한부모 가정보호 대상자'}" > selected</c:if> >한부모 가정보호 대상자</option>
                                                    <option value="아동 복지 전담기관 보호 대상자" <c:if test="${model.view.ELIGIBILITY == '아동 복지 전담기관 보호 대상자'}" > selected</c:if> >아동 복지 전담기관 보호 대상자</option>
                                                    <option value="다문화 대상자" <c:if test="${model.view.ELIGIBILITY == '다문화 대상자'}" > selected</c:if> >다문화 대상자</option>
                                                    <option value="소년·소녀 가장 및 조손가정의 자녀" <c:if test="${model.view.ELIGIBILITY == '소년·소녀 가장 및 조손가정의 자녀'}" > selected</c:if> >소년·소녀 가장 및 조손가정의 자녀</option>
                                                    <option value="순직 군경·소방관·교직원의 자녀" <c:if test="${model.view.ELIGIBILITY == '순직 군경·소방관·교직원의 자녀'}" > selected</c:if> >순직 군경·소방관·교직원의 자녀</option>
                                                </select>
                                                <label class="blind" for="ELIGIBILITY"></label>
                                            </li>
                                            <li>
                                                <span class="list_t">영재 교육 경험 여부</span>
                                                <input type="radio" name="EXP" id="exist" value="유" <c:if test="${model.view.EXP == '유'}">checked</c:if>>
                                                <label for="exist">유</label>
                                                <input type="radio" name="EXP" id="none" value="무" <c:if test="${model.view.EXP == '무'}">checked</c:if>>
                                                <label for="none">무</label>
                                            </li>
                                            <li>
                                            	<span class="list_t">영재 교육 경험 종류</span>
                                                <select class="input_size mr-2" id="EXP_TYPE" name="EXP_TYPE">
                                                    <option value="영재학교" <c:if test="${model.view.EXP_TYPE == '영재학교' }">selected</c:if>>영재학교</option>
                                                    <option value="과학고등학교" <c:if test="${model.view.EXP_TYPE == '과학고등학교' }">selected</c:if> >과학고등학교</option>
                                                    <option value="시도교육청 영재교육원" <c:if test="${model.view.EXP_TYPE == '시도교육청 영재교육원' }">selected</c:if> >시도교육청 영재교육원</option>
                                                    <option value="대학교 영재교육원" <c:if test="${model.view.EXP_TYPE == '대학교 영재교육원' }">selected</c:if> >대학교 영재교육원</option>
                                                    <option value="영재학급" <c:if test="${model.view.EXP_TYPE == '영재학급' }">selected</c:if> >영재학급</option>
                                                    <option value="기타" <c:if test="${model.view.EXP_TYPE == '기타' }">selected</c:if> >기타</option>
                                                </select>
                                                <label class="blind" for="EXP_TYPE">영재 교육 경험 종류</label>
                                                <span class="list_t">영재 교육 참여 기간</span>
                                                <select class="input_size mr-2" id="EXP_DATA" name="EXP_DATA">
                                                    <option value="1년 이하" <c:if test="${model.view.EXP_DATA == '1년 이하' }">selected</c:if> >1년 이하</option>
                                                    <option value="1년 ~ 2년" <c:if test="${model.view.EXP_DATA == '1년 ~ 2년' }">selected</c:if> >1년 ~ 2년</option>
                                                    <option value="2년 ~ 3년" <c:if test="${model.view.EXP_DATA == '2년 ~ 3년' }">selected</c:if> >2년 ~ 3년</option>
                                                    <option value="3년 ~ 4년" <c:if test="${model.view.EXP_DATA == '3년 ~ 4년' }">selected</c:if> >3년 ~ 4년</option>
                                                    <option value="4년 이상" <c:if test="${model.view.EXP_DATA == '4년 이상' }">selected</c:if> >4년 이상</option>
                                                </select>
                                                <label class="blind" for="EXP_DATA">영재 교육 참여 기간</label>
                                            </li>
                                            <!-- 2020년 11월 05일 추가 개발 start-->
                                            <li>
                                                <span class="list_t"><span id="self_intr_text_1">자기 소개서 - 1</span><b class="relate_c">＊</b><br>(<span id="self_length_1">0</span> / 1000자)</span>
                                   			   	<textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_1" id="SELF_INTR_1" placeholder="영재키움 프로젝트’에 지원하게 된 이유를 자기의 꿈과 관련지어 자기소개서를 작성하시기 바랍니다.(지원 이유, 다짐, 각오 등이 드러나게)" style="height: 180px;" value="${model.view.SELF_INTR_1 }">${model.view.SELF_INTR_1 }</textarea>
                                    			<label class="blind" for="SELF_INTR">자기소개서</label>
                                    		</li>
                                       		<li>
                                      			<span class="list_t"><span id="self_intr_text_2">자기 소개서 - 2</span><b class="relate_c">＊</b><br>(<span id="self_length_2">0</span> / 1000자)</span>
                                       			<textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_2" id="SELF_INTR_2" placeholder="지원하는 분야(수학, 과학, 정보, 발명, 인문사회의 즐거웠던 경험을 써 보세요." style="height: 180px;" value="${model.view.SELF_INTR_2 }">${model.view.SELF_INTR_2 }</textarea>
                                       			<label class="blind" for="SELF_INTR">자기소개서</label>
                                           	</li>
                                         	<li id="self_intr_li" style="display:none">
                                              	<span class="list_t"><span id="self_intr_text_3">자기 소개서 - 3</span><b class="relate_c">＊</b><br>(<span id="self_length_3">0</span> / 1000자)</span>
                                              	<textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="SELF_INTR_3" id="SELF_INTR_3" placeholder="1000자 이내로 입력해주세요." style="height: 180px;" value="${model.view.SELF_INTR_3 }" >${model.view.SELF_INTR_3 }</textarea>
                                              	<label class="blind" for="SELF_INTR">자기소개서</label>
                                           	</li>
                                            <!-- 2020년 11월 05일 추가 개발 end-->
                                        </ul>
                                    </div>
                                    
                                    
                                    <!-- 멘토 지원서 form start-->
                                    	<!-- 멘토 지원서 insert, update form  start-->
										<div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>멘토교사 (온라인지원서)</p>
                                    	</div>
										
										<div class="member_input_wrap" id="mentor_insertform" style="padding: 0;" >
										
											<ul class="member_input nanumgothic">
												<li>
													<span class="list_t">멘토교사명<b class="relate_c">＊</b></span>
	                                                <input class="input_size mr-2" type="text" name="TEACHER_NAME" id="TEACHER_NAME" value="${model.view.TEACHER_NAME }">
	                                                <label class="blind" for="TEACHER_NAME">멘토교사명</label>
													<span class="list_t">성별<b class="relate_c">＊</b></span>
													<c:if test="${model.view.TEACHER_SEX == '남자'}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" checked>
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자">
		                                                <label for="woman">여자</label>
													</c:if>
													<c:if test="${model.view.TEACHER_SEX == '여자'}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" >
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자" checked>
		                                                <label for="woman">여자</label>
													</c:if>
													<c:if test="${model.view.TEACHER_SEX == null}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" >
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자">
		                                                <label for="woman">여자</label>
													</c:if>
													<c:if test="${model.view.TEACHER_SEX == ''}">
														<input type="radio" name="TEACHER_SEX" id="man" value="남자" >
		                                                <label for="man">남자</label>
		                                                <input type="radio" name="TEACHER_SEX" id="woman" value="여자">
		                                                <label for="woman">여자</label>
													</c:if>
												</li>
												<li>
													<span class="list_t">생년월일<b class="relate_c">＊</b></span>
	                                                <input class="input_size datecalendar" type="text" name="TEACHER_BIRTH" id="TEACHER_BIRTH" value="${model.view.TEACHER_BIRTH }">
	                                                <label class="blind" for="TEACHER_BIRTH">생년월일</label>
	                                                <span class="relate_c">클릭해서 생년월일을 선택해주세요.</span>
												</li>
												<li>
													<span class="list_t">연락처<b class="relate_c">＊</b></span>
	                                                <input class="input_size" type="number" name="TEACHER_PHONE" id="TEACHER_PHONE" value="${model.view.TEACHER_PHONE }">
	                                                <label class="blind" for="PHONE"></label>
	                                                <span class="relate_c">연락처 입력시 -없이 입력</span>
												</li>
												<li>
													<span class="list_t">학교 명<b class="relate_c">＊</b></span>
	                                 				<input class="input_size mr-2 input_size_2" type="text" name="TEACHER_SCHOOL_NAME" id="SCHOOL_NAME" value="${model.view.TEACHER_SCHOOL_NAME }">
	                                 				<label for="TEACHER_SCHOOL_NAME"></label>
	                                 				<input class="input_size mr-2 input_size_2" type="hidden" name="TEACHER_SIDO_NAME" id="TEACHER_SIDO_NAME" value="${model.view.TEACHER_SIDO_NAME }">
	                                 				<label for="TEACHER_SIDO_NAME"></label>
	                                 				<span class="btn_click"><a href="javascript:void(window.open('/user/member_re/search_school.do', '학교 검색','width=930, height=500'))">학교검색</a></span>
	                                 				<span class="relate_c">학교 명이 없을 경우 직접 입력해주새요.</span>
												</li>
												<li>
													<span class="list_t">이메일<b class="relate_c">＊</b></span>
	                                                <input class="input_size mr-2" type="text" name="TEACHER_EMAIL" id="TEACHER_EMAIL" value="${model.view.TEACHER_EMAIL }">
	                                                <label class="blind" for="EMAIL"></label>
	                                                <span class="list_t">전공<b class="relate_c">＊</b></span>
	                                                <input class="input_size" type="text" name="TEACHER_MAJOR" id="TEACHER_MAJOR" value="${model.view.TEACHER_MAJOR }">
	                                                <label class="blind" for="TEACHER_MAJOR">전공</label>
												</li>
												<li>
													<span class="list_t">학생으로 추천하는 이유<b class="relate_c">＊</b><br>(<span id="mtv_length">0</span> / 1000자)</span>
	                                            	<textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="TEACHER_MTV" id="TEACHER_MTV" placeholder="영재키움 프로젝트 참여 학생으로 추천하는 이유를 기술하십시오." value="${model.view.TEACHER_MTV }">${model.view.TEACHER_MTV }</textarea>
	                                                <label class="blind" for="TEACHER_MTV">멘토교사 지원 동기</label>
												</li>
												<li>
													<span class="list_t">지원자 성장가능성 및 우수성<b class="relate_c">＊</b><br>(<span id="rcmnd_length">0</span> / 1000자)</span>
	                                            	<textarea class="input_size mr-2 textarea_size" type="text" maxlength="1000" name="LETER_RCMND" id="LETER_RCMND" placeholder="지원자의 성장가능성 및 우수성을 기술하십시오." value="${model.view.LETER_RCMND }">${model.view.LETER_RCMND }</textarea>
	                                                <label class="blind" for="LETER_RCMND">학생 추천서</label>
												</li>
     												<input type="hidden" name="TEACHER_PASS" id="TEACHER_PASS" value="${model.view.TEACHER_PASS }">
											</ul>
										</div>
										<!-- 멘토 지원서 insert, update form  end-->
									<!-- 멘토 지원서 form end -->
									</form>
                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <a class="delete" id="view_update" href="javascript:Updatecheck()">지원서 저장</a>
                                            <a class="delete" href="javascript:history.back()">취소</a>
                                        </div>
                                    </div>
                                <!--보드 검색_버튼 end-->

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <form id="hidden_mentor" action="./view.do?" method="post" name="hidden_mentor" >
     	<input type="hidden" name="NAME" id="NAME" value="${model.NAME}" >
     	<input type="hidden" name="TEACHER_PASS" id="TEACHER_PASS" value="${model.PASS }">
    </form>
 
 	<!--제출 모달창 -->
	<div id="sucs_modal" class="sucs_modal_wrap insert_check_modal">
        <div class="sucs_modal_area">
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('.sucs_modal_wrap').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="check_icon">
                    <img src="${pageContext.request.contextPath}/resources/img/witer_icon.png" alt="작성"/>
                </div>
                <div class="sucs_title">
                    <h2>멘토교사 <span>지원서를</span> 제출하시겠습니까?</h2>
                </div>    
                <div class="update_btn_con">
                    <ul class="update_btn_box">
                        <li class="update_btn_ob update_btn_ob_01">
                            <button type="button" id="student_view_open" onclick="javascript:update_check_button()">제출하기</button>
                        </li>
                        <li class="update_btn_ob update_btn_ob_02">
                            <button type="button" onclick="$('.sucs_modal_wrap').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                        </li>
                    </ul>
                </div>
                <div class="sucs_txt_box_01">
                    <p>※ 지원서 수정은 언제든지 <span>지원자/합격자</span> 조회에서 수정이 가능합니다.</p>
                    <p>※ 지원서 마감이 되면 수정은 불가 합니다.</p>
                </div>
            </div>
        </div>
    </div>
	<!-- 모달창 end -->
	<!--수정 모달창 -->
	<div id="sucs_modal" class="sucs_modal_wrap update_modal">
        <div class="sucs_modal_area">
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('.sucs_modal_wrap').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="check_icon">
                    <img src="${pageContext.request.contextPath}/resources/img/witer_icon.png" alt="작성"/>
                </div>
                <div class="sucs_title">
                    <h2>멘토교사 <span>지원서를</span> 수정하시겠습니까?</h2>
                </div>    
                <div class="update_btn_con">
                    <ul class="update_btn_box">
                        <li class="update_btn_ob update_btn_ob_01">
                            <button type="button" id="student_view_open" onclick="javascript:update_check_button()">수정하기</button>
                        </li>
                        <li class="update_btn_ob update_btn_ob_02">
                            <button type="button" onclick="$('.sucs_modal_wrap').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                        </li>
                    </ul>
                </div>
                <div class="sucs_txt_box_01">
                    <p>※ 지원서 수정은 언제든지 <span>지원자/합격자</span> 조회에서 수정이 가능합니다.</p>
                    <p>※ 지원서 마감이 되면 수정은 불가 합니다.</p>
                </div>
            </div>
        </div>
    </div>
	<!-- 모달창 end -->
	
	<!--지원 취소 모달창 -->
    <!--
    <div id="sucs_modal" class="sucs_modal_wrap delete_modal">
        <div class="sucs_modal_area">
            <div class="modal_model">
                <img src="${pageContext.request.contextPath}/resources/img/modal_model.png" alt="학생" />
            </div>
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="sucs_btn_box">
                    <h3>- 지원서 취소하기 -</h3>
                    <ul class="sucs_sub_btn">
                        <li class="sucs_btn_ob sucs_btn_ob_01">
                            <button type="button" id="delete_check_button" onclick="javascript:delete_check_button()">확인</button>
                        </li>
                        <li class="sucs_btn_ob sucs_btn_ob_02">
                            <button type="button" onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')">아니요</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    -->
	<!-- 모달창 end -->

	<!--
	 최종 완료 모달창 12-17 수정되어 없앰
	<div id="final_check_box" class="member_re_modal modal_wrap">
		<div id="new_modal">
			<div class="modal_area">
				<div class="modal_con">
					<div class="modal_close">
						<i class="las la-times modal_close_click"></i>
					</div>
					<div class="modal_size">
						<div class="table_area">
							<div class="board_title">
								<h2>
									<span>최종완료 하시겠습니까?</span>
								</h2>
							</div>
							<div class="table_con">
								<div class="table_box">
									<h1>최종 완료시 조회 수정이 불가능 합니다</h1>
									<p>최종 완료 하시겠습니까?</p>
									<button type="button" id="final_check_button"
										onclick="javascript:final_check_button()">확인</button>
									<button type="button"
										onclick="$('#final_check_box').css('display','none')">아니요</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 -->

	<!--멘토 지원서 저장 모달창 -->
	<div id="sucs_modal" class="sucs_modal_wrap insert_modal">
        <div class="sucs_modal_area">
            <div class="modal_model">
                <img src="${pageContext.request.contextPath}/resources/img/modal_model_2.png" alt="교사" />
            </div>
            <div class="sucs_modal_con">
                <div class="modal_close">
                    <a onclick="$('#sucs_modal').css('display','none');$('.danger_bg').css('display','none')"><i class="las la-times"></i></a>
                </div>
                <div class="check_icon">
                    <img src="${pageContext.request.contextPath}/resources/img/upcheck_icon.png" alt="작성"/>
                </div>
                <div class="sucs_title">
                    <h2>지원서를 <span>성공적으로</span> 저장하였습니다!</h2>
                </div>
                <div class="sucs_txt_box">
                    <p>영재키움 메일 : <span>giftedup@kaist.ac.kr</span></p>
                    <p>영재키움 주소 : <span>대전 유성구 문지로 193 KAIST문지캠퍼스 F618호 영재키움 담당자</span></p>
                    <p>영재키움 담당번호 : <span>042-350-6227</span></p>
                </div>
                <div class="sucs_btn_box">
                    <h3>- 멘토지원서 조회하기 -</h3>
                    <ul class="sucs_sub_btn">
                        <li class="sucs_btn_ob sucs_btn_ob_01">
                            <button type="button" id="mento_view_open" onclick="javascript:mento_check_button()">바로가기</button>
                        </li>
                        <li class="sucs_btn_ob sucs_btn_ob_02">
                            <button type="button" onclick="location.href='${pageContext.request.contextPath}/index.do'">메인으로</button>
                        </li>
                    </ul>
                </div>
                <div class="sucs_txt_box_01">
                    <p>※ 지원서 조회는 필요하실 경우 <span>지원자/합격자</span> 조회에서 확인이 가능합니다.</p>
                    <p>※ 지원서 마감이 되면 수정은 불가 합니다.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="danger_bg"></div>
	<!-- 모달창 end -->
 
 
    <!--본문 end-->
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <%@ include file="../include/footerJs.jsp" %>
</body>
</html>
<script type="text/javascript">

	//모달창 관련 태그
	//모달창 닫기
	$(".modal_close_click").click(function(){
		$(".modal_wrap").hide();
	})
	
	//지원서가 저장 되고 난 뒤에 온 rtn =2 값을 받아 모달창 열기
	var rtn = '${model.rtn }';
	if (rtn == '2') {
		$(document).ready(function(){
    		$(".insert_modal").show();
    		$('.danger_bg').show();
    	})
	}
	
	//OK버튼 클릭시 view폼 보내기
	function mento_check_button(){
			$(document).ready(function(){
				$("#hidden_mentor").submit();	
			});
		}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type=text/javascript>
	/*
		$("#TEACHER_TYPE1").click(function(){
		    $('#techerDiv').show();
		})
		
		$("#TEACHER_TYPE2").click(function(){
		    $('#techerDiv').hide();
		})w
	*/
	//자기 소개서 글 갯수 표현
    $(document).ready(function() {
        $("#SELF_INTR_1").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_1').text(self_length.length);
        })
    })
    $(document).ready(function() {
        $("#SELF_INTR_2").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_2').text(self_length.length);
        })
    })
    $(document).ready(function() {
        $("#SELF_INTR_3").on("change keyup paste", function() {
            var self_length = $(this).val();
            $('#self_length_3').text(self_length.length);
        })
    })
   //자기소개서 학년 체크
	if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '고' || $("input:radio[name=SCHOOL_TYPE]:checked").val() == '중'){
    	$('#self_intr_li').show();
    	$('#SELF_INTR_1').attr('placeholder','지원자의 성장과정과 배경에 대해서 구체적으로 기술하시오. 또한 자신의 꿈이 무엇이며, 어떤 계기로 이 꿈을 가지게 되었는지, 그리고 지금까지 그 꿈을 이루기 위해 어떤 노력을 해왔는지 기술하십시오.');
    	$('#SELF_INTR_2').attr('placeholder','남보다 뛰어나다고 생각하는 자신의 장점(혹은 능력)과 고쳐야 할 단점(혹은 능력)이 있습니까? 그렇다면 자신의 장점을 발휘하였던 사례와, 단점을 극복하기 위해 기울인 노력에 대해서 구체적인 예와 함께 설명하십시오.');
    	$('#SELF_INTR_3').attr('placeholder','학교 재학기간 중 학업 이외의 활동(사회봉사, 교내·외 동아리활동, 단체 활동, 취미활동, 문화 활동, 발명관련 활동 등)에서 가장 소중했던 경험을 소개하고, 이러한 경험을 통해 무엇을 배웠는지에 대해서 기술하십시오.');
    	$('#self_intr_text_1').html('성장과정');
		$('#self_intr_text_2').html('장·단점');
		$('#self_intr_text_3').html('활동내용');
	}else{
		$('#self_intr_text_1').html('지원동기');
		$('#self_intr_text_2').html('지원하는 분야');
	}
	//자기소개서 학년
	$("input:radio[name=SCHOOL_TYPE]").click(function(){
		if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초' ){
			$('#self_intr_li').hide();
			$('#SELF_INTR_1').attr('placeholder','영재키움 프로젝트’에 지원하게 된 이유를 자기의 꿈과 관련지어 자기소개서를 작성하시기 바랍니다..(지원 이유, 다짐, 각오 등이 드러나게)');
			$('#SELF_INTR_2').attr('placeholder','지원하는 분야(수학, 과학, 정보, 발명, 인문사회의 즐거웠던 경험을 써 보세요.');
			$('#self_intr_text_1').html('지원동기');
			$('#self_intr_text_2').html('지원하는 분야');
		}else{
			$('#self_intr_li').show();
			$('#SELF_INTR_1').attr('placeholder','지원자의 성장과정과 배경에 대해서 구체적으로 기술하시오. 또한 자신의 꿈이 무엇이며, 어떤 계기로 이 꿈을 가지게 되었는지, 그리고 지금까지 그 꿈을 이루기 위해 어떤 노력을 해왔는지 기술하십시오.');
			$('#SELF_INTR_2').attr('placeholder','남보다 뛰어나다고 생각하는 자신의 장점(혹은 능력)과 고쳐야 할 단점(혹은 능력)이 있습니까? 그렇다면 자신의 장점을 발휘하였던 사례와, 단점을 극복하기 위해 기울인 노력에 대해서 구체적인 예와 함께 설명하십시오.');
			$('#SELF_INTR_3').attr('placeholder','학교 재학기간 중 학업 이외의 활동(사회봉사, 교내·외 동아리활동, 단체 활동, 취미활동, 문화 활동, 발명관련 활동 등)에서 가장 소중했던 경험을 소개하고, 이러한 경험을 통해 무엇을 배웠는지에 대해서 기술하십시오.');
			$('#self_intr_text_1').html('성장과정');
			$('#self_intr_text_2').html('장 단점');
			$('#self_intr_text_3').html('활동내용');
		}
	})
	
	
	//지원동기 갯수 표현
	var mtv_length = $("#TEACHER_MTV").val();
	$('#mtv_length').text(mtv_length.length);
	//멘토 동기 갯수표현
	var rcmnd_length = $("#LETER_RCMND").val();
	$('#rcmnd_length').text(rcmnd_length.length);
	

	//멘토교사 지원동기 갯수
	$(document).ready(function(){
		$("#TEACHER_MTV").on("change keyup paste", function() {
			var mtv_length = $(this).val();
			$('#mtv_length').text(mtv_length.length);
		})
	})
	//멘토교사 자기소개서 갯수
	$(document).ready(function(){
		$("#LETER_RCMND").on("change keyup paste", function() {
			var rcmnd_length = $(this).val();
			$('#rcmnd_length').text(rcmnd_length.length);
		})
	})
	
	
	//모달창 관련 태그
		//모달창 닫기
		$("#modal_close_click").click(function(){
			$(".modal_wrap").hide();
		})
		
		
		//지원 취소 모달창 관련
			//지원 취소 OK 버튼
			
			function delete_check_button(){
				$(document).ready(function(){
					var IDX = ${model.view.IDX};
					//alert(IDX);
					URL = './delete.do';
			        URL = URL + "?IDX=" + IDX;
			       	//alert(URL);
			       	location.href = URL;	
				});
			}
		
			function delete_check(){
				$(".delete_modal").show();
				$('.danger_bg').show();
			}
			
		/*
		//최종 확인 모달창 관련 12-17 없앰
		function Final_Completion(){
			$("#final_check_box").show();
		}
			function final_check_button(){
				$(document).ready(function(){
					var IDX = ${model.view.IDX};
					URL = './completion.do';
			        URL = URL + "?IDX=" + IDX;
			       	
			       	location.href = URL;
				});
			}
		*/
		//수정 모달창 관련
		function Updatecheck(){
			if ($('#NAME').val() == '') {
	            alert('이름을 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#SEX').val() == '') {
	            alert('성별을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#woman').val() == '') {
	            alert('성별을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#SCHOOL_NAME1').val() == '') {
	            alert('소속학교명 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#SCHOOL_YEAR').val() == '') {
	            alert('학년을 입력 하여 주세요');
	            return;
	        }

	        if ($('#SCHOOL_GROUP').val() == '') {
	            alert('반을 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#BIRTH').val() == '') {
	            alert('생년월일을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#ZIPCODE').val() == '') {
	            alert('우편번호를 입력 하여 주세요.');
	            return;
	        }
	        
	        if ($('#ADDRESS').val() == '') {
	            alert('상세주소를 입력 하여 주세요.');
	            return;
	        }

	        if ($('#SUPPORT_AREA').val() == '') {
	            alert('지원유형을 선택해주세요.');
	            return;
	        }

	        if ($('#ELIGIBILITY').val() == '') {
	            alert('지원자격을 선택해주세요.');
	            return;
	        }
			
			
			if ($('#TEACHER_NAME').val() == '') {
	 			alert('멘토교사 이름을 입력 하여 주세요');
	  			return;
	        }
	  		if ($('#TEACHER_PHONE').val() == '') {
	   			alert('멘토교사 연락처를 입력 하여 주세요');
	          	return;
	        }
	  		if($("input:radio[name=TEACHER_SEX]:checked").val() == null){
				alert("멘토교사 성별을 선택하여 주세요.");
				return;
			}

	  		if($('#TEACHER_BIRTH').val() == ''){
	        	alert('멘토분의 생년월일을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#SCHOOL_NAME').val() == ''){
	        	alert('멘토교사 학교명 을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#TEACHER_EMAIL').val() == ''){
	        	alert('이메일을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#TEACHER_MAJOR').val() == ''){
	        	alert('전공을 작성하여 주세요.');
	        	return;
	        }
	  		
	  		if($('#TEACHER_MTV').val() == ''){
	  			alert("멘토 교사 지원 동기 를 작성하여 주세요.");
	  			return;
	  		}
	  		
	        if($('#SELF_INTR').val() == ''){
	        	alert('자기소개서를 작성하여 주세요.');
	        	return;
	        }
	        if($('#LETER_RCMND').val() == ''){
	        	alert('학생추천서를 작성하여 주세요.');
	        	return;
	        }
	        	$(".insert_modal").show();
	            $(".danger_bg").show();	
		}
		
		
		function update_check_button(){
			$(document).ready(function(){
				UpdateClick();
			});
		}
	//
	
		if('${model.view.RESULT}' != 'nomento'){
			$('#view_update').css('display','none');
			$('#mentor_insert').css('display','none');
			$("input:radio").attr('disabled',true);
			$("input").attr('readonly',true);
			$("textarea").attr('readonly',true);
		}
		
		
		
		if($("input:radio[name=TEACHER_TYPE]:checked").val() == '확정'){
			$('#techerDiv').show();
		}else{
			$('#techerDiv').hide();
		}
	
		$("input:radio[name=TEACHER_TYPE]").click(function(){
			if($("input:radio[name=TEACHER_TYPE]:checked").val() == '확정'){
				    $('#techerDiv').show();
			}else{
				    $('#techerDiv').hide();
			};
		})
		
		if($("input:radio[name=EXP]:checked").val() == '무'){
			$("#EXP_TYPE").attr("disabled", true);
			$("#EXP_DATA").attr("disabled", true);;
		}
		
				
		$("input:radio[name=EXP]").click(function() {
		
		    if ($("input:radio[name=EXP]:checked").val() == '무') {
		        $("#EXP_TYPE").attr("disabled", true);
		        $("#EXP_DATA").attr("disabled", true);
		        $("#EXP_TYPE").val("");
		        $("#EXP_DATA").val("");
		
		    } else {
		        $("#EXP_TYPE").attr("disabled", false);
		        $("#EXP_DATA").attr("disabled", false);
		    }
		});
		function zipCode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            console.log(data);
		            $('#ZIPCODE').val(data.zonecode);
		            $('#ADDRESS').val(data.roadAddress);
		            $('#ADDRESS_LOCAL').val(data.sido);
		        }
		    }).open();
		}
		
		function UpdateClick() {
			if ($('#NAME').val() == '') {
	            alert('이름을 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#SEX').val() == '') {
	            alert('성별을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#woman').val() == '') {
	            alert('성별을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#SCHOOL_NAME1').val() == '') {
	            alert('소속학교명 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#SCHOOL_YEAR').val() == '') {
	            alert('학년을 입력 하여 주세요');
	            return;
	        }

	        if ($('#SCHOOL_GROUP').val() == '') {
	            alert('반을 입력 하여 주세요');
	            return;
	        }
	        
	        if ($('#BIRTH').val() == '') {
	            alert('생년월일을 선택해주세요.');
	            return;
	        }
	        
	        if ($('#ZIPCODE').val() == '') {
	            alert('우편번호를 입력 하여 주세요.');
	            return;
	        }
	        
	        if ($('#ADDRESS').val() == '') {
	            alert('상세주소를 입력 하여 주세요.');
	            return;
	        }

	        if ($('#SUPPORT_AREA').val() == '') {
	            alert('지원유형을 선택해주세요.');
	            return;
	        }

	        if ($('#ELIGIBILITY').val() == '') {
	            alert('지원자격을 선택해주세요.');
	            return;
	        }
			
			
			if ($('#TEACHER_NAME').val() == '') {
	 			alert('멘토교사 이름을 입력 하여 주세요');
	  			return;
	        }
	  		if ($('#TEACHER_PHONE').val() == '') {
	   			alert('멘토교사 연락처를 입력 하여 주세요');
	          	return;
	        }

	  		if($('#TEACHER_BIRTH').val() == ''){
	        	alert('멘토분의 생년월일을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#SCHOOL_NAME').val() == ''){
	        	alert('멘토교사 학교명 을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#TEACHER_EMAIL').val() == ''){
	        	alert('이메일을 작성하여 주세요.');
	        	return;
	        }
	  		if($('#TEACHER_MAJOR').val() == ''){
	        	alert('전공을 작성하여 주세요.');
	        	return;
	        }
	  		
	  		if($('#LETER_RCMND').val() == ''){
	        	alert('학생 추천서을 작성하여 주세요.');
	        	return;
	        }
	  		
	  		if($('#TEACHER_MTV').val() == ''){
	  			alert("멘토 교사 지원 동기 를 작성하여 주세요.");
	  			return;
	  		}
	  		
	        if($('#SELF_INTR').val() == ''){
	        	alert('자기소개서를 작성하여 주세요.');
	        	return;
	        }
	        if($("input:radio[name=SCHOOL_TYPE]:checked").val() == '초'){
				$('#SELF_INTR_3').val('');
			}
	      //핸드폰 번호 바꾸기 - 학생
	        var st_phone = $('#PHONE').val();
	        var st_phone = st_phone.replace(/-/gi, "");
	        $('#PHONE').val(st_phone);

	        //핸드폰 번호 바꾸기 - 멘토
	        var me_phone = $('#TEACHER_PHONE').val();
	        var me_phone = me_phone.replace(/-/gi, "");
	        $('#TEACHER_PHONE').val(me_phone);

	        //핸드폰 번호 바꾸기 - 부모
	        var pa_phone = $('#TEL').val();
	        var pa_phone = pa_phone.replace(/-/gi, "");
	        $('#TEL').val(pa_phone);
		

	        $('#updateform').submit();
	    }
		
		$.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar').datetimepicker({
	        format: 'Y.m.d',
	        lang: "ko",
	        timepicker: false
	    });

	    $.datetimepicker.setLocale('ko');
	    jQuery('.datecalendar2').datetimepicker({
	        format: 'Y.m.d H:i',
	        lang: "ko",
	        timepicker: true
	    });
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">