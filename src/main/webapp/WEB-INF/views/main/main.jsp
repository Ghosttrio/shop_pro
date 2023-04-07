<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <header>
        <div class="logo_div">
            <a href="main"><img src="/image/logo/shop_logo.jpg" width="100%"></a>
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
                <form action="product">
                	<input type="hidden" name="product_type" value="top">
                	<input type="submit" value="이동">
            	</form>
                
            </details>
            <details>
                <summary>하의</summary>
                <p>옷2</p>
                <form action="product">
                	<input type="hidden" name="product_type" value="bottom">
                	<input type="submit" value="이동">
            	</form>
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
            <article class="main_ranking">
                selcet * from product_info order by rate
            </article>
            <article class="main_review">
                메인(후기)
            </article>
        </article>
    </section>
</body>
</html>