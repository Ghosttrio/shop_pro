


	

    



function search(target){

    $.ajax({
        type: 'GET',
        dataType: 'JSON',
        url: 'search.do',
        error: function(err){
            console.log(err);
        },
        success: function(data){
            var checkWord = $(".info_input").val();
            var productList = $(".productList");
           /*  console.log(checkWord); */
			console.log(checkWord);
            productList.empty();
            data.forEach((product)=>{
                if(product['product_name'].includes(checkWord)){
					console.log(product['product_name']);
                	productList.append(
              		"<input class=\"ajaxList\" type=\"submit\" value=\""+product['product_name']+"\">"+ 
              		"<br/><input type=\"hidden\" name=\"product_code\" value="
              		+product['product_code']+">"); 
              		if(checkWord.trim() === ''){
						  productList.empty();
					  }
                }
                
            })
        }
    })

}    
	
	window.onload = () =>{
		
	
	var acc = document.getElementsByClassName("accordion");
    var i;
 
    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
    
    }