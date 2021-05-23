<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<!-- Page Content -->
<style>
img{
	width: 328px;
	height: 257.14px;
}
#pagination{
	float: right;
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
function list(page) {
	$.ajax({
		url :'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?serviceKey'+
			'=HRtSF9l%2B9iDrX9QOfocSYjGRaMCKHOEwwQFTB9xyHjkyVWTjZw7%2FwOISNztL%2FPonOqC4nkA813iICxLfaAz1UA%3D%3D'+
			'&MobileApp=AppTest&MobileOS=ETC&pageNo='+page+'&numOfRows=4&listYN=Y&arrange=P&contentTypeId=12&'+
			'keyword=${key}&_type=json'
		 , 
	success:function(data){
		console.log(data);
		info = data.response.body.items.item
		count = data.response.body.totalCount //총수 나누니 보여줄 데이터수 = 보여질 총 페이지
		console.log("총 데이터 : "+count);
		console.log(count);
		
		$.each(info,function(idx,item){
			var str = '<div class="col-lg-6 mb-4">'
			str += '<div class="card h-100">'
			str += '<a href="/detail/${key}/'+item.contentid+'"><img class="card-img-top" src="'+item.firstimage+'"></a>'
			str += '<div class="card-body">'
			str += '<h5 class="card-title"><a href="/detail/${key}/'+item.contentid+'">'+item.title+'</a></h4>'
			str += '<p class="card-text"></div></div></div>'
			$("#info").append(str);
		})
		var dataPerPage = 4;    // 한 페이지에 나타낼 데이터 수
  		var pageCount = 5;		//	한 화면에 보여질 페이지수
		var totalPage = Math.ceil(count/4);    // 총 페이지 수
		var pageGroup = Math.ceil(page/5);    // 페이지 그룹
		var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage){
            last = totalPage;
        }
        console.log("last : "	+last);
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        if(first < 0){
			first = 1;
        }
        var next = last+1;
        var prev = first-1;
		var pingingView = $("#paging");
        
        var str = "";
        
        if(prev > 0)
            str += "<li class='page-item'><a class = 'page-link ' href=# id='prev'>Previous</a></li> ";
        
        for(var i=first; i < last; i++){
            if(i == page){
            	str += "<li class='page-item active'><a class = 'page-link ' href='#' id=" + i + ">" + i + "</a></li> ";
            }else{
            	str += "<li class='page-item'><a class = 'page-link ' href='#' id=" + i + ">" + i + "</a></li> ";
            }
        }
        
        if(last < totalPage)
            str += "<li class='page-item'><a class = 'page-link' href=# id='next'>Next</a></li>";

        $("#paging").html(str);    // 페이지 목록 생성
      	console.log(page);
		$("#paging a").click(function(){
            var item = $(this);
            var id = item.attr("id");
            var selectedPage = item.text();
            if(id == "next")    selectedPage = next;
            if(id == "prev")    selectedPage = prev;
            $("#info").empty();
            list(selectedPage);
        });
	}})
}
list(1)
})
</script>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
		<c:if test="${key eq '서울' }">
			<h1 class="my-4">${key }특별시</h1>
		</c:if>
		<c:if test="${key ne '서울' }">
			<h1 class="my-4">${key }도</h1>
		</c:if>
			<div class="list-group">
			<c:if test="${key ne '서울' }">
				<a href="/information/${key }도" class="list-group-item">기본정보</a>
			</c:if>
			<c:if test="${key eq '서울' }">
				<a href="/information/${key }특별시" class="list-group-item">기본정보</a>
			</c:if>
				<a href="/trip/${key }도" class="list-group-item active">관광명소 보러가기</a> 
				<a href="/board/listTripBoard/?title=${key }도" class="list-group-item">여행 후기 보러가기 </a>
				<a href="/photo/${key }?pageNum=1&amount=16&keyword=" class="list-group-item">${key }도 갤러리</a>
				<a href="/" class="list-group-item">홈으로</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">관광명소</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/main">지역선택</a></li>
				<c:if test="${key eq '서울' }">
				<li class="breadcrumb-item"><a href="/information/${key }특별시">${key }특별시</a></li>
				</c:if>
				<c:if test="${key ne '서울' }">
				<li class="breadcrumb-item"><a href="/information/${key }도">${key }도</a></li>
				</c:if>
				<li class="breadcrumb-item active">관광명소</li>
			</ol>
			<div class="row text-center text-lg-left" id='info'></div>
			<ul class="pagination justify-content-center" id="paging"></ul>
		</div>
	</div>
	<!-- /.col-lg-9 -->
</div>
<!-- /.container -->
<%@include file="includes/footer.jsp"%>-