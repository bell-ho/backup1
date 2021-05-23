<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<style type="text/css">
footer {
	bottom: 0;
	position: absolute;
	width: 100%;
	height: 100px;
}

.chat, .timeline {
	list-style: none
}

.chat-panel .panel-body {
	height: 350px;
	overflow-y: scroll;
}

.chat {
	margin: 0;
	padding: 0;
	list-style: none;
}

.chat li {
	margin-bottom: 10px;
	padding-bottom: 5px;
	border-bottom: 1px dotted #999999;
}

.chat li.left .chat-body {
	margin-left: 60px;
}

.chat li.right .chat-body {
	margin-right: 60px;
}

.chat li .chat-body p {
	margin: 0;
}

.chat-panel .panel-body {
	height: 350px;
	overflow-y: scroll;
}

#main {
	border: 1px solid black;
}

#main>.panel-body {
	margin: 15px;
}
#delete {
	float: right;
	 margin-right:5px;
}
#modify ,#delete {
	float: right;
}
.reply{
	background-color: #80808036;
}
#user{
	margin-top :3px;
	width: 32px;
    height: 32px;
    border-radius: 50%
}
.panel-body.insertreply{
display:flex;
padding:1.5rem;
}
#addReplyBtn{
background-color:  #80808036;
color: black;
}
</style>
<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">메뉴</h1>
			<div class="list-group">
				<a href="/main" class="list-group-item ">홈</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">로그인</h1>
			<div>
				<form action="/login" method="post">
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"></td>
					<td><button type="submit">로그인</button></td>
				</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /.col-lg-9 -->
<!-- /.container -->

<%@include file="includes/footer.jsp"%>