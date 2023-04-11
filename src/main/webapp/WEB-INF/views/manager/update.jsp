<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/manager/update.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<header>
	    	<div>
	    		관리자페이지
	    	</div>
	        <div>
	        	<form action="manager">
					<input class="add btn-7" type="submit" value="홈으로 돌아가기">
				</form>
	        </div>
        </header>
        <section>
        	<h1>상품수정</h1>
			<c:forEach var="productList" items="${productList }">
			    <form action="update.do" method="POST">
			    	제품코드 : <input type="text" name="product_code" value="${productList.product_code }"> <br>
				    제품이름 : <input type="text" name="product_name" value="${productList.product_name }"> <br>
				    제품가격 : <input type="text" name="product_price" value="${productList.product_price }"> <br>
			    	제품사진 : <input type="text" name="product_image" value="${productList.product_image }"> <br>
				    제품정보 : <input type="text" name="product_explain" value="${productList.product_explain }"> <br>
			    	제품분류 : <select name="product_type">
						      <option selected>분류</option>
						      <option value="top" >상의</option>
						      <option value="bottom">하의</option>
						      <option value="outer">아우터</option>
						      <option value="shose">신발</option>
						      <option value="etc">기타</option>
					        </select> <br>
			    	<div class="btn_box">
					    <input class="btn-5" type="submit">
					    <input class="btn-5" type="reset">
				    </div>
			    </form>
		    </c:forEach>
	    </section>
	</div>
	
</body>
</html>