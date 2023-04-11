<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="/css/order/complete.css" type="text/css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section >
    	<article>
	    	<div class="complete">
		    	<h1>결제가 완료되었습니다.</h1>
		    	<div class="order_info">
		    		<h3>주문정보</h3>
		    		<br>
		    		<c:forEach var="productList" items="${productList }">
			    		<div class="imgbox"><img src="${productList.product_image }"></div>
			    		<div class="result_wrap">
				    		<div>주문자 : ${result.order_name }</div>
				    		<div>주문 사이즈 : ${result.size }</div>
				    		<div>주문 수량 : ${result.product_num }</div>
				    		<div>주문 금액 : ${result.total_price }</div>
				    		<div>
				    			주소 : ${result.postcode }
					    		${result.road_addr }
					    		${result.jibunAddress }
					    		${result.detail_addr }
				    		</div>
			    		</div>
			    		
			    		
			    		
		    		
		    		
		    		</c:forEach>
		    	</div>
		    	<form action="main">
	    			<input id="home_btn" class="btn-7" type="submit" value="쇼핑 계속하기">
		    	</form>
	    	</div>
    	</article>
    </section>
</body>

</html>