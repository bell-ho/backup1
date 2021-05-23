<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<!-- Page Content -->
<div class="container">

	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">${vo.name }</h1>
			<div class="list-group">
				<a href="/information/${vo.name }" class="list-group-item active">기본정보</a>
				<a href="/trip/${vo.name }" class="list-group-item">관광명소 보러가기</a> 
				<a href="/board/listTripBoard?title=${vo.name }" class="list-group-item">여행 후기 보러가기 </a>
				<a href="/photo/${vo.name }?pageNum=1&amount=16&keyword=" class="list-group-item">${vo.name } 갤러리</a>
				<a href="/" class="list-group-item">홈으로</a>
			</div>
		</div>
		
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">기본정보</h1>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">지역선택</a></li>
				<li class="breadcrumb-item active">${vo.name }</li>
			</ol>
			<div class="card mt-4">
			
				<img class="card-img-top img-fluid"
					src="${vo.img}"
					alt="">
				<div class="card-body">
					<h3 class="card-title">${vo.name } 지역</h3>
					<p class="card-text">${vo.info}</p>
				</div>
			</div>
			<!-- /.card -->

			<div class="card card-outline-secondary my-4">
				<div class="card-header">${vo.name }문화</div>
				<div class="card-body">
					<p>${vo.detail }</p>
				</div>
			</div>
			<!-- /.card -->
		</div>
		<!-- /.col-lg-9 -->
	</div>
</div>
<!-- /.container -->

<%@include file="includes/footer.jsp"%>