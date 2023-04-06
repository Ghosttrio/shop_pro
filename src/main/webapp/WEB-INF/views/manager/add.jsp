<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품추가</h1>
    <form action="add.do" method="POST">
    	상품코드 : <input type="text" name="product_code"> <br>
	    이름 : <input type="text" name="product_name"> <br>
	    가격 : <input type="text" name="product_price"> <br>
	    브랜드 : <input type="text" name="product_brand"> <br>
	    옵션 : <input type="text" name="product_option"> <br>
	    설명 : <input type="text" name="product_explain"> <br>
    	사진 : <input type="text" name="product_image"> <br>
	    <input type="submit">
	    <input type="reset">
    </form>
</body>
</html>