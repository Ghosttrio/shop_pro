<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/product/product.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section>
        <article class="main_article">
            제품리스트
            <div class="flexbox">
				<c:forEach var="productList" items="${productList }">
					<div class="productbox">
						<div>
							<img src="${productList.product_image}" width="100%" height="300px">
						</div>
						<div>
							<div class="product_name">${productList.product_name}</div>
						</div>
						<form action="info">
							<input type="hidden" name="product_code" value="${productList.product_code }">
							<input class="order" type="submit" value="주문하기">
						</form>
					</div>
				</c:forEach>
		 	</div>
					<div id="paging" style="height:50px">
						<c:if test="${mapNum.total_product != null }">
							<c:choose>
								<c:when test="${mapNum.total_product > 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${mapNum.section > 1 && page == 1 }">
											<div class="no-uline">
												<form action="product" method="get">
													<input type="hidden" name="product_type" value="${mapNum.product_type }">
													<input type="hidden" name="section" value="${mapNum.section-1 }">
													<input type="hidden" name="pageNum" value="${(mapNum.section-1)*10 }">
													<input type="submit" value="pre">
												</form>
											</div>
										</c:if>
										<div class="no-uline">
											<form action="product" method="get">
												<input type="hidden" name="product_type" value="${mapNum.product_type }">
												<input type="hidden" name="section" value="${mapNum.section}">
												<input type="hidden" name="pageNum" value="${page}">
												<input type="submit" value="${(mapNum.section-1)*10 +page}">
											</form>
										</div>
										<c:if test="${page == 10 }">
											<form class="no-uline" action="product" method="get">
												<input type="hidden" name="product_type" value="${mapNum.product_type }">
												<input type="hidden" name="section" value="${mapNum.section+1 }">
												<input type="hidden" name="pageNum" value="${mapNum.section*10+1}">
												<input type="submit" value="next">
											</form>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${mapNum.total_product == 100 }">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a class="no-uline" href="#">${page}</a>
									</c:forEach>
								</c:when>
								<c:when test="${mapNum.total_product < 100 }">
									<c:forEach var="page" begin="1" end="${mapNum.total_product/10 + 1}" step="1">
										<c:choose>
											<c:when test="${page==pageNum }">
												<div class="sel-page">
													<form action="product" method="get">
														<input type="hidden" name="product_type" value="${mapNum.product_type }">
														<input type="hidden" name="section" value="${mapNum.section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input type="submit" value="${page }">
													</form>
												</div>
											</c:when>
											<c:otherwise>
												<div class="no-uline">
													<form action="product" method="get">
														<input type="hidden" name="product_type" value="${mapNum.product_type }">
														<input type="hidden" name="section" value="${mapNum.section}">
														<input type="hidden" name="pageNum" value="${page }">
														<input type="submit" value="${page }">
													</form>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</div>
        </article>
    </section>
</body>
</html>

