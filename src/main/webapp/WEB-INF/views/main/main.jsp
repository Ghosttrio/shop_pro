<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    <link rel="stylesheet" href="/css/main/main.css" type="text/css">
    <script type="text/javascript" src="/js/main/main.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
        <article class="main_article">
        	<article class="main_review">
                <h2>LookBook</h2>
                <img src="/image/content/lookbook1.jpg" width="100%">
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
	           						<div>
	           							<div class="product_name">${productList_all.product_name}</div>
	           						</div>
	           						<form action="info">
	           							<input type="hidden" name="product_code" value="${productList_all.product_code }">
	           							<input class="order" type="submit" value="주문하기">
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
</html>
