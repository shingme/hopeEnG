<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
  		
    </head>
    
    <%
    	String id;
    	id = (String)session.getAttribute("name");
    %>
    <body id="page-bottom">
     <c:set var="id" value="<%=id%>" />
        <!-- Footer-->
        <footer class="footer py-4" id="footer-Section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-left footerLeft" style="">Copyright © (주)희망이엔지<br> 2020 All rights reserved.</div>
                    
                    <div class="col-lg-4 my-3 my-lg-0 footerMid" style="">
                    	ADRESS - 경남 거제시 문동동 1길 16-2<br>
						PHONE - 055-632-2735 / FAX - 055-635-2735
                    	
                        <%--<a class="btn btn-light btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-light btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-light btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a> --%>
                    </div>
                    <div class="col-lg-4 text-lg-right" style="max-width:20%;">
                        <%--<a class="mr-3" href="#!">보안정책</a>
                        <a href="#!">이용약관</a>--%>
                    </div>
                    <div class="footerLogin">
                    	<c:if test="${ id eq null}">
                    		<a href="/admin" style="margin-left:10px;">로그인</a>
                    	</c:if>
                  	 	<c:if test="${ id ne null}">
                    		<a href="/admin/logout.do" style="margin-left:10px;">로그아웃</a>
                    	</c:if>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
