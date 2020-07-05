<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온라인 문의</title>
</head>
<body>
<Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<form action="/web/hope/brcc/Braa1000_mainRegister" method="POST">
<table>
  <tr>
   <td>
   <table width="500" cellpadding="7" cellspacing="0" border="1">
    <tr>
    	<td align="center" width="120">이름</td>
    	<td><input type="text" name="name"></td>
    	<td align="center" width="120">비밀번호</td>
    	<td><input type="text" name="passwd"></td>
    </tr>
     <tr>
    	<td align="center" width="120">이메일</td>
    	<td><input type="text" name="email"></td>
    	<td align="center" width="120">휴대전화</td>
    	<td><input type="text" name="tellNm"></td>
    </tr>
    <tr>
    	<td align="center">제목</td>
    	<td colspan="3"><input type="text" name="title"></td>
    </tr>
    <tr>
    	<td align="center">첨부파일</td>
    	<td><input type="text" name="title"></td> <!-- 첨부파일 지정  -->
    </tr>
    <tr>
      <td align="center" height="100" >내용</td>
      <td height="150" colspan="3">
       <textarea name="content"></textarea>
      </td>
     </tr>   
    </table>
   </td>
  </tr>
 </table>
 <input type=submit value="등록">
 <input type=button value="목록">
</form>
</body>
</html>