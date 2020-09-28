<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 게시판</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>
	var pageNum = 1;
	var cntPerPage = 5;
	var searchArr = new Object();
	
	$(document).ready(function(){
		searchArr["pageNum"] = pageNum;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/braa/Braa1000_select.do", "get", searchArr, braaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/braa/Braa1000_select.do";
			
			searchArr = new Object();
			searchArr[$("#select").val()] = $("#searchText").val();
			searchArr["pageNum"] = 1;
			searchArr["cntPerPage"] = cntPerPage;
			
			ajaxComm(url, "get", searchArr, braaSelectCallback);			
		})
		
		$("#write").click(function(){
			//window.location.href = "<c:url value='/braa/Braa1000_write.do'/>";
			window.location.href = "Braa1000_write.do";
		})
	})

	function braaSelectCallback(result){
		$("#totalCnt").empty();
		$("#braaTable").empty();
		$("#braaTable").empty();
		
		$("#totalCnt").append("총 " + result.paging.total + " 게시글");
		var braaAppend = "<colgroup><col width='10%'><col width='35%'><col width='15%'><col width='*'></colgroup><tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>처리상태</th><th>공개여부</th></tr>";
		var stus = "";
		var click = "";
		
		$.each(result.braaList,function(index,item){
			switch(item.bordStus){
		    	case "S" :
		    		stus = "대기중";
		    		break;
		    	case "P" :
		    		stus = "처리중";
		    		break;
		    	case "C" :
		    		stus = "완료";
		    		break;
	   		};
	   		
		    braaAppend += "<tr><td>"+item.bordNo+"</td><td><a href='javascript:bordWrite(\""+item.bordNo+"\",\""+item.bordRelease+"\");'>"+item.bordNm+"</a>"
		    		   +"</td><td>"+item.userNm+"</td><td>"+item.modyDate+"</td><td>"+item.bordCnt+"</td><td>"+stus
		    		   +"</td><td>"+item.bordRelease+"</td></tr>";
		});
		
		$("#braaTable").append(braaAppend);

		//페이징 처리
		var paging = result.paging;
		pagingList("paging", paging.startPage, paging.endPage, paging.cntPerPage, paging.lastPage, "movePage");	
	}
	
	function movePage(num){
		searchArr["pageNum"] = num;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/braa/Braa1000_select.do","get", searchArr,braaSelectCallback);
	}
	
	function bordWrite(bordNum, bordRelease){	
		
		<%
		String name;
		name = (String)session.getAttribute("name");
		
		if(name != null){
		%>
		window.location.href = "Braa1000_adminPageCall.do?bordNum="+bordNum;
		<%}else{%>
		
		//비밀번호 입력
		if(bordRelease == "N"){ //비공개
			window.open("Braa1000_confirmPasswdWindow.do?bordNum="+bordNum,"","scrollbars=no,status=no,resizable=no,width=300,height=150,left="+ (window.screen.width-300)/2 +",top="+(window.screen.height-150)/2);		
		}else{
			checkAfterAction(bordNum);
		}
		<%}%>
	}
	
	function checkAfterAction(num){
		window.location.href = "Braa1000_detailSelect.do?bordNum="+num;
	}

	$(document).ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	$(document).ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	});
</script>
<div class="inner">
	<h2 class="" > 온라인 문의 </h2>
	<div style="margin-bottom:15px;">
		<select id="select"  class="form-control" style="width:100px;float:left;">
			<option value="bordNm">제목</option>
			<option value="userNm">이름</option>
			<option value="bordNo">번호</option>
		</select>
		<input  class="form-control-mid" type="text" id="searchText" style="float:left;margin-left:5px;"/>
		<button id="searchBtn" style="margin-left:10px;">검색</button>
		<span id="totalCnt" class="totalCnt"></span>
	</div>
	<div>
		<table id="braaTable" width="500" cellpadding="7" cellspacing="0" border="1" class="table">
		
		</table>
	</div>
	<div id="paging" class="paging">

	</div>
	<div>
		<%if(name == null) {%>
		<button id="write" style="float:right;">작성하기</button>
		<%} %>
	</div>
	<div class="clear-space"></div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>