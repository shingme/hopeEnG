<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>갤러리수정</title>
<%@ include file="/WEB-INF/views/comm/header.jsp" %>

<%    
    String gllyNo = request.getParameter("gllyNo");
	System.out.println("jsp page : "+ gllyNo);
%>

<c:set var="gllyNo" value="<%=gllyNo%>"/> <!-- 게시글 번호 -->
 

<script type="text/javascript">
    
    $(document).ready(function(){        
    	getGlaaDetail();        
    });
    
    /** 갤러리 - 목록 페이지 이동 */
    function goGlaaList(){                
        location.href = "/glaa/glaa.do";
    }
    
    
    /** 갤러리 - 상세 조회  */
    function getGlaaDetail(boardSeq){
        
        var gllyNo = $("#glly_no").val();
        if(gllyNo != ""){
            
            $.ajax({    
                
                url        : "/glaa/Glaa1000_getGlaaDetail",
                data    : {gllyNo : gllyNo},
              
                dataType: "JSON",
             
                cache   : false,
                async   : true,
                type    : "POST",    
                success : function(obj) {
                    getGlaaDetailCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
             });
        } else {
            alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
        }            
    }
    
    /** 게시판 - 상세 조회  콜백 함수 */
    function getGlaaDetailCallback(obj){
        
        var str = "";
        
        if(obj != null){                                
            str += "<tr>";
            str += "<th>이미지</th>";
            str += "<td>"+ "<img src='/glly/"+obj.firstFilePath+"' width=\"600\"/>" +"</td>";
            str += "</tr>";
            $("#glly_nm").val(obj.gllyNm);
            $("#glly_cts").val(obj.gllyCts);
            $("#showMainYn").val(obj.showMainYn);
        } else {
            
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
        
         $("#tbody").append(str);
    }
    
    // 갤러리 수정
    function updateGlaaDetail(){
    	var obj = new Object();
    	obj.gllyNm = $("#glly_nm").val();
    	obj.gllyCts = $("#glly_cts").val();
    	obj.showMainYn = $("#showMainYn").val();
    	
    	if(obj.gllyNm == ""){
    		alert("제목을 입력해주세요.");
    		$("#glly_nm").focus();
    		return;
    	}
    	if(obj.gllyCts == ""){
    		alert("내용을 입력해주세요.");
    		$("#glly_cts").focus();
    		return;
    	}
    	//var jsonData = JSON.stringify(obj);
    	var yn = confirm("게시물을 수정하시겠습니까?");
    	if(yn){
    		$.ajax({
    			url			: "/glaa/Glaa1000_updateGlaa",
    			data		: $("#glaaVO").serialize(),//jsonData//
    			dataType	: "JSON",
    			cache		: false,
    			async 		: true,
    			type		: "POST",
    			success		: function(obj){
    				updateGlaaCallback(obj);
    				
    			},
    			error		: function(xhr, status, error){}
    		});
    	}
    }
    // 수정 콜백함수
    function updateGlaaCallback(obj){
    	if(obj != null){
    		
    		
    		if(obj == "SUCCESS"){
    			alert("게시글 수정을 성공하였습니다.");
    			location.href ="/glaa/glaa.do";
    		}else{
    			alert("게시글 수정을 실패하였습니다.");
    			return;
    		}
    	}
    }
</script>
</head>
<body>

    
<div id="wrap">
    <div id="container">
        <div class="inner">    
            <h2>게시글 상세</h2>
            <form id="glaaVO" name="glaaVO">        
                <table width="100%" class="table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
						<tbody id="tbody">
							<tr>
								<th>메인화면 표시 여부<span class="t_red">*</span></th>
								<td><select id="showMainYn" name="showMainYn" class="form-control-small">
										<option value="Y">표시</option>
										<option value="N" selected>미표시</option>
								</select></td>
							</tr>
							<tr>
								<th>제목<span class="t_red">*</span></th>
								<td><input id="glly_nm" name="gllyNm" value=""
									class="form-control" /></td>
							</tr>
							<tr>
								<th>내용<span class="t_red">*</span></th>
								<td colspan="3"><textarea id="glly_cts" name="gllyCts"
										cols="200" rows="5" class="form-control"></textarea></td>
							</tr>
						</tbody>
					</table>        
                <input type="hidden" id="glly_no"        name="gllyNo"    value="${gllyNo}"/> <!-- 게시글 번호 -->
                <input type="hidden" id="search_type"    name="search_type"     value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
            </form>
            <div class="" style="margin-top:20px;">
                <button type="button" class="" onclick="javascript:goGlaaList();">목록으로</button>
                <button type="button" class="" onclick="javascript:updateGlaaDetail();">수정하기</button>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>