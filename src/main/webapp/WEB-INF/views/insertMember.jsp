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
.mailnum{
	display: none;
}
</style>
<script type="text/javascript">
var pwd = false
var mail = false
var id = false
var nickname = false
$(document).ready(function(){

	$("#memId").on("keyup",function(){
		$.ajax({url:"/ajax/getnickname" , type: "post", success:function(data){
			$("#idFrom").empty();
			$.each(data,function(idx,item){		
				if(item.memId == $("#memId").val()){
					$("#idFrom").empty();
					$("#idFrom").attr("class","text-danger");
					$("#idFrom").append("중복된 아이디입니다.");
				}
			})
		}})
	})
	
	$("#memNickname").on("keyup",function(){
		$.ajax({url:"/ajax/getnickname" , type: "post", success:function(data){
			$("#nicknameForm").empty();
			$.each(data,function(idx,item){		
				if(item.memNickname == $("#memNickname").val()){
					$("#nicknameForm").empty();
					$("#nicknameForm").attr("class","text-danger");
					$("#nicknameForm").append("중복된 닉네임입니다.");					
				}
			})
		}})
	})
	
	
	$("#PasswordCheck").on("keyup",function(){
		if($("#memPassword").val() != $("#PasswordCheck").val()){
			$("#PasswordCheckFrom").empty();
			$("#PasswordCheckFrom").attr("class","text-danger")
			$("#PasswordCheckFrom").append("비밀번호가 다릅니다.")
		}else{
			$("#PasswordCheckFrom").empty();
		}
	})
	
	/*$("#emailBtn").on("click",function(e){
		e.preventDefault();
		var mail = $("#memEmail").val();
		var memEmail = {"memEmail":mail};
		$("#emailBtn").attr("class","mailnum");
		if(mail != ''){
			$.ajax({url:"/ajax/email" ,type:"post" , data:memEmail ,success:function(result){
				alert("인증메일이 발송되었습니다.")
				$("#emailnumForm").attr("class","");
				$("#emailOk").on("click",function(){
					var num = $("#emailnum").val();
					if(num == result){
						alert("인증되었습니다.");
						$("#emailOk").attr("disabled",true);
						
					}else{
						alert("잘못된 인증번호 입니다.")
					}
				})
			}})
		}else{
			alert("메일을 입력해 주세요")
			$("#emailBtn").attr("class"," ");
		}
	})	*/

})
</script>
<!-- Page Content -->
<div class="container">
	<div>
		<div class="container">
			<div class="page-header">
				<div>
					<p></p>
					<h3 style="text-align: center;">MY TRIP 회원가입</h3>
				</div>
			</div>
			<div>
				<form id="insertForm" action="/insertMember"  method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="id">아이디 </label>
						<input type="text" class="form-control" name="memId" id="memId" placeholder="이름을 입력해 주세요" required="required">
						<div id="idFrom"></div>
					</div>

					<div class="form-group">
						<label for="Email">이메일 주소</label>
						<input type="email" class="form-control" name="memEmail"id="memEmail" placeholder="이메일 주소를 입력해주세요" required="required">
						
<%--						<button id="emailBtn">인증</button>--%>
						
						<%--<div id="emailnumForm" class="mailnum">
							<input type="number"  name="emailnum" id="emailnum" placeholder="인증번호" required="required">
							<button type="button" id="emailOk">인증</button>
						</div>--%>
					</div>

					<div class="form-group">
						<label for="Password">비밀번호</label> 
						<input type="password" class="form-control" name="memPassword" id="memPassword" placeholder="비밀번호를 입력해주세요" required="required">
					</div>
					<div class="form-group" >
						<label for="PasswordCheck">비밀번호 확인</label> 
						<input type="password" class="form-control" id="PasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" required="required">
						<div id="PasswordCheckFrom"></div>
					</div>
					<div class="form-group">
						<label for="name">닉네임</label> 
						<input type="text" class="form-control" name="memNickname" id="memNickname" placeholder="닉네임을 입력해 주세요" required="required">
						<div id="nicknameForm">
							
						</div>
					</div>
					<div>
						<label for="img">프로필 사진</label> <input id="file" type="file" name="file" multiple>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</div>

					<div class="form-group">
						<label>약관 동의</label>
						<div data-toggle="buttons">
							<textarea rows="3" cols="100%">약관동의서</textarea>
							에 동의합니다. <span class="fa fa-check"></span> 
							<input id="agree" type="checkbox" autocomplete="off" checked>
						</div>
					</div>
					<div class="form-group text-center">
						<input type="submit" id="submit" class="btn btn-primary" value="회원가입">
					</div>
				</form>
			</div>

		</div>
	</div>

</div>
