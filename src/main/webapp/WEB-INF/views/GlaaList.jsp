<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 게시판</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

</head>
<body>
<H1>갤러리</H1>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<%
		String name;
		name = (String)session.getAttribute("name");
	%>
<script>
	var pageNum = 1;
	var cntPerPage = 6;
	var searchArr = new Object();
	
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 6개 가지고 옴
		searchArr["pageNum"] = pageNum;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/glaa/Glaa1000_select.do", "get", searchArr, glaaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/glaa/Glaa1000_select.do";
			var searchArr = new Object();
			
			searchArr["pageNum"] = 1;
			searchArr["cntPerPage"] = cntPerPage;
			searchArr[$("#select").val()] = $("#searchText").val();

			ajaxComm(url, "get", searchArr, glaaSelectCallback);			
		})
		$("#write").click(function(){
			window.location.href = "/glaa/uploadForm.do";
		})
		
	})

	function gllyDetail(gllyNo){

		location.href="/glaa/Glaa1000_moveDetailPage.do?gllyNo="+gllyNo;
	}

	function glaaSelectCallback(result){
		$("#totalCnt").empty();
		$("#gallyList").empty();
		
		$("#totalCnt").append("총 "+result.paging.total+" 게시글");
		
		var glaaAppend = "";
		var stus = "";
		var click = "";
		
		$.each(result.glaaList,function(index,item){
			
			
			glaaAppend += "<li class='gallyLi'>"
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");'>"
					+"<div class='minidimm'>"
					+ "<img src=\"<spring:url value='/glly/"+item.firstFilePath+"'/>\"/>"
					+"</div>"
					+"<p class='txtWrap'>"
					+"<span class='tit'>"+item.gllyNm+"</span>"
					+"<span class='pdate'>"+item.regiDate+"</span>"
					+"<span class='sub'>"+item.gllyCts+"</span>"
					+"</p>"
					+"</a>"
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");' class='mask' style='display:none;'></a>"
					+"</li>"

		});
			
		$(".gallyList").append(glaaAppend);
		
		$('.gallyLi > a').mouseenter(function(){
			$(this).parent().find('.mask').show();
		});
		$('.gallyLi > a').mouseleave(function(){
			$(this).parent().find('.mask').hide();
		});
		
		//페이징 처리
		var paging = result.paging;
		pageNum = pagingList("paging", paging.startPage, paging.endPage, paging.cntPerPage, paging.lastPage);
	}
	
	function movePage(num){
		searchArr["pageNum"] = num;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/glaa/Glaa1000_select.do", "get", searchArr, glaaSelectCallback);
	}
	
	function bordWrite(bordNum, bordRelease){		
		window.location.href = "Glaa1000_detailSelect.do?bordNum="+bordNum;
	}
	
	$(document).ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	$(document).ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	});
</script>



<div class="inner">
<h2 class="" > 갤러리</h2>
	<div style="margin-bottom:15px;">
		<select id="select" class="form-control" style="width:100px;float:left;">
			<option value="glNm">제목</option>
			<option value="glCts">내용</option>
		</select>
		<input class="form-control-mid" type="text" id="searchText" style="float:left;margin-left:5px;"/>
		<button id="searchBtn" style="margin-left:10px;">검색</button>
		<div>
		<%if(name != null){ %>
		<button id="write" style="float:right;margin-right:4%;">작성하기</button>
		<%} %>
	</div>
	</div>
	<div>
		<!-- <table class="table" id="glaaTable" width="500" cellpadding="7" cellspacing="0" border="1">
		</table> -->
		<section>
			<ul id = "gallyList" class="gallyList">
			</ul>
		</section>
	</div>
	<div id="paging" class="paging">

	</div>
	<div class="clear-space"></div>
	
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>