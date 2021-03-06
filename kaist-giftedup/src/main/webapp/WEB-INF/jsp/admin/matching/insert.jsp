 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %>
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
</head>

<body>
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    
                    <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>교사-학생 매칭관리</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
 								<input type="hidden"  name="csrf" value="${CSRF_TOKEN}"/>
                                    <div class="title">
                                        <h2>매칭정보 입력</h2>
                                    </div>
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">학년도＊</span>
                                                <select class="input_size mr" id="YEAR" name="YEAR">
                                                    <option>2020</option>
                                                    <option>2019</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">학년＊</span>
                                                <select class="input_size mr" id="SUPPORT_GROUP" name="SUPPORT_GROUP">
                                                    <option value="">선택해주세요</option>
                                                    <option value="4">초등학교4학년</option>
                                                    <option value="5">초등학교5학년</option>
                                                    <option value="6">초등학교6학년</option>
                                                    <option value="7">중학교1학년</option>
                                                    <option value="8">중학교2학년</option>
                                                    <option value="9">중학교3학년</option>
                                                    <option value="10">고등학교1학년</option>
                                                    <option value="11">고등학교2학년</option>
                                                    <option value="12">고등학교3학년</option>
                                                </select>
                                            </li>
                                            <!--
                                            <li>
                                                <span class="list_t">학생선택＊</span>
                                                <select class="input_size mr" id="MEMBER_ID" name="MEMBER_ID">
                                                    <option value="">선택해주세요</option>
			                                        <c:forEach var="item" items="${model.MEMBER.list}" varStatus="status">
			                                        <option value="${item.MEMBER_ID}">${item.NAME}(${item.SCHOOL_NAME})</option>
			                                        </c:forEach>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">소속학교＊</span>
                                                <select class="input_size mr" id="SCHOOL_NAME" name="SCHOOL_NAME">
                                                    <c:forEach var="item" items="${model.SCHOOLNAME.list}" varStatus="status">
			                                        <option value="${item.SCHOOL_NAME}">${item.SCHOOL_NAME}</option>
			                                        </c:forEach>
                                                </select>
                                                <input type="radio" name="direct">
                                               <label class="relate_c" for="direct">직접입력</label>
                                            </li>
                                            <li>
                                                <span class="list_t">학년/반</span>
                                                <input class="input_size" type="text" name="SCHOOL_YEAR" id="SCHOOL_YEAR">
                                            </li>
                                            <li>
                                                <span class="list_t">멘토교사</span>
                                                 <select class="input_size mr" id="PROFESSOR_MEMBER_ID" name="PROFESSOR_MEMBER_ID">
                                                    <option value="">선택해주세요</option>
			                                        <c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
			                                        <option value="${item.MEMBER_ID}">${item.NAME}(${item.SCHOOL_NAME})</option>
			                                        </c:forEach>
                                                </select>
                                               	<input type="radio" name="direct">
                                                <label class="relate_c" for="direct">직접입력</label>
                                            </li>
                                            <li>
                                                <span class="list_t">재학상태</span>
                                                <select class="input_size mr" id="ENROLLMENT_STATUS" name="ENROLLMENT_STATUS">
                                                    <option value="">선택해주세요</option>
                                                    <option value="1" >재학</option>
                                                    <option value="2" >수료</option>
                                                    <option value="3" >휴학</option>
                                                    <option value="4" >미이수</option>
                                                    <option value="5" >자퇴</option>
                                                </select>
                                               <input type="radio" name="direct">
                                                < <label class="relate_c" for="direct">직접입력</label>
                                            </li>
                                            <li>
                                                <span class="list_t">파일첨부</span>
                                                <input class="input_size" type="file" name="file" id="file">
                                            </li>
                                            -->
                                            <li>
                                                <span class="list_t">비고</span>
                                                <textarea id="MEMO" name="MEMO"></textarea>
                                            </li>
                                            <li>
	                                            <span class="list_t">멘토교사</span>
	                                            <input type="text" placeholder="아이디입력" id="MEMBER_ID" name="MEMBER_ID" value="${model.LOCAL_GROUP_IDX}">
	                                            <span class="or_t">OR</span>
	                                            
	                                            <!-- 
	                                            <select id="GROUPLIST" NAME="GROUPLIST">
	                                             	<option>선택하여주세요</option>
	                                             	<c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
			                                        <option value="${item.MEMBER_ID}">${item.NAME}(${item.SCHOOL_NAME})</option>
			                                        </c:forEach>
			                                    </select>
			                                     -->
	                                            <button type="button" id="maching_btn" onClick="#">검색</button>
	                                            <!-- 
	                                            <button type="button" id="inquiry_btn" onClick="selectAjax()">선택</button>
	                                            -->
	                                            <span class="relate_c">직접 아이디를 입력하거나 성명을 검색해주세요.</span>
	                                        </li>
	                                        <li class="group_list_area" id="group_list_area">
	                                        </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <!-- <a class="storage" href="javascript:insertClick()">저장하기</a> -->
                                    <a class="cancel" href="./list.do">이전화면</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                            
                            
                            <!-- 매칭 모달 -->
                            <div class="matching_modal_wrap">
                            	<div class="matching_modal_con">
                           			<!-- 
                           			<div class="page_seach">
                            			<select>
                            				<option>전체</option>
                            				<option>성명</option>
                            				<option>회원아이디</option>
                            			</select>
                            			<input type="text">
                            			<button velue="검색">검색</button>
                           			</div>
                           			 -->
                           			<div class="matching_table_con">
                            			<table id="matching_table" class="display" style="width:100%">
                            				<thead>
	                            				<tr>
	                            					<th style="width:95px">아이디</th>
	                            					<th style="width:98px">이름</th>
	                            					<th style="width:75px">시도명</th>
	                            					<th style="width:117px">소속학교명</th>
	                            					<th style="width:54px">성별</th>
	                            					<th style="width:55px">비고</th>
	                            				</tr>
                            				<thead>
                            				<tbody>
                            					<c:forEach var="item" items="${model.MEMBER2.list}" varStatus="status">
			                                        <tr>
		                            					<td>${item.MEMBER_ID}</td>
		                            					<td>${item.NAME}</td>
		                            					<td>${item.ADDRESS_LOCAL}</td>
		                            					<td>${item.SCHOOL_NAME}</td>
		                            					<td>${item.SEX}</td>
	                            						<td><input id="member2_${status.index}" name="member2" type="radio" value="${item.MEMBER_ID}" class="radio_input"></td>
	                            					</tr>
			                                    </c:forEach>
	                            				
                            				</tbody>
                            			</table>
                           			</div>
                           			<div class="member_btn adm_btn_wrap mr-0">
	                            		<ul>
	                            			<li class="register modal_close" ><a href="#">취소</a></li>
	                            			<li class="register modal_upload" ><a href="javascript:memberCheck()">선택하기</a></li>
	                            		</ul>
	                            	</div>
                            	</div>
                            </div>
                            <!-- 매칭 모달 end-->
                            
                            
                        </div>
                    </section>
                    
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
</body></html>

