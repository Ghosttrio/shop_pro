


function product_option(){
	var option  = document.querySelector(".product_option");
	var value = (option.options[option.selectedIndex].value);
	var show = $(".option_show");
	show.empty();
	show.append("<div>사이즈 : "+value+"</div><input type=\"hidden\" value=\""+value+"\" name=\"size\">");

	
};




document.querySelector("#up").addEventListener("click", function(){
	document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) + 1;
	document.querySelector(".price").value = parseInt(document.querySelector(".option_amount").value) *  parseInt(document.querySelector(".option_price").value);
	
})
document.querySelector("#down").addEventListener("click", function(){
	document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) - 1;
	document.querySelector(".price").value = parseInt(document.querySelector(".option_amount").value) *  parseInt(document.querySelector(".option_price").value);
	if(document.querySelector(".option_amount").value < 1){
		alert("수량 1개 이하는 선택할 수 없습니다.")
		document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) + 1;
	}

})
window.onload = () => {
	
	document.querySelector("#product_pay").addEventListener("click", function(){
		let form = document.querySelector(".product_form");
		form.method="get";
		form.action="order";
		form.submit();
	})
	document.querySelector("#pay_alert").addEventListener("click", function(){
		alert("로그인이 필요합니다.");
		location.href="login";
	})
	
	
	document.querySelector("#product_cart").addEventListener("click", function(){
		alert("장바구니에 추가 되었습니다.")
		let form = document.querySelector(".product_form");
		form.method="post";
		form.action="cart";
		form.submit();
	
	})
	
	document.querySelector("#cart_alert").addEventListener("click", function(){
		alert("로그인이 필요합니다.");
		location.href="login";
	})
}










document.addEventListener('DOMContentLoaded', function(){ //DOM 생성 후 이벤트 리스너 등록
    //더보기 버튼 이벤트 리스너
    document.querySelector('.btn_open').addEventListener('click', function(e){
        
        let classList = document.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
        let contentHeight = document.querySelector('.detailinfo > .content').offsetHeight; //컨텐츠 높이 얻기
		classList.remove('showstep1');
		classList.add("content")
		document.querySelector('.btn_open').classList.add('hide');
		
		
        //전체보기시 더보기 버튼 감추기 & 감추기 버튼 표시
        if(!classList.contains('showstep1') && !classList.contains('showstep2')){
            e.target.classList.add('hide');
            document.querySelector('.btn_close').classList.remove('hide');
            
        }
        
    });
});

// 감추기 버튼 이벤트 리스너
document.querySelector('.btn_close').addEventListener('click', function(e){
    e.target.classList.add('hide');
    document.querySelector('.btn_open').classList.remove('hide'); // 더보기 버튼 감춤
    document.querySelector('.detailinfo').classList.add('showstep1'); // 초기 감춤 상태로 복귀
});

//컨텐츠 로딩 완료 후 높이 기준으로 클래스 재처리
window.addEventListener('load', function(){
    let contentHeight = document.querySelector('.detailinfo > .content').offsetHeight; //컨텐츠 높이 얻기
    if(contentHeight <= 300){
        document.querySelector('.detailinfo').classList.remove('showstep1'); // 초기값보다 작으면 전체 컨텐츠 표시
        document.querySelector('.btn_open').classList.add('hide'); // 버튼 감춤
    }
});