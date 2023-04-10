function idCheck(target){

    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'idCheck.do',
        error: function(err){
            console.log(err);
        },
        success: function(data){
			console.log("성공");
            var checkWord = $("#input_id").val();
            var checkId = $(".checkId");
           /*  console.log(checkWord); */
			console.log(checkWord);
            checkId.empty();
            data.forEach((account)=>{
                if(account['id'] == checkWord.trim()){
					console.log(account['id']);
					checkId.empty();
                	checkId.append(
              			"중복된 아이디입니다."	
              		)
              		$("#final_check").val("false");
                }
                
            })
        }
    })

}    

window.onload = () => {
	
	$("#pw_check").blur(function(){
		if($("#pw_check").val() == $("#pw").val()){
			$(".checkPw").text("비밀번호가 일치합니다.");
			$(".checkPw").css("color", "green");
			$("#final_check").val("true");
		}else{
			$(".checkPw").text("비밀번호가 일치하지 않습니다.");
			$(".checkPw").css("color", "red");
			$("#final_check").val("false");
		}
	});
	
	
	
	
/*	 action="signup.do" method="post"*/
	 
	 document.querySelector("#success_btn").addEventListener("click",function(){
		 let final = document.querySelector("#final_check").value;
		 let form = document.querySelector("#signupForm");
		 if(final==="false"){
			 alert("입력정보를 확인하시오");
		 } else{
			 form.method="post"
			 form.action="signup.do"
			 form.submit();
		 }
	 })
	 
}

