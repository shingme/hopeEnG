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
	var cntPerPage = 5;
	var searchArr = new Object();
	
	$(document).ready(function(){ //메인에서 클릭해서 들어오면 서버에서 무조건 5개 가지고 옴
		searchArr["pageNum"] = pageNum;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/glaa/Glaa1000_select.do";
			var searchArr = new Object();
			searchArr[$("#select").val()] = $("#searchText").val();

			ajaxComm(url, searchArr, glaaSelectCallback);			
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
		$("#glaaTable").empty();
		
		$("#totalCnt").append("총 "+result.paging.total+" 게시글");
		
		var glaaAppend = "";
		var stus = "";
		var click = "";
		
		$.each(result.glaaList,function(index,item){
			
			
			glaaAppend += "<li class='gallyLi'>"
					//+"<td>"+ item.gllyNm +"</td>"
					<%if(name != null){%>
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");'>"
					<%}else{%>
					+"<div class='user'>"
					<%}%>
					+"<div class='minidimm'>"
					//+ "<img src=\"<spring:url value='/glly/"+item.firstFilePath.substr(14)+"'/>\"/>"
					+ "<img src=\"<spring:url value='/glly/c5ceffcd1cf9438e929df7fb2328ce0f.jpg'/>\"/>"
					+"</div>"
					+"<p class='txtWrap'>"
					+"<span class='tit'>"+item.gllyNm+"</span>"
					+"<span class='pdate'>"+item.regiDate+"</span>"
					+"<span class='sub'>"+item.gllyCts+"</span>"
					//+"<span class='sub'>2020년 1월 14일 서울 건설공제조합에서 2020년 상반기 KICK-OFF 행사를 진행했습니다.2019년 실적 및 이슈를 되짚어 봤으며, …</span>"
					+"</p>"
					<%if(name != null){%>
					+"</a>"
					+"<a href='javascript:gllyDetail(\""+item.gllyNo+"\");' class='mask' style='display:none;'></a>"
					<%}else{%>
					+"</div>"
					<%}%>
					+"</li>"

		});
			
		$(".gallyList").append(glaaAppend);
		
		$('.gallyLi > a').mouseenter(function(){
			console.log("asasdd");
			$(this).parent().find('.mask').show();
		});
		$('.gallyLi > a').mouseleave(function(){
			console.log("asasdd");
			$(this).parent().find('.mask').hide();
		});
		
		//페이징 처리
		var paging ="";
		$("#paging").empty();
		
		$("#paging").append("<ul>");
		if(result.paging.startPage > 1){
			$("#paging > ul").prepend("<li><a class='move prev' href='javascript:movePage("+((result.paging.startPage-1)*result.paging.cntPerPage)+")'>이전</a></li>");
			$("#paging > ul").prepend("<li><a class='move first' href='javascript:movePage(1)'>처음</a></li>");
		}
		for(var i=((result.paging.startPage-1)*result.paging.cntPerPage)+1; i<=result.paging.endPage; i++){
			paging += "<li><a href='javascript:movePage("+i+")'>"+i+"</a></li>";
			pageNum = i;
		}
		$("#paging ul").append(paging);
		if(result.paging.endPage < result.paging.lastPage){
			$("#paging > ul").append("<li><a class='move next' href='javascript:movePage("+(result.paging.endPage+1)+")'>다음</a></li>");
			$("#paging > ul").append("<li><a class='move end' href='javascript:movePage("+(result.paging.lastPage)+")'>끝</a></li>");
		}
		$("#paging").append("</ul>");
		
	}
	function movePage(num){
		searchArr["pageNum"] = num;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/glaa/Glaa1000_select.do",searchArr,glaaSelectCallback);
	}

	
	function bordWrite(bordNum, bordRelease){		
		window.location.href = "Glaa1000_detailSelect.do?bordNum="+bordNum;
	}
	
	function ajaxComm(url, data, callback){
		$.ajax({
			url:url,
			type:"get",
			data:data,
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success:callback,
			error:function(xhr, status, error){
				console.log(xhr+"\n"+status+"\n"+error);
			}
		});
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
			<option value="bordNm">제목</option>
			<option value="userNm">이름</option>
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
			<ul class="gallyList">
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