<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>

<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	
function submitVal(val){
	
	var adminId = $("#adminId").val();
	var adminPw = $("#adminPw").val();
	
	if(adminId == ""){
		alert("아이디를 입력하세요");
		$("#adminId").focus();
		return;
	}
	
	if(adminPw == ""){
		alert("비밀번호를 입력하세요");
		$("#adminPw").focus();
		return;
	}
	
	var action = "/admin/loginCheck.do";
	$("#loginForm").attr("action", action).submit();
	
}
</script>


<div style="border: solid; position:absolute; width: 40%; height: 50%;">
	<form id="loginForm" name="loginForm" method="post">
		<div style="width: 100%; border: solid; float: left;">
			<input type="text" id="adminId" name="adminId" placeholder="아이디" style="width: 100%">
			<input type="password" id="adminPw" name="adminPw" placeholder="비밀번호"style="width: 100%">
		</div>
		
		<div style="width: 100%; border: solid; float: left;" >
			<button type="button" id="login" onclick="submitVal('login')">로그인</button>
		</div>
		<div>
			관리자 로그인 화면입니다.		
		</div>
	</form>
	
</div>

</body>
</html>