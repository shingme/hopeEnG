<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온라인 문의목록</title>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
var temp = "";

	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		//var braaAppend = "";
		//$("#braaTable").append(braaAppend);
		ajaxComm("/braa/Braa1000_select.do","",braaSelectCallback);
	})
	
	function ajaxComm(url, data, callback){
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
	}

	function braaSelectCallback(result){
		var braaAppend = "";
		$.each(result.braaList,function(index,item){
		    braaAppend += "<tr><td>"+item.braaNo+"</td><td>"+item.braaNm+"</td><td>"+item.userNm
		    		   +"</td><td>"+item.modyDate+"</td><td>"+item.braaCnt+"</td><td>"+item.braaStus
		    		   +"</td></tr>";
		});
		$("#braaTable").append(braaAppend);
	}
</script>
   <table id="braaTable" width="500" cellpadding="7" cellspacing="0" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>처리상태</th>
		</tr>
	</table>
</body>
</html>