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
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		
		//ajaxComm("/admin/adminLogin.do","", adminLoginCallback);
		
		$("#LoginBtn").click(function(){
			alert("클릭");
			
			var adminId = $("#AdminId").val();
			var adminPw = $("#AdminPw").val();
			
			if(adminId == ""){
				alert("아이디를 입력하세요");
				$("#AdminId").focus();
				return;
			}
			
			if(adminPw == ""){
				alert("비밀번호를 입력하세요");
				$("#AdminPw").focus();
				return;
			}
			
		})
	})
	
	
	
	function adminLoginCallback(result){
		$("#braaTable").empty();
		
		
		
		
		
	}
	
	
</script>




<div style="border: solid; position:absolute; width: 40%; height: 50%;">

	<div style="width: 60%; border: solid; float: left;">
		<input type="text" id="AdminId" placeholder="아이디" style="width: 100%">
		<input type="password" id="AdminPw" placeholder="비밀번호"style="width: 100%">
	</div>
	
	<div style="width: 25%; border: solid; float: left;" >
		<input type="submit"  id="LoginBtn" value="로그인">
	</div>
</div>

</body>
</html>