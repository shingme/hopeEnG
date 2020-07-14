<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<style>
.a_title{transition-property: all;
    transition-duration: .2s;
    transition-timing-function: ease-out;
    display: block;
    color: #aaaaaf;}
.a_title:hover .title{background-size: 100% 2.4rem;}
.title{transition-property: all;
    transition-duration: .4s;
    transition-timing-function: ease-out;
    font-size: 1.4rem;
    line-height: 1.5;
    display: inline-flex;
    margin-top: 0.6rem;
    margin-bottom: 0.6rem;
    color: #282828;
    background-image: linear-gradient(transparent calc(100% - 0.8rem), rgba(255,116,80,0.25) 0.8rem);
    background-repeat: no-repeat;
    background-size: 0 2.4rem;
    background-position: 0 100%;}
</style>
	<title>Home</title>
</head>
<body>
<a class="a_title"><h1 class="title" style="">
	Hello world!  
</h1></a>

</body>
</html>
