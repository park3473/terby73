<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!--삭제금지-->
<div>
<c:if test="${session_login == 'ok'}">로그인 온</c:if>
<p>${session_email}</p>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    // ckeditor setting
    var ckeditor_config = {
        allowedContent : true,
        resize_enabled : false, // 에디터 크기를 조절하지 않음
        enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
        shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
        toolbarCanCollapse : true,
        removePlugins : "elementspath", // DOM 출력하지 않음                        
        filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
        height : '500px',
        // 에디터에 사용할 기능들 정의
        toolbar : [
            [  'Source','NewPage', 'Preview' ],
            [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ],
            ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], '/',
            ['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
            ['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
            [ 'About' ] ]
    };

    var editor = null;

    jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("ckeditor", ckeditor_config);
    });

    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;

        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
    CKEDITOR.replace('editor1',{
    	contentsCss: '${pageContext.request.contextPath}/ckeditor/test.css'
    });
    //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';
</script>
<!--공통상단-->
<%@ include file="../include/header.jsp" %>
<!--공통상단 끝-->

<style>
    a {
        color: #ffffff !important;
        text-decoration: none !important;
    }
    .test_div > .test_p{
    	display:none;
    }
    #detail_show > .test_p{
    	display:block;
    }

</style>
	<div>
		<p>hello</p>
		<ul>
		<c:forEach var="i" begin="1" end="${model.Pagecount}" varStatus="count">
	    	<li onclick="javascript:content(${count.index})">${count.index}</li>
		</c:forEach>
			<li><button onclick="javascript:PageUp()">페이지 추가 버튼</button></li>
		</ul>
		<ul style="display:none">
			<li>${model.list[0].P_IDX }</li>
			<li id="N_IDX" value="${model.list[0].N_IDX }">${model.list[0].N_IDX }</li>
			<li id="CONTENT" content="${model.list[0].CONTENT }">${model.list[0].CONTENT }</li>
		</ul>
		<div>
		<div id="cke">
				<div><button id="insert_bt" onclick="javascript:content_insert()" P_IDX="1">저장</button></div>
				<textarea name="CONTENT" id="ckeditor">
					<!-- 콘텐츠 보이는곳 -->
					${model.list[0].CONTENT }
				</textarea>
			</div>
		</div>
		<div>
			<c:forEach var="colist" items="${model.colist}" varStatus="var">
				<p>${colist.N_IDX }</p>
				<p>${colist.IDX }</p>
				<p>${colist.NAME }</p>
				<p>${colist.CONTENT }</p>
			</c:forEach>
		</div>
		<div>
			<p>내정보</p>
			<p>${session_idx }</p>
			<p>${session_name }</p>
		</div>
	</div>
<!--공통하단-->
<%@ include file="../include/footer.jsp" %>
<!--공통하단 끝-->
<!-- js 시작 -->
<script type="text/javascript">
/*
alert('${ip_session}');
if('${check}' == 'fail'){
	alert("실패");
}else{
	alert("성공")
}
*/
	function content(P_IDX){
		var N_IDX = $('#N_IDX').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail.do?",
			cache : false,
			data : ({
				P_IDX : P_IDX,
				N_IDX : N_IDX
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(data);
				var view = data[0].CONTENT;
				//alert(view);
				var editor = CKEDITOR.instances.ckeditor;
				editor.setData(view);
				$('#insert_bt').attr('P_IDX',P_IDX);
				}
		})
	};
	
	function content_insert(){
		var editor = CKEDITOR.instances.ckeditor;
		var CONTENT = editor.getData();
		var P_IDX = $('#insert_bt').attr('P_IDX');
		var N_IDX = $('#N_IDX').val();
		$.ajax({
			type : "POST",
			url : "/user/note/detail_update.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT,
				N_IDX : N_IDX,
				P_IDX : P_IDX,
			}),
			dataType : "json",
			success: function(data , status, xhr){
				console.log(status);
				console.log(data);
			}
		})
		//alert('수정 완료!');
	}
	
	function PageUp(){
		var P_IDX = ${model.Pagecount + 1};
		var N_IDX = $('#N_IDX').val();
		var CONTENT = '';
		$.ajax({
			type : "POST",
			url : "/user/note/detail_insert.do?",
			cache : false,
			data : ({
				CONTENT : CONTENT,
				N_IDX : N_IDX,
				P_IDX : P_IDX,
			}),
			dataType : "json",
			success: function(data , status, xhr){
			}
		})
		location.reload();
	}
	

$(window).load(function(){
	
	jQuery(function() {
        // ckeditor 적용
        editor = CKEDITOR.replace("ckeditor", ckeditor_config);   
    });
});
</script>
<!-- js 끝 -->