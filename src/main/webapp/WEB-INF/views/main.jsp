<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="includes/header.jsp" %>
<style type="text/css">
    .card-img-top {
        height: 168.57px;
    }

    .mainimg {
        margin: 0 40px;
    }
</style>
<script type="text/javascript">
    if ("${result}" == "seccess") {
        alert("변경되었습니다");
    }
    if ("${result}" == "error") {
        alert("잘못된 비밀번호");
    }
</script>
<header>
    <div id="carouselExampleIndicators" class="carousel slide"
         data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0"
                class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">

        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators"
           role="button" data-slide="prev"> <span
                class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                class="sr-only">Previous</span>
        </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
                role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
    </a>
    </div>
</header>
<!-- Page Content -->
<div class="container">

    <h1 class="my-4">Welcome !!</h1>

    <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <p></p>
                <p></p>
                <a href="/board/listFreeBoard"><img class="card-img-top"
                                                    src="https://image.flaticon.com/icons/svg/1885/1885090.svg" alt=""></a>
                <div class="card-body">
                    <h4 class="card-title" style="text-align: center;">
                        <a href="/board/listFreeBoard">게시판</a>
                    </h4>
                    <p class="card-text" style="text-align: center;">게시판</p>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <p></p>
                <p></p>
                <a href="/photoAll?pageNum=1&amount=16&keyword="><img class="card-img-top"
                                                                      src="https://image.flaticon.com/icons/svg/856/856293.svg"
                                                                      alt=""></a>
                <div class="card-body">
                    <h4 class="card-title" style="text-align: center;">
                        <a href="/photoAll?pageNum=1&amount=16&keyword=">갤러리</a>
                    </h4>
                    <p class="card-text" style="text-align: center;">갤러리</p>
                </div>
            </div>
        </div>
        <c:forEach items="${list}" var="info">
            <div class="col-lg-4 col-sm-6 portfolio-item">
                <div class="card h-100">
                    <p></p>
                    <p></p>

                    <a href="#" class="mainimg"><img class="card-img-top" src="${info.mainimg }"></a>
                    <div class="card-body">
                        <h4 class="card-title" style="text-align: center;">
                            <a href="information/${info.name}">${info.name }</a>
                        </h4>
                        <p class="card-text" style="text-align: center;">${info.name }</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- /.row -->

    <!-- Features Section -->

    <!-- Call to Action Section -->

</div>
<!-- /.container -->
<!-- modal -->

<%@include file="includes/footer.jsp" %>
