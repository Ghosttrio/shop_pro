<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/manager/manager.css" type="text/css">
   <!--  <script type="text/javascript" src="js/manager/manager.js"></script> -->
</head>
<body>
    <div id="wrap">
        <div>
        	<form name="managerForm">
				<input class="add" type="button" value="영화추가하기">
			</form>
        </div>
        
        <div>
        	<h1>출력</h1>
        	
        	<c:forEach var="productList" items="${productList }">
        		${productList.product_name }
        		<form action="delete.do" method="post" >
        			<input type="hidden" name="product_code" value="${productList.product_code }">
        			<input type="submit" value="삭제" >
				</form>
				<form action="update" method="get" >
        			<input type="hidden" name="product_code" value="${productList.product_code }">
        			<input type="submit" value="수정"  >
				</form>
        	</c:forEach>
        </div>
        
        
    </div>
</body>
<script>
document.querySelector(".add").addEventListener("click",function(){
	let managerForm = document.managerForm
	managerForm.action="/add";
	managerForm.method="get";
	managerForm.submit();
});
</script>
</html>