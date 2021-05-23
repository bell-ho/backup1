<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<style type="text/css">
img{
	min-height: 178px;
}
#ul{
	float: right;
}
#div{
	min-height: 761px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
		$("#ul a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	})
</script>
<!-- Page Content -->
<div class="container" id="div">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">${key }</h1>
			<div class="list-group">
				<a href="/information/${key }" class="list-group-item">기본정보</a> 
				<a href="/trip/${key }" class="list-group-item">관광명소 보러가기</a>
				<a href="/board/listTripBoard?title=${key }" class="list-group-item">여행 후기 보러가기 </a> 
				<a href="#" class="list-group-item active">${key } 갤러리</a> 
				<a href="/" class="list-group-item">홈으로</a>
			</div>
		</div>
		<!-- /.col-lg-3 -->
		<div class="col-lg-9">
			<h1 class="mt-4 mb-3">갤러리</h1>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/main">지역선택</a></li>
				<li class="breadcrumb-item"><a href="/information/${key }">${key }</a></li>
				<li class="breadcrumb-item active">갤러리</li>
			</ol>
			<div class="row text-center text-lg-left">

				<c:forEach items="${list }" var="item">
					<div class="col-lg-3 col-md-4 col-6">
					<a href="../board/get?boardNo=${item.boardNo}" class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail"
						src="${ item.fileName}" alt="">
					</a>
				</div>
				</c:forEach>
			</div>
			<ul class="pagination justify-content-center" id="ul">
				<c:if test="${pageMaker.prev }">
                     <li class="page-item">
                     <a class ="page-link" href="${pageMaker.startPage -1}">Previous</a>
                     </li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage }"
                     end="${pageMaker.endPage }">
                     
                     <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
                     <a class ="page-link" href="${num }">${num }</a>
                     </li>
<!--                      페이지 색칠 -->
                  </c:forEach>

                  <c:if test="${pageMaker.next }">
                     <li class="page-item">
                     <a class ="page-link"href="${pageMaker.endPage +1 }">Next</a></li>
                  </c:if>
			</ul>
			<form id='searchForm' action="/photo/${key }"  method="get">
				<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' /> 
				<input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum }">
				<input type='hidden' name='amount' value="${pageMaker.cri.amount }">
				
				<button class='btn btn-primary btn-sm'>검색</button>
			</form>
		</div>
	</div>
	<!-- /.col-lg-9 -->

</div>
<form id='actionForm' action="/photo/${key }" method="get">
	<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum }'>
	<input type="hidden" name='amount' value='${pageMaker.cri.amount }'>
	<input type="hidden" name='keyword' value = '<c:out value="${pageMaker.cri.keyword }"/>'>
</form>
<!-- /.container -->

<%@include file="includes/footer.jsp"%>