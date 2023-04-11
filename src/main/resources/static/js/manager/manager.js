window.onload = () => {
	document.querySelector(".add").addEventListener("click",function(){
		let managerForm = document.managerForm
		managerForm.action="/add";
		managerForm.method="get";
		managerForm.submit();
	});
}