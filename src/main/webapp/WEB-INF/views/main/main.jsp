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
            <article class="main_ranking">
            	<h3>Ranking</h3>
            	<div>
            		<c:forEach var="ranking" items="${product_ranking }" varStatus="status">
            			<c:forEach var="productList_all" items="${productList_all }">
            			<div style="display:inline-block;">
           					<c:if test="${productList_all.product_code == ranking.review_productId }">
	           					<div style="border:1px solid black; width:200px; height:250px; ">
	           						<div>${status.count }위</div>
	           						<div>
	           							${productList_all.product_name}
	           						</div>
           						</div>
           					</c:if>
            			</div>
            			</c:forEach>
            		</c:forEach>
            	</div>
            </article>
            <article class="main_review">
                <h3>LookBook</h3>
            </article>
        </article>
    </section>
</body>
</html>

<%-- 
<div>
				    <c:forEach var="product_type" items="${product_type }">
	                	<div>
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${product_type.product_type }">
			                	<input type="submit" value="${product_type.product_type }">
			            	</form>
		            	</div>
	            	</c:forEach>
			    </div>

 --%>
<%-- <div class="logo_div">
            <a href="main"><img src="/image/logo/shop_logo.jpg" width="100%"></a>
        </div>
        <div class="shop_btn">
        	shop
        </div>
        <div>
            <input type="search" placeholder="Please enter product">
        </div>
        <div class="login_div">
        	<c:if test="${loginInfo == null }">
            <div>
                <a href="login">Login</a>
            </div>
            <div>
                <a href="signup">Join</a>
            </div>
            </c:if>
            <c:if test="${loginInfo != null }">
            	<div>
	                <a href="logout.do">로그아웃</a>
	            </div>
	            <div>
	                <a href="mypage">마이페이지</a>
	            </div>
            </c:if>
        </div>
        
        
        
                <aside class="main_tab">
            <details>
                <summary>상의</summary>
                <c:forEach var="productList" items="${productList }">
	                <c:if test="${productList.product_type2 == 'top' }">
	                	<div class="product_type">
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${productList.product_type }">
			                	<input type="submit" value="${productList.product_type }">
			            	</form>
		            	</div>
	            	</c:if>
            	</c:forEach>
            </details>
            <details>
                <summary>하의</summary>
                <c:forEach var="productList" items="${productList }">
                	<c:if test="${productList.product_type2 == 'bottom' }">
	                	<div class="product_type">
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${productList.product_type }">
			                	<input type="submit" value="${productList.product_type }">
			            	</form>
		            	</div>
	            	</c:if>
            	</c:forEach>
            </details>
            <details>
                <summary>아우터</summary>
                <c:forEach var="productList" items="${productList }">
                	<c:if test="${productList.product_type2 == 'outer' }">
	                	<div class="product_type">
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${productList.product_type }">
			                	<input type="submit" value="${productList.product_type }">
			            	</form>
		            	</div>
	            	</c:if>
            	</c:forEach>
            </details>
            <details>
                <summary>신발</summary>
                <c:forEach var="productList" items="${productList }">
                	<c:if test="${productList.product_type2 == 'shose' }">
	                	<div class="product_type">
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${productList.product_type }">
			                	<input type="submit" value="${productList.product_type }">
			            	</form>
		            	</div>
	            	</c:if>
            	</c:forEach>
            </details>
            <details>
                <summary>기타</summary>
                <c:forEach var="productList" items="${productList }">
               		<c:if test="${productList.product_type2 == 'etc' }">
	                	<div class="product_type">
			                <form action="product">
			                	<input type="hidden" name="product_type" value="${productList.product_type }">
			                	<input type="submit" value="${productList.product_type }">
			            	</form>
		            	</div>
	            	</c:if>
           	 	</c:forEach>
            </details>
           
        </aside> --%>