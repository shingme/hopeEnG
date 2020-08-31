<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>갤러리상세</title>
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
    
    /** 갤러리 - 수정 페이지 이동 */
    function goGlaaUpdate(){
    	var gllyNo = $("#glly_no").val();
    	location.href = "/glaa/Glaa1000_updateGlaa" + gllyNo;
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
            str += "<th>제목</th>";
            str= + "<td>"+ obj.gllyNm +"</td>";
            str= + "</tr>";        
            str += "<tr>";
            str += "<th>작성일시</th>";
            str += "<td>"+ obj.regiDate +"</td>";
            str += "</tr>";
            str += "<tr>";
            str += "<th>이미지</th>";
            str += "<td>"+ "<img src='/glly/"+obj.firstFilePath+"' width=\"600\"/>" +"</td>";
            str += "</tr>";
            str += "<tr>";
            str += "<th>내용</th>";
            str += "<td colspan='3'>"+ obj.gllyCts +"</td>";
            str += "</tr>";
            
        } else {
            
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
        
        $("#tbody").append(str);
    }
    
    /** 게시판 - 삭제  */
    function deleteGlaa(){
 
        var glaaSeq = $("#glaa_seq").val();
        
        var yn = confirm("게시글을 삭제하시겠습니까?");        
        if(yn){
            
            $.ajax({    
                
                url        : "/glaa/Glaa1000_deleteGlaa",
                data    : $("#boardForm").serialize(),
                dataType: "JSON",
                cache   : false,
                async   : true,
                type    : "POST",    
                success : function(obj) {
                    deleteGlaaCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
             });
        }        
    }
    
    /** 게시판 - 삭제 콜백 함수 */
    function deleteGlaaCallback(obj){
    
        if(obj != null){        
            
            var result = obj.result;
            
            if(result == "SUCCESS"){                
                alert("게시글 삭제를 성공하였습니다.");                
                goGlaaList();                
            } else {                
                alert("게시글 삭제를 실패하였습니다.");    
                return;
            }
        }
    }</script>
</head>
<body>

    
<div id="wrap">
    <div id="container">
        <div class="inner">    
            <h2>게시글 상세</h2>
            <form id="boardForm" name="boardForm">        
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                       
                    </tbody>
                </table>        
                <input type="hidden" id="glly_no"        name="glly_no"    value="${gllyNo}"/> <!-- 게시글 번호 -->
                <input type="hidden" id="search_type"    name="search_type"     value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
            </form>
            <div class="btn_right mt15">
                <button type="button" class="btn black mr5" onclick="javascript:goGlaaList();">목록으로</button>
                <button type="button" class="btn black mr5" onclick="javascript:goGlaaUpdate();">수정하기</button>
                <button type="button" class="btn black" onclick="javascript:deleteBoard();">삭제하기</button>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="/WEB-INF/views/comm/footer.jsp" %>
</html>