<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<meta charset="UTF-8">
    <header id="adm_hd">
        <div id="adm_hd_area">
            <div id="adm_hd_con">
                <div class="adm_hd_size nanumgothic">

                    <div class="hd_menu">
                        <!--관리자 메뉴-->
                        <div class="adm_menu_area">
                            <div class="home">
                                <a href="${pageContext.request.contextPath}/admin/member/list.do">
                                    <img src="${pageContext.request.contextPath}/resources/img/admin/home.png" alt="홈" />
                                </a>
                            </div>
                            <ul class="adm_menu_con">
                                <li <c:if test="${fn:indexOf(requestURI, '/member/') > -1 
                                    && fn:indexOf(requestURI, 'matching') == -1
                                    && fn:indexOf(requestURI, 'local_group') == -1
                                    && fn:indexOf(requestURI, 'member/human') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/member/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/member_icon.png" alt="회원관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>회원관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, '/member/') > -1
                                            && fn:indexOf(requestURI, 'human') == -1}">class="nav_active"
                                            </c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/list.do">· 회원목록관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'matching') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/matching/list.do">· 교사 - 학생 매칭관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'local_group') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/local_group_member/list.do">· 교사 지역별 그룹관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'member/human') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/human/list.do">· 휴면회원 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'member/info_agreement') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member/info_agreement/insert.do">· 개인정보동의서</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'program') > -1
                                    && fn:indexOf(requestURI, '/sms_log/program/list.do') == -1 
                                    && fn:indexOf(requestURI, 'participation') == -1 
                                    && fn:indexOf(requestURI, 'activity_allowance') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/program/105/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/program_icon.png" alt="프로그램관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>프로그램 관리</span>
                                        </div>
                                        <li class="mr-b-50">
                                            <a href="#">· 학생프로그램</a>
                                            <ul class="sub_menu_ob">
                                                <!--
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/101/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/101/list.do">- 융합과학 프로젝트</a>
                                                </li>
                                                -->
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/105/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/105/list.do">- 발명 및 특허교육</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/102/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/102/list.do">- 창의융합캠프</a>
                                                </li>
                                                <!--
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/103/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/103/list.do">- 멘토링데이</a>
                                                </li>
                                                -->
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/104/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/104/list.do">- 자율연구</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/106/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/106/list.do">- 기타</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/program/201/list.do">· 교사프로그램관리</a>
                                            <ul class="sub_menu_ob">
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/201/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/201/list.do">- 교사연수</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/202/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/202/list.do">- 중앙 컨설팅</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/203/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/203/list.do">- 성과 발표회</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'program/204/') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/program/204/list.do">- 발대식</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, 'activity_allowance') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/activity_allowance/list.do">- 활동수당 신청관리</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data') > -1 
                                    && fn:indexOf(requestURI, 'banner') == -1
                                    && fn:indexOf(requestURI, 'popup') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/notices_data/1/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/board_icon.png" alt="게시판관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>게시판 관리</span>
                                        </div>
                                        <!--
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/1/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/1/list.do">· 게시판 관리</a>
                                        </li>
                                        -->
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/1/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/1/list.do">· 공지사항</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/2/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/2/list.do">· 홍보자료관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/3/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/3/list.do">· 자료실</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/12/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/12/list.do">· FAQ</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/11/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/11/list.do">· 알림마당</a>
                                        </li>                                        
                                        <!--
                                        <li <c:if test="${fn:indexOf(requestURI, 'admin/notices_data/4/') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/notices_data/4/list.do">· 또래멘토링</a>
                                        </li>
                                        -->
                                        <li <c:if test="${fn:indexOf(requestURI, 'banner') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/banner/list.do">· 배너관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'popup') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/popup/list.do">· 팝업관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, '/stats') > -1 
                                    && fn:indexOf(requestURI, '/participation/') == -1
                                    && fn:indexOf(requestURI, '/survey') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/stats/student/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/stats_icon.png" alt="통계관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>통계관리</span>
                                        </div>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/stats/student/list.do">· 회원통계관리</a>
                                            <ul class="sub_menu_ob">
                                                <li <c:if test="${fn:indexOf(requestURI, '/stats/student/list.do') > -1 || fn:indexOf(requestURI, '/stats/student/school_group.do') > -1 || fn:indexOf(requestURI, '/stats/student/schoolType.do') > -1 || fn:indexOf(requestURI, '/stats/student/sex.do') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/stats/student/list.do">- 학생</a>
                                                </li>
                                                <li <c:if test="${fn:indexOf(requestURI, '/stats/teacher/list.do') > -1 || fn:indexOf(requestURI, '/stats/teacher/sex.do') > -1}">class="nav_active"</c:if>>
                                                    <a href="${pageContext.request.contextPath}/admin/stats/teacher/list.do">- 교사</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, '/program/participation/list.do') > -1 || fn:indexOf(requestURI, '/sms_log/program/list.do') > -1}">class="nav_active"</c:if>>       <a href="${pageContext.request.contextPath}/admin/program/participation/list.do">· 프로그램 참여현황 관리</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'survey/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/survey/list.do">· 설문조사관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'member_re') > -1
                                    && fn:indexOf(requestURI, '/participation/') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/member_re/list.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/freshman_icon.png" alt="신입생관리" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>신입생 지원 모집</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'member_re/list') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member_re/list.do">· 신입생 지원 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'member_re/dcmnt') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member_re/dcmnt.do">· 지원 자격 리스트</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'member_re/member_re_to') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/member_re/member_re_to.do">· 신입생 지원 통계</a>
                                        </li>
                                    </ul>
                                </li>
                                <li <c:if test="${fn:indexOf(requestURI, 'portfolio') > -1
                                    && fn:indexOf(requestURI, '/stat/') == -1}">
                                    class="adm_menu_active"
                                    </c:if>>
                                    <a href="${pageContext.request.contextPath}/admin/portfolio/stat.do">
                                        <img src="${pageContext.request.contextPath}/resources/img/admin/portfolio_icon.png" alt="포트폴리오" />
                                    </a>
                                    <ul class="sub_menu_con">
                                        <div class="title notosans">
                                            <span></span>
                                            <span>포트폴리오 관리</span>
                                        </div>
                                        <li <c:if test="${fn:indexOf(requestURI, 'portfolio/stat.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/portfolio/stat.do">- 포트폴리오 통계</a>
                                        </li>
                                        <li <c:if test="${fn:indexOf(requestURI, 'portfolio/list.do') > -1}">class="nav_active"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/portfolio/list.do">- 포트폴리오 모니터링</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--관리자 메뉴 end-->

                        <!--서브메뉴 및 배너카드-->
                        <div class="adm_banner_area">
                            <div class="adm_logo">
                                <h2>ADMINISTRATOR</h2>
                            </div>
                            <div class="adm_banner_con">
                                <div class="card_area">
                                    <ul class="card_con">
                                        <li>
                                            <span>로그인 시간</span>
                                            <span>${session_login_tm }</span>
                                        </li>
                                        <li>
                                            <span>관리자 아이디</span>
                                            <span>${ssion_user_id }</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="phone_area">
                                    <div class="phone_con">
                                        <div class="phone_icon">
                                            <span><img src="${pageContext.request.contextPath}/resources/img/admin/phone.png" alt="전화기"></span>
                                        </div>
                                        <div class="phone_txt">
                                            <p>이용불편문의</p>
                                            <h2>042.935.5421</h2>
                                        </div>
                                    </div>
                                    <p>E-mail : inct@inct.co.kr</p>
                                </div>
                            </div>
                        </div>
                        <!--서브메뉴 및 배너카드 end-->

                    </div>
                    
                    <ul class="hd_adm_menu">
                        <li class="hd_active">
                            <a href="${pageContext.request.contextPath}/admin/member/list.do">MAIN</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/index.do">HOMEPAGE</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/member/logout.do">LOGOUT</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </div>
    </header>

    <script>
        function fileDown(url) {
            location.href = encodeURI(url);
        }
    </script>

