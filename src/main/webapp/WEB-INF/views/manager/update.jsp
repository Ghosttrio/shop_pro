<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품수정</h1>
	<c:forEach var="productList" items="${productList }">
	    <form action="update.do" method="POST">
	    	상품코드 : <input type="text" name="product_code" value="${productList.product_code }"> <br>
		    이름 : <input type="text" name="product_name" value="${productList.product_name }"> <br>
		    가격 : <input type="text" name="product_price" value="${productList.product_price }"> <br>
		    브랜드 : <input type="text" name="product_brand" value="${productList.product_brand }"> <br>
		    옵션 : <input type="text" name="product_option" value="${productList.product_option }"> <br>
		    설명 : <input type="text" name="product_explain" value="${productList.product_explain }"> <br>
	    	사진 : <input type="text" name="product_image" value="${productList.product_image }"> <br>
		    <input type="submit">
		    <input type="reset">
	    </form>
    </c:forEach>
</body>
</html>