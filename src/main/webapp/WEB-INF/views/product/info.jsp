<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="css/info/info.css" type="text/css">
    <script type="text/javascript" src="js/info/info.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
 <header>
        <div class="logo_div">
            <a href="main"><img src="/image/logo/shop_logo.jpg" width="100%"></a>
        </div>
        <div>
            <a href="mypage">주문배송조회</a>
            
        </div>
        <div>
            <a href="mypage">마이페이지</a>
            
        </div>
        <div>
            <input type="search" placeholder="상품을 입력하세요">
        </div>
        <div class="login_div">
            <div>
                <a href="login">로그인</a>
            </div>
            <div>
                <a href="signup">회원가입</a>
            </div>
        </div>
    </header>
    <section>
        <aside class="main_tab">
            <details>
                <summary>상의</summary>
                <p>옷1</p>
            </details>
            <details>
                <summary>하의</summary>
                <p>옷2</p>
            </details>
            <details>
                <summary>아우터</summary>
                <p>옷3</p>
            </details>
            <details>
                <summary>스커트</summary>
                <p>옷4</p>
            </details>
            <details>
                <summary>신발</summary>
                <p>옷5</p>
            </details>
        </aside>
        <article class="main_article">
        <c:forEach var="productList" items="${productList }">
        	${productList.product_name }
        	
        	<input class="like_btn" type="button" value="좋아요">
        	<div>댓글 대댓글</div>
        	<div>qna게시판</div>
        	
        </c:forEach>
        
        <!-- 
        	<div class="product_brand">브랜드이름</div>
          	<div class="product_name">상품제목</div>
	        <div class="product_photo">상품사진</div>
	        <div class="product_heart">좋아요 수</div>
	        <div class="product_star">별점 점수</div>
	        <div class="product_price">가격정보</div>
	        <div class="product_option">옵션, 수량 선택</div>
	        <div class="product_cart">장바구니 버튼</div>
	        <div class="product_pay">구매버튼</div>
	        <div class="product_info">상품정보란, 더보기 구현</div>
	        <div class="product_review">후기(사진업로드, 별점, 댓글, 대댓글, 페이징)</div>
	        <div class="product_qna">상품문의 게시판</div> -->
        </article>
    </section>
    
</body>

</html>