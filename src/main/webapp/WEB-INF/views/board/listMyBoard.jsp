<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style type="text/css">
#example_filter {
	float: left;
	margin-right: 10px;
	margin-top: 2px;
}

#example_paginate {
	float: right;
}

.dataTables_info {;
	margin-top: 10px;
}

#example_length {
	margin-left: 10px;
	margin-top: 10px;
}
#registerBoard{
	float:right;
}
</style>
<!-- Page Content -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	
<script>
var lang_kor = {
        "decimal" : "",
        "emptyTable" : "",
        "info" : " _TOTAL_개의글이있습니다.",
        "infoEmpty" : "0건",
        "infoFiltered" : "",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };
    
$(document).ready(function($) {

    var table = $('#example').DataTable({
    	language : lang_kor ,
    	"scrollCollapse": true ,
    	"dom" : '<"top"l>rt<"bottom"fpi>',
    	order:  [[0,'desc']]
        });
        $("#example_length").append($("<a href='/board/registerBoard' id='registerBoard' >새글작성</a>"));
        $("#example_length").append("개씩 보기");
} );

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글" + parseInt(result) + "번이 등록되었습니다");
		}
		$("#myModal").modal("show");

	}
})

</script>


<style type="text/css">
</style>
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h1 class="my-4">자유 게시판</h1>
			<div class="list-group">
					<a href="/" class="list-group-item">홈으로</a>
				<a href="/board/listFreeBoard" class="list-group-item active">자유게시판</a> 
				<a href="/board/listTripBoard?title=" class="list-group-item">후기게시판</a> 
				<a href="/photoAll?pageNum=1&amount=16&keyword=" class="list-group-item">갤러리</a> 
			</div>
		</div>
		<div class="col-lg-9">
			<br> <br> <br> <br>
			
			<table id="example" class="table table-bordered table-hover"
				style="height: 100%; width: 100%;">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th style="display:none;">내용</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr>
							 <td>${board.boardNo }</td>
		                     <td>
			                     <a href="get?boardNo=${board.boardNo }">${board.boardTitle }</a>
			                     <b>[<c:out value="${board.boardReplycnt }"/>]</b>
		                     </td>
		                      <td style="display:none;">${board.boardContent }</td>
		                     <td>${board.memNickname}</td>
		                     <td>${board.boardHit}</td>
		                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.boardRegdate }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- col-lg-9 end -->
	</div>
	<!-- row end -->
</div>
<script type="text/javascript">
	
</script>
<!-- /.container -->

<!-- modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>

			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal content -->
	</div>
	<!-- /.modal dialog -->
</div>
<!-- /.modal -->
<%@include file="../includes/footer.jsp"%>