<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript"
            src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<%--    <link rel="shortcut icon" href="#">--%>
    <script type="text/javascript"
            src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
            charset="utf-8"></script>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MY TRIP</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/main/css/modern-business.css" rel="stylesheet">
    <style type="text/css">

    </style>
</head>

<body>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">MY TRIP</a>
        <button class="navbar-toggler navbar-toggler-right" type="button"
                data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/board/listFreeBoard">게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="/photoAll?pageNum=1&amount=16&keyword=">갤러리</a></li>

                <sec:authentication property="principal" var="pinfo"/>

                <sec:authorize access="isAnonymous()">
                    <!-- 익명이라면 -->
                    <li class="nav-item"><a id="login" class="nav-link" href="#">로그인</a></li>
                    <li class="nav-item"><a class="nav-link" href="/insertMember">회원가입</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <!-- 인증이 되었다면 -->
                    <li class="nav-item"><a id="mypage" class="nav-link" href="">마이페이지</a></li>
                    <li class="nav-item"><a id="logout" class="nav-link" href="">로그아웃</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                MY TRIP
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form class="form-signin" action="/login" method="post">
                        <h2 class="form-signin-heading" style='text-align: center;'>로
                            그 인</h2>
                        <label for="inputEmail" class="sr-only">아이디</label>
                        <input type="text" name="username" class="form-control" placeholder="아이디" required autofocus>
                        <label for="inputPassword" class="sr-only">비밀번호</label>
                        <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="warning">
                            <p></p>
                        </div>
                        <div class="checkbox">
                            <label> <input type="checkbox" value="remember-me">
                                아이디 기억하기
                            </label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" id="btnLogin"
                                type="submit">로그인
                        </button>
                        <p></p>
                        <div id="naverIdLogin"></div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="/insertMember" class="btn btn-primary">회원가입</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //로그인 클릭시 모달화면을 보여준다
        $("#login").on("click", function (e) {
            e.preventDefault();
            $("#loginModal").modal("show");
        })
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "EKiDjT4kUdP1IUtlpmKj",
            callbackUrl: "http://localhost:8080",
            isPopup: false, /* 팝업을 통한 연동처리 여부 */
            loginButton: {
                color: "green",
                type: 3,
                height: 40
            }
            /* 로그인 버튼의 타입을 지정 */
        });
        /* 설정정보를 초기화하고 연동을 준비 */
        naverLogin.init();
        //로그인화면 창 보여주기 끝
        $("#logout").on("click", function (e) {
            e.preventDefault();
            var form = $("<form></from>")
            form.attr("method", "post")
            form.attr("action", "/logout")
            form.append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />')
            $("body").append(form)
            form.submit();
        })

        $("#mypage").on("click", function (e) {
            e.preventDefault();
            var form = $("<form></from>")
            form.attr("method", "post")
            form.attr("action", "/mypage")
            form.append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />')
            $("body").append(form)
            form.submit();
        })

    })
</script>