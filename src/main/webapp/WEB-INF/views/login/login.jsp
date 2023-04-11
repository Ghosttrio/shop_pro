<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/login/login.css" type="text/css">
    <link rel="stylesheet" href="/css/login/slide.css" type="text/css">
    <script type="text/javascript" src="/js/login/login.js"></script>
</head>
<body>
	<form action="login.do" method="post">
	    <div id="wrap">
	        <div id="logo_header">
	            <img src="/image/logo/shop_logo.jpg" width="150px">
	        </div>
	        <div class="id_wrap">
	        	아이디<br>
	        	<input type="text" name="id" placeholder="아이디를 입력하세요">
	        		        </div>
	        <div class="pw_wrap">
	        	비밀번호<br>
	        	<input type="password" name="pw" placeholder="비밀번호를 입력하세요"><br>
	        </div>
	        <c:if test="${message == 'error' }">
	        	<div style="color:red;">로그인 정보가 일치 하지 않습니다.</div>
        	</c:if>
	        
	        <div class="btn_wrap">
	        	<input class="btn btn-success" type="submit" value="로그인">
	        </div>
	        
	        
	        
	        
	        
	        
	        
	        <div>
	        
		        <div class="wrapper">
			        <div class="container">
			            <ul class="slider">
			                <li class="item"><img src="/image/content/lookbook1.jpg" width="100%"></li>
			                <li class="item"><img src="/image/content/lookbook2.jpg" width="100%"></li>
			                <li class="item"><img src="/image/content/lookbook3.jpg" width="100%"></li>
			            </ul>
			        </div>
			    </div>
		   
	        
	        
	        
	        </div>
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    </div>
	</form>
</body>
<script src="/js/login/slide.js"></script>
</html>