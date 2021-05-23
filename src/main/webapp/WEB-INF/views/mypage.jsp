<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<!-- Page Content -->
<style type="text/css">
.box {
	width: 300px;
	height: 300px;
	border-radius: 70%;
	overflow: hidden;
	text-align: center;
	margin: 0 auto;
}

.profile {
	height: 100%;
	object-fit: cover;
}
#memImgUpdate ,#nicknameUpdate ,#emailUpdate{
	float: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#mypageFrom").on("click",function(e){
		e.preventDefault();
		var form = $("<form></from>")
		form.attr("method","post")
		form.attr("action","/mypage")
		form.append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />')
		$("body").append(form)
		form.submit();
	})
	$("#nicknameUpdate").on("click",function(){
		var reuslt = 0;
		$("#header").empty();
		$("#body").empty();
		$("#header").append("<h2>닉네임 변경</h2>")
		$("#body").append('<label class="control-label">닉네임</label>');
		$("#body").append('<input type="text" class="form-control" name ="memNickname" id="memNickname" value="${member.memNickname }" />');
		$("#body").append('<label class="control-label">비밀번호</label>');
		$("#body").append('<input type="text" class="form-control" name="memPassword" />');
		$("#body").append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />');
		$("#body").append('<input type="hidden" name="memEmail" value="${member.memEmail}" />');
		$("#body").append('<input type="hidden" name="memId" value="${member.memId }" />');
		$("#update").modal("show");
	})
	
	$("#updatebtn").on("click",function(e){
		var result = "success";
		e.preventDefault();
		$.ajax({url:"/ajax/getnickname" , type: "post", success:function(data){
			$.each(data,function(idx,item){		
				if(item.memNickname == $("#memNickname").val()){
					result="error";
					alert("중복된 닉네임")
				}
			})
			if(result == "success"){
				$("#modalForm").submit();
			}
		}})
	})
	
	$("#emailUpdate").on("click",function(e){
		e.preventDefault();
		$("#header").empty();
		$("#body").empty();
		$("#header").append("<h2>이메일 변경</h2>")
		$("#body").append('<label class="control-label">이메일</label>');
		$("#body").append('<input type="email" class="form-control" name ="memEmail" id="memEmail" value="${member.memEmail }" />');
		$("#body").append('<label class="control-label">비밀번호</label>');
		$("#body").append('<input type="text" class="form-control" name="memPassword" />');
		$("#body").append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />');
		$("#body").append('<input type="hidden" name="memNickname" value="${member.memNickname}" />');
		$("#body").append('<input type="hidden" name="memId" value="${member.memId }" />');
		$("#update").modal("show");
		$("#updatebtn").on("click",function(e){
			$("#modalForm").submit();
		})
		
	})
	
	
	
		
})
</script>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">메뉴</h1>
			<div class="list-group">
				<a href="/mypage" id="mypageFrom" class="list-group-item active">기본정보</a> 
				<a href="/memberUpdatePassword" class="list-group-item">비밀번호 변경 </a>
				<a href="/memberDelete" class="list-group-item ">회원 탈퇴</a>
				<a href="/"	class="list-group-item">홈으로</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">마이페이지</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/main">홈</a></li>
				<li class="breadcrumb-item active">마이페이지</li>
			</ol>
			<div class="box" style="background: #BDBDBD;">
				<img class="profile" src="${member.memImg }">
			</div>
			<div>
				<form action="" method="post">
					
				</form>
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<h2 class="card-title">기본정보</h2>
					<hr>
					<h5>아이디 : ${member.memId }</h5>
					<hr>
					<h5>닉네임 : ${member.memNickname } <button class="btn btn-primary" id="nicknameUpdate">변경</button></h5>
					<hr>
					<h5>이메일 : ${member.memEmail } <button class="btn btn-primary" id="emailUpdate">변경</button></h5>
					<hr>

					<form action="/memImgupdate" method="post" enctype="multipart/form-data">
						<h5>프로필 사진 변경 : <input name="file" type="file" multiple>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="memId" value="${member.memId}" />
						<input id="memImgUpdate" class="btn btn-primary" type="submit" value="변경"></h5>
					</form>
					
					<hr>
					<p class="card-text">
						
					</p>
					<a href="/board/listTripBoard?title=${member.memNickname }" class="btn btn-primary btn-sm">나의 여행 후기 글보기</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade bs-example-modal-lg" id="update" tabindex="-1" role="dialog" >
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header" id="header">
				
			</div>
			<form id="modalForm" action="/memupdate" method="post">
				<div class="modal-body" id="body">
				</div>
				<div class="modal-footer">
					<button id="updatebtn" type="submit" class="btn btn-primary" data-dismiss="modal">변경</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /.container -->

<%@include file="includes/footer.jsp"%>