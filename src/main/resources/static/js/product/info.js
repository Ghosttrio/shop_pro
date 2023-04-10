

/*document.querySelector(".like_btn").addEventListener("click", function(){
  	 $.ajax({
		    url: "like.do",
		    type: "POST",
		    dataType: "html",
		   	data:{
	            command : $('.command').val(),
	            articleNO1 : $('.articleNO1').val()
	        },
		    success:function(data){  
		    	swal("Notice","좋아요가 반영되었습니다.");
		    	let a = data;
		    	console.log(a);
		    	$(".like_btn").val("♡ "+a);
		    },   
		    error: 
		    function (request, status, error){  
		    }
		  });
  })
	
*/

window.onload = () =>{
	

	document.querySelector(".product_pay").addEventListener("click", function(){
		let form = document.querySelector(".product_form");
		
		form.method="get";
		form.action="order";
		form.submit();
	
	})
	
	
	document.querySelector(".up").addEventListener("click", function(){
		document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) + 1;
		document.querySelector(".price").value = parseInt(document.querySelector(".option_amount").value) *  parseInt(document.querySelector(".option_price").value);
		
	})
	document.querySelector(".down").addEventListener("click", function(){
		document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) - 1;
		if(document.querySelector(".option_amount").value < 1){
			alert("수량 1개 이하는 선택할 수 없습니다.")
			document.querySelector(".option_amount").value = parseInt(document.querySelector(".option_amount").value) + 1;
		}
	
	})
	
}

function product_option(){
	var option  = document.querySelector(".product_option");
	var value = (option.options[option.selectedIndex].value);
	var show = $(".option_show");
	show.append("<div>"+value+"</div>");

	
};












