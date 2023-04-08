

window.addEventListener('DOMContentLoaded', function(){
    document.querySelectorAll('details').forEach(function(item){
        item.addEventListener("toggle", event => {
        let toggled = event.target;
        if (toggled.attributes.open) {/* 열었으면 */
          /* 나머지 다른 열린 아이템을 닫음 */
          document.querySelectorAll('details[open]').forEach(function(opened){
              if(toggled != opened) /* 현재 열려있는 요소가 아니면 */
                opened.removeAttribute('open'); /* 열림 속성 삭제 */
          });
        }
      })
    });
  });


document.querySelector(".like_btn").addEventListener("click", function(){
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
	