<script type="text/javascript">
$(document).ready(function()
{
	
	
	 $("input:radio[name=TYPE]").click(function(){
	        if($("input[name=TYPE]:checked").val() == "1"){
	        	location.href='./insert.do?TYPE=1';
	        }else if($("input[name=TYPE]:checked").val() == "2"){
	        	location.href='./insert.do?TYPE=2';					
	        }
	        $("input[name=radio]:checked")
	    });
	 
	 
	 
	 $( "#GROUPLIST" ).change(function() {
		 $('#MEMBER_ID').val($(this).val());
		 
		 
	});
	 
	 
	 
});
function memberCheck()
{
	var memberId =  $("input[name=member2]:checked").val();
	 $('#MEMBER_ID').val(memberId);
	 $('#GROUPLIST').val(memberId);
	 selectAjax();
	 $(".matching_modal_wrap").fadeOut(300);
	 
}
function selectAjax()
{
	$.ajax({
		type : "GET",
		url : "./"+$('#MEMBER_ID').val()+'/insertAjax.do?LOCATION='+$('#ADDRESS_LOCAL').val(),
		cache : false,
		data : "",
		success: function(result)
		{
			$('#group_list_area').html(result);
		}
	});
}
	/*$("#YEAR").change(function() {

	    $.ajax({
			type : "GET",
			url : './getMemviewView.do?MEMBER_ID='+$(this).val(),
			cache : false,
			data : "",
			success: function(result)
			{
				$('#IDX').html(result);
			}
		});
	});
	*/
	function insertClick()
	{
		if($('#MEMBER_ID').val() == '')
		{
			alert('아이디를 입력 하여 주세요');
			return;
		}
		
		$('#updateform').submit();
	}
	
	function matching_modal(){
		$('#matching_table').DataTable({
			lengthChange: false,
			language: {
			    paginate: {
			      next: '<a href="#" class="next_btn"><i class="fas fa-chevron-right"></i></a>',
			      previous: '<a href="#" class="pre_btn"><i class="fas fa-chevron-left"></i></a>'  
			    }
			  }
		});
		
		$("#maching_btn").click(function(){
			$(".matching_modal_wrap").fadeIn(300);
		});
		
		$(".modal_close").click(function(){
			$(".matching_modal_wrap").fadeOut(300);
		});
	}
	matching_modal();
	
	
	
</script>