<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    
    <link rel="stylesheet" href="/css/main/slide.css">
    
    <link rel="stylesheet" href="/css/main/main.css" type="text/css">
    <script type="text/javascript" src="/js/main/main.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
        <article class="main_article">
        
        
        
        
        	<article class="main_review">
                <h2>LookBook</h2>
                <div class="wrapper">
			        <div class="container">
			            <ul class="slider">
			                <li class="item"><img src="/image/content/lookbook7.jpg" width="100%"></li>
			                <li class="item"><img src="/image/content/lookbook5.jpg" width="100%"></li>
			                <li class="item"><img src="/image/content/lookbook4.jpg" width="100%"></li>
			            </ul>
			        </div>
			        <div class="btn">
			            <a class="prev" style="text-decoration: none;">&#10094;</a>
			            <a class="next" style="text-decoration: none;">&#10095;</a>
			        </div>
			    </div>
            </article>
            
            
            
            
            
            <article class="main_ranking">
            	<h2>Ranking</h2>
            	<div>
            		<c:forEach var="ranking" items="${product_ranking }" varStatus="status" begin="0" end="4">
            			<c:forEach var="productList_all" items="${productList_all }">
           					<c:if test="${productList_all.product_code == ranking.review_productId }">
	           					<div class="ranking_box">
	           						<h3>${status.count }위</h3>
	           						<div>
	           							<img src="${productList_all.product_image}" width="100%" height="200px">
	           						</div>
	           						<div class="mainInfo">
	           							<div class="product_name">${productList_all.product_name}</div>
	           							<div class="product_name"><fmt:formatNumber value="${productList_all.product_price }" pattern="#,###"/>원</div>
	           						</div>
	           						<form action="info">
	           							<input type="hidden" name="product_code" value="${productList_all.product_code }">
	           							<input id="order" class="btn-7" type="submit" value="주문하기">
	           						</form>
           						</div>
           					</c:if>
            			</c:forEach>
            		</c:forEach>
            	</div>
            </article>
            
        </article>
    </section>
</body>
 <script src="/js/main/slide.js"></script>
</html>
