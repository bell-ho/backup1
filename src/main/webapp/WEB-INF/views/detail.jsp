<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<!-- Page Content -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var x;
	var y;
	$.ajax({url:"/ajax/${contentid}", type: 'POST'  ,success:function(data){
		x =$(data).find("mapx").text();
		y =$(data).find("mapy").text();
		title = $(data).find("title").html();
		$(".title").html(title);
		$("#photo").attr("href","/photo/${key }도?keyword="+title);
		$(".card-img-top").attr("src",$(data).find("firstimage").html())
		$("#addr").append($(data).find("addr1").html())
		$(".card-text").append($(data).find("overview").text())
		var homepage = $(data).find("homepage").text()
		var start = homepage.lastIndexOf("<");
		var end = (homepage.indexOf(">")+1)
		var a = homepage.substring(end,start)
		if(a !=''){
			$("#homepage").attr("href",a);
			$("#homepage").prepend($(data).find("title").text()+" ");
			$("#homepage").attr("target","_blank");
		}
		$("#moveBoard").attr("href","/board/listTripBoard?title="+$(data).find("title").text())
	}})
	
	
	$("#addr").on("click", function(e) {
			e.preventDefault();
			$("#komap").modal("show");
			$('#komap').on('shown.bs.modal', function (e) {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(y,x), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(y, x);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
			})
			
		})
})
</script>
<div class="container">

	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">${key}도</h1>
			<div class="list-group">
				<a href="/information/${key }도" class="list-group-item">기본정보</a> 
				<a href="/trip/${key }도" class="list-group-item active">관광명소 보러가기</a> 
					<a id='moveBoard' class="list-group-item">여행 후기 보러가기 </a> 
					<a href="/photo/${key }도?pageNum=1&amount=16&keyword=" class="list-group-item">${key}도 갤러리</a> 
					<a href="/" class="list-group-item">홈으로</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3 title" ></h1>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/main">지역선택</a></li>
				<li class="breadcrumb-item"><a href="/information">${key }도</a></li>
				<li class="breadcrumb-item "><a href="/trip">관광명소 보러가기</a></li>
				<li class="breadcrumb-item active"></li>
			</ol>
			<div class="card mb-4">
				<img class="card-img-top" alt="Card image cap">
				<div class="card-body">
					<h2 class="card-title title"></h2>
					<a href="#" id='addr'>주소 : </a>
					<p class="card-text">
					</p>
					
				</div>
				<div class="card-footer text-muted">
					<a id='homepage'>홈페이지로 이동</a>
				</div>
			</div>
		</div>
		<!-- /.col-lg-9 -->
	</div>
</div>
<div class="modal fade bs-example-modal-lg" id="komap" tabindex="-1" role="dialog" >
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				MY TRIP
			</div>
			<div class="modal-body">
				<div id="map" style="width:100%;height:600px;"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- /.container -->
<%@include file="includes/footer.jsp"%>