<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/18.0.0/classic/ckeditor.js"></script>
<style type="text/css">
footer {
	bottom: 0;
	position: absolute;
	width: 100%;
	height: 100px;
}
</style>
<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">               </h1>
			<div class="list-group">
				<a href="/" class="list-group-item">홈으로</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">게시글 수정</h1>
		
			<form id="form" action="/board/modifyBoard" method="post">
			
				게시판 <select name="boardKinds">
				<option value="1">자유게시판</option>
				<option value="0">후기게시판</option>
				</select><br><br>
				<input type="hidden" name="boardNo" value="${board.boardNo }">
				<input type="text" name="boardTitle"  placeholder="제목을 입력해 주세요."
				 style="width:100%;" value="<c:out value="${board.boardTitle}" />"><br><br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<textarea id="content" placeholder="내용을 입력해 주세요." name="boardContent" rows="18" cols="100%"
				style="width:100%"; ><c:out value="${board.boardContent}"/></textarea><br>
				<input id="savebutton" type="submit" value="확인">
				
			</form>
		</div>
	</div>
	<!-- /.col-lg-9 -->

</div>

</div>
<!-- /.container -->
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "content",
        sSkinURI: "../resources/editor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#form").submit();
    })
})

</script>

<%@include file="../includes/footer.jsp"%>
