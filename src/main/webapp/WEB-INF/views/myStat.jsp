<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="includes/header.jsp" %>
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

    #memImgUpdate, #nicknameUpdate, #emailUpdate {
        float: right;
    }
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

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
                <a href="/" class="list-group-item">홈으로</a>
                <a href="/myStat" class="list-group-item">내 통계</a>
            </div>
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-lg-9">
            <h1 class="mt-4 mb-3">마이페이지</h1>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/main">홈</a></li>
                <li class="breadcrumb-item active">마이페이지</li>
            </ol>
                <form action="" method="post">

                </form>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <table class="table table-bordered table-hover" style="height: 100%; width: 100%;">
                        <thead>
                        <tr>
                            <th>아이디</th>
                            <th>총 내가 쓴 글 갯수</th>
                            <th>총 내가 쓴 댓글 갯수</th>
                            <th>총 조회수</th>
                            <th>최다 조회수</th>
                            <th>최다 조회수 글 번호</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${stat}" var="list">
                            <tr>
                                <td>${list.memId}</td>
                                <td>${list.totNumBoard}</td>
                                <td>${list.totNumReply}</td>
                                <td>${list.totBoardHit}</td>
                                <td>${list.maxBoardHit}</td>
                                <td>${list.maxBoardHitNum}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="update" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" id="header">

            </div>

        </div>
    </div>
</div>
<!-- /.container -->

<%@include file="includes/footer.jsp" %>