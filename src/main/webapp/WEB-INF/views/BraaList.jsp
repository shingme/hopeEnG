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
		
		ajaxComm("/braa/Braa1000_select.do", searchArr, braaSelectCallback);
		
		$("#searchBtn").click(function(){
			var url = "/braa/Braa1000_select.do";
			
			searchArr = new Object();
			searchArr[$("#select").val()] = $("#searchText").val();
			searchArr["pageNum"] = 1;
			searchArr["cntPerPage"] = cntPerPage;
			
			ajaxComm(url, searchArr, braaSelectCallback);			
		})
		
		$("#write").click(function(){
			window.location.href = "Braa1000_write.do";
		})
	})

	function braaSelectCallback(result){
		$("#totalCnt").empty();
		$("#braaTable").empty();
		$("#braaTable").empty();
		
		$("#totalCnt").append("총" + result.paging.total + "게시글");
		var braaAppend = "<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th><th>처리상태</th><th>공개여부</th></tr>";
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
		var paging = "";
		$("#paging").empty();
		$("#paging").append("<ul>");

		for(var i=((result.paging.startPage-1)*result.paging.cntPerPage)+1; i<=result.paging.endPage; i++){
			paging += "<li onclick='movePage("+i+")'>"+i+"</li>";
			pageNum = i;
		}
		$("#paging ul").append(paging);
		$("#paging").append("</ul>");
		
		if(result.paging.startPage > 1){
			$("#paging").prepend("<span onclick='movePage("+((result.paging.startPage-1)*result.paging.cntPerPage)+")'>prev</span>");
			$("#paging").prepend("<span onclick='movePage(1)'>시작</span>");
		}
		
		if(result.paging.endPage < result.paging.lastPage){
			$("#paging").append("<span onclick='movePage("+(result.paging.endPage+1)+")'>next</span>");
			$("#paging").append("<span onclick='movePage("+(result.paging.lastPage)+")'>끝</span>");
		}
	}
	
	function movePage(num){
		console.log("num:"+num);
		searchArr["pageNum"] = num;
		searchArr["cntPerPage"] = cntPerPage;
		
		ajaxComm("/braa/Braa1000_select.do",searchArr,braaSelectCallback);
	}
	
	function bordWrite(bordNum, bordRelease){	
		//비밀번호 입력
		if(bordRelease == "N"){ //비공개
			//window.open("${pageContext.request.contextPath}/confirm.jsp","","scrollbars=no,status=no,resizable=no,width=300,height=150");
			window.open("Braa1000_confirmPasswdWindow.do?bordNum="+bordNum,"","scrollbars=no,status=no,resizable=no,width=300,height=150");		
		}else{
			checkAfterAction(bordNum);
		}
	}
	
	function checkAfterAction(num){
		window.location.href = "Braa1000_detailSelect.do?bordNum="+num;
	}
	
	//공통 js만들면 제거 
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
	
</script>
<div class="inner">
	<div>
		<span id="totalCnt"></span>
		<select id="select">
			<option value="bordNm">제목</option>
			<option value="userNm">이름</option>
		</select>
		<input type="text" id="searchText"/>
		<button id="searchBtn">검색</button>
	</div>
	<div>
		<table id="braaTable" width="500" cellpadding="7" cellspacing="0" border="1">
		</table>
	</div>
	<div id="paging">

	</div>
	<div>
		<button id="write">작성하기</button>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>