
function ValidateInput(element, value) {
//验证密码
	if (element == "Password") {
		if(empty(value.toString())){
			$("#validPassError").text("密码不能为空");
			$("#validPassError").show(); 			
		}else if (value.toString().length < 8) {		
			$("#validPassError").text("密码长度过小");
			$("#validPassError").show(); 
		} else {
			if(Evaluate(value) < 2){
				$('#validPassError').text("密码安全度低");	
				$("#validPassError").show(); 
			}else{
				$("_passWord").show();	
		 		$("#validPassError").hide();
			}
		}
	}else if(element == "ConfirmPassword"){
	 	var pw =  $("#Password").val();
	 	if(empty(value.toString())){
	 		$("#confPassError").text("请确认密码");
	 		$("#confPassError").show();	 		
	 	}else if(value.toString()!=pw.toString()){
	 		$("#confPassError").text("两次密码不一致");
	 		$("#confPassError").show();
	 	}else{
	 		$("_confPassWord").show();
	 		$("#confPassError").hide();
	 	}
	}
}

function Evaluate(word) {
	return word.replace(/^(?:(?=.{4})(?=.*([a-z])|.)(?=.*([A-Z])|.)(?=.*(\d)|.)(?=.*(\W)|.).*|.*)$/, "$1$2$3$4").length;
}
