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
#memImgUpdate{
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
})
</script>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">메뉴</h1>
			<div class="list-group">
				<a href="/mypage"  id="mypageFrom" class="list-group-item">기본정보</a> 
				<a href="/memberUpdatePassword" class="list-group-item">비밀번호 변경 </a>
				<a href="/member/delete" class="list-group-item active">회원 탈퇴</a>
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
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<h2 class="card-title">회원탈퇴</h2>
					<hr>
					<form action="memberDelete" method="post">
					<h5>아이디 : ${member.memId }</h5>
					<hr>
					<h5>비밀번호 : <input type="password" name="memPassword"></h5>
					<hr>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input class="btn-xm btn-primary" type="submit" value="탈퇴">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- /.container -->

<%@include file="includes/footer.jsp"%>