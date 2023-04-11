<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common/header.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" ></script>
<script type="text/javascript" src="/js/common/header.js"></script>
</head>
<body>
	<header>
		<div>
			<a href="main"><img src="/image/logo/logo_main.jpg" width=100px;></a>
		</div>
		<div class="">
			<button class="accordion">Shop</button>
			<div class="panel">
			    <div>
			    	<form action="product">
			    		<input type="submit" value="상의">
				    	<input type="hidden" name="product_type" value="top">
			    	</form>
			    </div>
			    <div>
			    	<form action="product">
			    		<input type="submit" value="하의">
				    	<input type="hidden" name="product_type" value="bottom">
			    	</form>
			    </div>
			    <div>
			    	<form action="product">
			    		<input type="submit" value="아우터">
				    	<input type="hidden" name="product_type" value="outer">
			    	</form>
			    </div>
			    <div>
			    	<form action="product">
			    		<input type="submit" value="신발">
				    	<input type="hidden" name="product_type" value="shose">
			    	</form>
			    </div>
			    <div>
			    	<form action="product">
			    		<input type="submit" value="기타">
				    	<input type="hidden" name="product_type" value="etc">
			    	</form>
			    </div>
			</div>
		</div>
        <div class="search">
        	<form action="info">
	        	<input class="info_input" type="text" data-cate="high" onkeyup="search(this);" placeholder="제품을 입력하세요">
	        	<div class="productList"></div>
       		</form>
        </div>
        <div class="login_box">
       	 	<c:if test="${loginInfo == null }">
                <a class="header_login" href="login">Login</a>
                <a class="header_signup" href="signup">Signup</a>
            </c:if>
            <c:if test="${loginInfo != null }">
           		<a class="header_login" href="logout.do">Logout</a>
            	<a class="header_signup" href="mypage">MyPage</a>
            </c:if>
        </div>
    </header>
</body>
</html>


