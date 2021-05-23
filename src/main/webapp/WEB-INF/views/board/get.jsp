<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
<!-- 설정 파일 -->
<style type="text/css">
    footer {
        bottom: 0;
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

    #main > .panel-body {
        margin: 15px;
    }

    #delete, #modify {
        float: right;
    }

    #Boarddelete, #Boardmodify {
        float: right;
        margin: 5px;
    }

    .reply {
        background-color: #80808036;
    }

    #user {
        margin-top: 3px;
        width: 32px;
        height: 32px;
        border-radius: 50%
    }

    .panel-body.insertreply {
        display: flex;
        padding: 1.5rem;
    }

    #addReplyBtn {
        background-color: #80808036;
        color: #b45f5f;
    }

    .replyRegdate {
        float: right;
    }

    #content {
        min-height: 492px;
    }

    img {
        max-width: 658px;
    }
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    function displayTime(timeValue) {
        var today = new Date();
        var gap = today.getTime() - timeValue;
        var dateObj = new Date(timeValue);
        var str = "";
        if (gap < (1000 * 60 * 60 * 24)) {
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();
            return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
        } else {
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth() + 1
            var dd = dateObj.getDate();
            return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
        }
    }

    //24시간이 지나면 계산을 통해 날자표현식으로 변경해준다
    $(document).ready(function () {
        var str;
        var showReply = function () {
            $.ajax({
                url: "/reply/" +${board.boardNo}, success: function (reply) {
                    $.each(reply, function (idx, item) {
                        str = '<li class="left clearfix">'
                        str += '<div class="header">'
                        if (item.memImg == null) {
                            str += "<img src='https://as2.ftcdn.net/jpg/02/34/61/79/500_F_234617921_p1AGQkGyEl8CSzwuUI74ljn6IZXqMUf2.jpg' id='user'>"
                        } else {
                            str += "<img src='" + item.memImg + "' id='user'>"
                        }

                        str += "<strong class='primary-font'>" + item.memNickname + "</strong>"
                        str += "<small class='pull-right text-muted'>&emsp;&emsp;&emsp;" + item.replyContent + "</small>"
                        str += "<string class='replyRegdate'>" + displayTime(item.replyDate)
                        str += '<sec:authorize access="isAuthenticated()">'

                        if ("<sec:authentication property="principal.username"/>" == '${board.memId}' || "<sec:authentication property="principal.username"/>" == item.memId) {
                            str += "<br><samll class = 'text-muted'>"
                            str += "<form id='replyform' action='../reply/${board.boardNo}/" + item.ReplyNO + "' name=" + item.ReplyNO + " >&emsp;"
                            str += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />"
                            str += "<button class='btn btn-sm' type='submit' id='delete'>삭제</button>"

                        }
                        if ("<sec:authentication property="principal.username"/>" == item.memId) {
                            str += "<button class='btn btn-sm' id='update'>수정</button>"
                        }

                        str += '</sec:authorize>'
                        str += '</samll></form></string>'
                        str += '</div></li>'
                        $("#chat").append(str);

                        $(document).on("click", "#delete", function (e) {
                            e.preventDefault();
                            $(this).parent().attr("method", "post").submit();
                        })

                    })
                }
            })
            $(document).on("click", "#update", function (e) {
                e.preventDefault();
                var ReplyNO = $(this).parent().attr("name");
                $.ajax({
                    url: "../reply/${board.boardNo}/" + ReplyNO, success: function (reply) {
                        console.log(reply);
                        $("#replyUpdateText").val(reply.replyContent);
                        $('input[name=ReplyNO]').attr("value", ReplyNO);
                        $("#replyModfiy").modal("show");

                        $("#btnupdate").click(function () {
                            $("#replyUpdate").submit();
                        })
                    }
                })
            })
        }
        showReply();
    })
</script>
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <h1 class="my-4">게시판</h1>
            <div class="list-group">
                <a href="/" class="list-group-item ">홈</a>
                <a href="/board/listFreeBoard" class="list-group-item">자유게시판</a>
                <a href="/board/listTripBoard?title=" class="list-group-item">후기게시판</a>
                <a href="/photoAll?pageNum=1&amount=16&keyword=" class="list-group-item">갤러리 </a>
            </div>
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-lg-9">
            <br>
            <div class="panel panel-default" id="main">
                <div class="panel-body">
                    <h2 id='title'>
                        <c:out value="${board.boardTitle}"/>
                        <sec:authentication property="principal" var="pinfo"/>
                        <sec:authorize access="isAuthenticated()">

                            <c:if test="${board.memId eq pinfo.username }">
                                <a id="Boarddelete" class="btn btn-sm btn-primary"
                                   href="/board/removeBoard?boardNo=${board.boardNo }&boardKinds=${board.boardKinds}">삭제</a>
                                <a class="btn btn-sm btn-primary" id="Boardmodify"
                                   href="/board/modifyBoard?boardNo=${board.boardNo }&boardKinds=${board.boardKinds}">수정</a>
                            </c:if>

                        </sec:authorize>
                    </h2>
                    <label>작성자 : <c:out value="${board.memNickname}"/>
                        <label>조회수 : <c:out value="${board.boardHit}"/></label>
                    </label>
                    <label style="float: right;">작성일 : <fmt:formatDate pattern="yyyy-MM-dd"
                                                                       value="${board.boardRegdate }"/></label> <br>
                    <hr>
                    <div class="form-group">
                        <div id="content">${board.boardContent }</div>
                    </div>
                    <div class="panel panel-default reply">
                        <div class="col-lg-12">
                            <div class='panel-heading'>
                                <ul class="chat" id='chat'>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body insertreply">
                            <form action="../reply/insert" method="post">
                                <input type="hidden" name='boardNo' value='<c:out value="${board.boardNo }"></c:out>'>
                                <input id="memId" type="hidden" value='pinfo.username'>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <textarea rows="2" cols="100%" class="form" name='replyContent'></textarea>
                                <sec:authorize access="isAuthenticated()">
                                    <button id='addReplyBtn' class='btn btn-primary'>등록</button>
                                </sec:authorize>
                            </form>
                        </div>
                        <div class="panel-footer"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.col-lg-9 -->
<!-- /.container -->
<div class="modal fade" id="replyModfiy" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                댓글 수정
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form id="replyUpdate" class="form-signin" method="post" action="/reply/${board.boardNo }/update">
                        <input type="hidden" name="ReplyNO">
                        <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
                        <textarea id="replyUpdateText" name="replyContent" rows="3" cols="60%"></textarea>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnupdate" class="btn btn-primary">수정</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../includes/footer.jsp" %>