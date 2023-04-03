<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css">
    <script type="text/javascript" src="/js/main.js"></script>
</head>
<body>
    <header>
        <div class="logo_div">
            <a href=""><img src="/image/shop_logo.jpg" width="100%"></a>
        </div>
        <div>
            <a href="">주문배송조회</a>
            
        </div>
        <div>
            <a href="">마이페이지</a>
            
        </div>
        <div>
            <a href="">고객센터</a>
            
        </div>
        <div>
            <input type="search" placeholder="상품을 입력하세요">
        </div>
        <div class="login_div">
            <div>
                <a href="">로그인</a>
            </div>
            <div>
                <a href="">회원가입</a>
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
            <article class="main_ranking">
                selcet * from product_info order by rate


                
            </article>
            <article class="main_review">
                메인(후기)
            </article>
        </article>
    </section>
    
    <footer>
        하단바
    </footer>
</body>
</html>