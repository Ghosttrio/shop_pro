      
/* 카카오 페이 */
	  window.onload = () => {
		  document.querySelector("#pay").addEventListener("click", function () {
            send2();
			})
			document.querySelector("#post_btn").addEventListener("click", function () {
	            	execDaumPostcode();
	    		})
	  }
        

        function send() {
            // CORS 발생
            let xhr = new XMLHttpRequest();
            xhr.open('post', "https://kapi.kakao.com/v1/payment/ready");
            xhr.setRequestHeader('Authorization', auth);
            xhr.setRequestHeader('Content-type', "application/x-www-form-urlencoded;charset=utf-8");
            xhr.send(JSON.stringify(data));
            xhr.onload = function () {
                console.log(xhr.responseText);
            }
        }

        function send2() {
			let id = document.querySelector("#id").value;
			let nickname = document.querySelector("#nickname").value;
			let order_name = document.querySelector("#order_name").value;
			let product_code = document.querySelector("#product_code").value;
			let total_price = document.querySelector("#total_price").value;
			let product_num = document.querySelector("#product_num").value;
			let size = document.querySelector("#size").value;
			
			
			let postcode = document.querySelector("#postcode").value;
			let road_addr = document.querySelector("#road_addr").value;
			let jibunAddress = document.querySelector("#jibunAddress").value;
			let detail_addr = document.querySelector("#detail_addr").value;
			
			
			
            let admin_key = "38ecf9e47f19a06625aadf9750c9ea14";
            let auth = "KakaoAK " + admin_key;
            let _data = {
                cid: "TC0ONETIME", // 가맹점 코드
                partner_order_id: "partner_order_id", // 가맹점 주문번호
                partner_user_id: "partner_user_id", // 가맹점 회원 id
                item_name: "상품명 입력", // 상품명
                item_code: "HP1234", // 상품 코드-내부관리용; 필수 아님
                quantity: 2, //수량
                total_amount: 10000, //가격
                tax_free_amount: 0, //비과세영역
                approval_url: "http://localhost:8090/complete?id=" + id +"&order_name="+order_name+"&nickname=" + nickname+"&product_code="+product_code+"&total_price="+total_price+"&product_num="+product_num+"&size="+size+"&road_addr="+road_addr+"&postcode="+postcode+"&jibunAddress="+jibunAddress+"&detail_addr="+detail_addr+"", // 성공 url
                cancel_url: "http://localhost:8090/cancel", // 취소 url
                fail_url: "http://localhost:8090/fail", // 실패 url
                install_month: "3" // 할부개월; 필수 아님
            }
            
            $.ajax({
                url: "https://kapi.kakao.com/v1/payment/ready",
                type: "post",
                headers: {
                    "Authorization": auth,
                    'Content-type': "application/x-www-form-urlencoded;charset=utf-8"
                },
                data: _data,
                success: function (data) {
                    console.log(data)
                    console.log(data.tid)
                    location.href = data.next_redirect_pc_url;
                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }

        
        
/* 카카오 맵 */
        
            
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("road_addr").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
        
        
        
        