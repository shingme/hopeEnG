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
	$(document).ready(function(){ 
		
		
		$("#LoginBtn").click(function(){
			
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

			var adminData = {
					adminId : $('#adminId').val(),
					adminPw : $('#adminPw').val()
			};
			alert("3");
			ajaxComm("/admin/loginCheck.do", adminData, adminLoginCallback);
			
	})
			
	//공통 js만들면 제거 
	function ajaxComm(url, adminData, callback){
		$.ajax({
			url  	    : url,
			type 	    : "POST",
			data 	    : adminData,
			dataType    :"json",
			contentType :"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
	}
			
			
			
	function adminLoginCallback(result){
		
		alert("result : " + result );
		
		var stus = "";
		var click = "";
		
	
	   	
		
		$("#braaTable").append(braaAppend);
	}
	
	
})
	

	
	
</script>




<div style="border: solid; position:absolute; width: 40%; height: 50%;">

	<form id="loginForm" name="loginForm" action="/admin/adminLogin" enctype="multipart/form-data" method="post" onsubmit="return false;">
		<div style="width: 60%; border: solid; float: left;">
			<input type="text" id="adminId" placeholder="아이디" style="width: 100%">
			<input type="password" id="adminPw" placeholder="비밀번호"style="width: 100%">
		</div>
		
		<div style="width: 25%; border: solid; float: left;" >
			<input type="submit"  id="LoginBtn" value="로그인">
		</div>
	</form>
</div>

</body>
</html>