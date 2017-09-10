//var base_path =;
var regMobile = /^1[3|4|5|8][0-9]\d{4,8}$/;//手机号码
var regCustomerNameCN =/^[\u4e00-\u9fa5]*$/;
var regCustomerNameEN =/^[a-zA-Z\/@#\$%\\*]*$/;
var regMail = /^[_a-zA-Z0-9_-_._-]+@([_a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,3}$/;//邮箱
var regNum = /^\d+$/;//数字

function empty(v) {
    switch (typeof v) {
    case 'undefined':
        return true;
    case 'string':
        if ($.trim(v).length == 0) return true;
        break;
    case 'object':
        if (null === v) return true;
        if (undefined !== v.length && v.length == 0) return true;
        break;
    }
    return false;
}

$(document).ready(function(){
	 //1:用户名填写校验错误展示
	 $("#userName").blur(function(){
	 	var nameVal =  $("#userName").val();
	 	if(empty(nameVal)){
	 		$("#_name").hide();	
	 		$("#nameError").text("用户名不能为空");
	 		$("#nameError").show();
	 	}else if(!regCustomerNameCN.test(nameVal) && !regCustomerNameEN.test(nameVal)){
	 		$("#_name").hide();	
			$("#nameError").text("用户名支持中文、字母和“/@#$%\*”的组合");
	 		$("#nameError").show(); 
		}else{
			$("_name").show();	
	 		$("#nameError").hide();
		}
	 });
	 
	 //2:手机号填写校验错误展示
	 $("#mobilePhone").blur(function(){
	 	var mobileVal =  $("#mobilePhone").val();
	 	if(empty(mobileVal)){
	 		$("#_mobile").hide();
	 		$("#mobileError").text("手机号不能为空");
	 		$("#mobileError").show();
	 	}else if(mobileVal.length!=11){
	 		$("#mobileError").text("请输入11位数的手机号");
	 		$("#_mobile").hide();	
	 		$("#mobileError").show();	 		
	 	}else if(!regMobile.test(mobileVal)){
	 		$("#mobileError").text("手机号格式不正确");
	 		$("#_mobile").hide();	
	 		$("#mobileError").show();
	 	}else{
	 		$("#_mobile").show();	
	 		$("#mobileError").hide();
	 	}
	 });
	 
	 //3:邮箱填写校验错误展示
	$("#emaili").blur(function(){
		var mailVal =  $("#emaili").val();
		if(empty(mailVal)){
	 		$("#_email").hide();
	 		$("#emailError").text("邮箱不能为空");
	 		$("#emailError").show();
	 	}else if(!regMail.test(mailVal)){
			$("#_email").hide();
	 		$("#emailError").text("邮箱的格式不正确");
	 		$("#emailError").show();
		}else{
			$("#emailError").hide();
		}
	 });
	
	//4:页面验证码填写校验错误展示
	 $("#ValidCode").blur(function(){
	 	var mailVal =  $("#ValidCode").val();
	 	if(empty(mailVal)){
	 		$("#_validCode").hide();
	 		$("#validCodeError").text("验证码不能为空");
	 		$("#validCodeError").show();
	 	}else if(mailVal.length != 5 || !regNum.test(mailVal)){
	 		$("#_validCode").hide();
	 		$("#validCodeError").text("验证码不正确，请重新输入");
	 		$("#validCodeError").show();
	 	}else{
	 		$("#validCodeError").hide();
	 	}
	 });

	//5:手机验证码填写校验错误展示
	 $("#MessageValidCode").blur(function(){
	 	var mailVal =  $("#MessageValidCode").val();
	 	if(empty(mailVal)){
	 		$("#_messageCode").hide();
	 		$("#messageCodeError").text("手机验证码不能为空");
	 		$("#messageCodeError").show();
	 	}else if(mailVal.length != 5 || !regNum.test(mailVal)){
	 		$("#_messageCode").hide();
	 		$("#messageCodeError").text("手机验证码不正确，请重新输入");
	 		$("#messageCodeError").show();
	 	}else{
	 		$("#messageCodeError").hide();
	 	}
	 });
	 
	 $("#registerSubmit").click( function(){
		// alert("hh");
		 clickRegiser();
	 });
	
})
/*
*//***************************************************************************************************
 * 提交表单AJAX提交校验验证码及手机号信息
 ***************************************************************************************************/
function clickRegiser() {
 	if(frontValidation() == false){
 		alert("注册失败：缺少相关注册信息！");
 		return false;
 	}else if(!document.getElementById("xieyi").checked){
	    alert("亲，您未阅读《Fx50协议》哦！");
	    return false;
	}else{
		
		 if(document.getElementById("mobile").style.display=="block"){
	 		//进行AJAX提交。1.校验验证码是否通过。2.校验此手机号是否已经与用户信息一致	
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"userName":$("userName").val(),"mobilePhone":$("#mobilePhone").val(),
					"ValidCode":$("#ValidCode").val(),"MessageValidCode":$("#MessageValidCode").val(),"Password":$("#Password").val(),
					"ConfirmPassword":$("ConfirmPassword").val()},
				url:"user/ajaxregister.htm",
				success:function(data){ return resultValidation(data);},
				error:function(data){alert("系统异常");return false;}
			});
		  }
		 if(document.getElementById("email").style.display=="block"){
	 		//进行AJAX提交。1.校验验证码是否通过。2.校验此手机号是否已经与用户信息一致	
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"userName":$("userName").val(),"emaili":$("#emaili").val(),
					"ValidCode":$("#ValidCode").val(),"Password":$("#Password").val(),
					"ConfirmPassword":$("ConfirmPassword").val()},
				url:"user/ajaxregister.htm",
				success:function(data){ return resultValidation(data);},
				error:function(data){alert("系统异常");return false;}
			}); 
		 }

		
 	}
 }
function resultValidation(data){
	if(data.flag == "true"){
		if(frontValidation()){
			document.forms.registerform.submit();
		}else{
			return false;
		}
	}else{
		if(data.flag == "length_error"){
			alert("超出长度限制！");
		}
		else if(data.flag == "validCode_error"){
			alert("验证码错误");
			$("#ValidCode").focus();
			$("#validCodeError").text("验证码错误，重新输入！");
			$("#validCodeError").show();
		}
		else if(data.flag == "error"){
			alert("系统故障，注册失败！");
		}
		return false;
	}
}

function frontValidation(){
		/*alert("前端验证！");*/
		
		var result1;
		var result2=true;
		var result3=true;
		var result4;
		var result5=true;
		var result6;
		var result7;
		
	 //1:用户名填写校验错误展示	 
	 	var nameVal =  $("#userName").val();
	 	if(empty(nameVal)){
	 		$("#_name").hide();	
	 		$("#nameError").text("用户名不能为空");
	 		$("#nameError").show();
	 		result1=false;
	 	}else if(!regCustomerNameCN.test(nameVal) && !regCustomerNameEN.test(nameVal)){
	 		$("#_name").hide();	
			$("#nameError").text("用户名支持中文、字母和“/@#$%\*”的组合");
	 		$("#nameError").show();
	 		result1=false;	 		
		}else{
			$("_name").show();	
	 		$("#nameError").hide();
	 		result1=true;
		}
	 //2:手机号填写校验错误提示
	 	if(document.getElementById("mobile").style.display.toString()=="block"){
		 	var mobileVal =  $("#mobilePhone").val();
		 	if(empty(mobileVal)){
		 		$("#_mobile").hide();
		 		$("#mobileError").text("手机号不能为空");
		 		$("#mobileError").show();
		 		result2=false;
		 	}else if(mobileVal.length!=11){
		 		$("#mobileError").text("请输入11位数的手机号");
		 		$("#_mobile").hide();	
		 		$("#mobileError").show();
		 		result2 = false;
		 	}else if(!regMobile.test(mobileVal)){
		 		$("#mobileError").text("手机号格式不正确");
		 		$("#_mobile").hide();	
		 		$("#mobileError").show();
		 		result2=false; 
		 	}else{
		 		$("#_mobile").show();	
		 		$("#mobileError").hide();
		 		result2 = true;
		 	}
	 	}
	 //3:邮箱填写校验错误提示
	 	if(document.getElementById("email").style.display=="block"){
			var mailVal =  $("#emaili").val();
			if(empty(mailVal)){
		 		$("#_email").hide();
		 		$("#emailError").text("邮箱不能为空");
		 		$("#emailError").show();
		 		result3 = false;
		 	}else if(!regMail.test(mailVal)){
				$("#_email").hide();
		 		$("#emailError").text("邮箱的格式不正确");
		 		$("#emailError").show();
		 		result3 = false;
			}else{
				$("#emailError").hide();
				result3 = true;
			}	 		
	 	}
	 //4:页面验证码填写校验错误提示
	 	var mailVal =  $("#ValidCode").val();
	 	if(empty(mailVal)){
	 		$("#_validCode").hide();
	 		$("#validCodeError").text("验证码不能为空");
	 		$("#validCodeError").show();
	 		result4 = false;
	 	}else if(mailVal.length != 5 || !regNum.test(mailVal)){
	 		$("#_validCode").hide();
	 		$("#validCodeError").text("验证码不正确，请重新输入");
	 		$("#validCodeError").show();
	 		result4= false;
	 	}else{
	 		$("#validCodeError").hide();
	 		result4 = true;
	 	}
	 //5:手机验证码填写校验错误提示
	 	if(document.getElementById("message_ValidCode").style.display=="block"){
		 	var mailVal =  $("#MessageValidCode").val();
		 	if(empty(mailVal)){
		 		$("#_messageCode").hide();
		 		$("#messageCodeError").text("短信验证码不能为空");
		 		$("#messageCodeError").show();
		 		result5 = false;
		 	}else if(mailVal.length != 5 || !regNum.test(mailVal)){
		 		$("#_messageCode").hide();
		 		$("#messageCodeError").text("短信验证码不正确，请重新输入");
		 		$("#messageCodeError").show();
		 		result5 = false;
		 	}else{
		 		$("#messageCodeError").hide();
		 		result5 = true;
		 	}
	 	}
	 //6:密码填写校验错误提示
	 	var mailVal =  $("#Password").val();
	 	if(empty(mailVal)){
	 		$("#validPassError").text("密码不能为空");
	 		$("#validPassError").show();
	 		result6 = false;
	 	}else if(mailVal.length < 8){
	 		$("#validPassError").text("密码长度过小");
	 		$("#validPassError").show();
	 		result6 = false;
	 	} else if(Evaluate(mailVal) < 2){
			$('#validPassError').text("密码安全度低");	
			$("#validPassError").show(); 
			result6 = false;
		}else{
			$("_passWord").show();	
		 	$("#validPassError").hide();
		 	result6= true;
		}
	 //7:密码确认填写校验错误提示
	 	var mailVal =  $("#Password").val();
	 	var pw =  $("#ConfirmPassword").val();
	 	if(empty(pw.toString())){
	 		$("#confPassError").text("请确认密码");
	 		$("#confPassError").show();
	 		result7 = false;
	 	}else if(mailVal.toString()!=pw.toString()){
	 		$("#confPassError").text("两次密码不一致");
	 		$("#confPassError").show();
	 		result7 = false;
	 	}else{
	 		$("_confPassWord").show();
	 		$("#confPassError").hide();
	 		result7 = true;
	 	}
	 	//alert(result1);
		if(result1&&result2&&result3&&result4&&result5&&result6&&result7){		
			/*alert("前端验证通过");*/
			return true;
		}else{
			
			alert("前端验证失败");
			return false;
		}	 	
}
 /***************************************************************************************************
 * 购卡联系人表单格式验证
 ***************************************************************************************************/
/*
function emptyValidation(){
	//1：验证购卡人姓名
	var nameVal = $("#userName").val();
	if(empty(nameVal)){
		$("#_name").hide();	
		$("#nameError").text("用户名不能为空");
		$("#nameError").show();
		$("#name").val("").focus().val(nameVal); 
		 return false;
	}		
	if(!regCustomerNameCN.test(nameVal) && !regCustomerNameEN.test(nameVal)){
		$("#nameError").text("购卡人姓名支持中文、字母和“/@#$%\*”的组合");
		$("#_name").hide();	
 		$("#nameError").show(); 
		$("#name").val("").focus().val(nameVal); 
		return false;
	}	
	
	//4:验证手机号码
	var mobileVal = $("#mobilePhone").val();
	if(empty(mobileVal)){
		$("#_mobile").hide();
 		$("#mobileError").text("手机号不能为空");
 		$("#mobileError").show();			
 		$("#mobilePhone").val("").focus().val(mobileVal); 
		return false;
	}
	if(!regMobile.test(mobileVal)){
		$("#mobileError").text("手机号格式不正确");
 		$("#_mobile").hide();	
 		$("#mobileError").show();			
 		$("#mobilePhone").val("").focus().val(mobileVal); 
		return false;
	}
	
	//5、手机验证码
	var mobileValidateCodeVal =  $("#mobileValidateCode").val();
 	if(empty(mobileValidateCodeVal)){
 		$("#mobileValidateCodeError").show();
 		return false;
 	}
 	if(mobileValidateCodeVal.length != 4 || !regNum.test(mobileValidateCodeVal)){
 		$("#mobileValidateCodeError").text("您输入的手机验证码不正确，请重新输入");
 		$("#mobileValidateCodeError").show();
 		$("#mobileValidateCode").val("").focus();
 		return false;
 	}
 	
	//6:验证重发密码验证问题
	var questionVal = $("#question").val();
	if(empty(questionVal)){
		$("#question").val("").focus().val(questionVal); 
		return false;
	}
	
	//7:验证答案
	var answerVal = $("#answer").val();
	if(empty(answerVal)){
		$("#_answer").hide();	
 		$("#answerError").show();			
 		$("#answer").val("").focus().val(answerVal); 
		return false;
	}
	if(!patternValidate(answerVal)){
		$("#_answer").hide();
 		$("#answerError").text("您输入的答案包含非法字符。请重新输入");
 		$("#answerError").show();			
 		$("#answer").val("").focus().val(answerVal); 
		return false;
 	}
	
	//8:验证邮箱
	var mailVal = $("#mail").val(); 
	if(!empty(mailVal) && !regMail.test(mailVal)){
		$("#mailError").text("邮箱的格式不正确");
 		$("#mailError").show();
		$("#mail").val("").focus().val(mailVal); 
		return false;
	}	
	
	//9、常旅客号
	var ffpNoVal = $("#ffpNo").val();
	if(!empty(ffpNoVal) && !patternValidate(ffpNoVal)){
 		$("#ffpNoError").text("您输入的常旅客号包含非法字符。请重新输入");
 		$("#ffpNoError").show();
 		$("#ffpNo").val("").focus().val(ffpNoVal); 
		return false;
	}
	if(!empty(ffpNoVal) && (ffpNoVal.length != 11) && (ffpNoVal.length != 9)){
 		$("#ffpNoError").text("您输入的常旅客号不正确。请重新输入");
 		$("#ffpNoError").show();
 		$("#ffpNo").val("").focus().val(ffpNoVal); 
		return false;
	}
	if((ffpNoVal.length == 11 && (!regNum.test(ffpNoVal.substring(2,ffpNoVal.length)) || !regEn.test(ffpNoVal.substring(0,2)))) ||
			(ffpNoVal.length == 9 && !regNum.test(ffpNoVal))){
		$("#ffpNoError").text("您输入的常旅客号不正确。请重新输入");
 		$("#ffpNoError").show();
 		$("#ffpNo").val("").focus().val(ffpNoVal); 
		return false;
	}
	
	//10、验证购卡人地址
 	var selProvinceVal = $("#selProvince").val();
 	var selCity = $("#selCity").val();
	var addressVal = $("#address").val();
	if(empty(selProvinceVal)){
		$("#buyCardAdress").hide();
		$("#_address").hide();
 		$("#addressError").text("请选择省份");
 		$("#addressError").show();
		return false;
	}
	if(empty(selCity)){
		$("#buyCardAdress").hide();
		$("#_address").hide();
 		$("#addressError").text("请选择城市");
 		$("#addressError").show();
		return false;
	}
	if(empty(addressVal)){
		$("#buyCardAdress").hide();
		$("#_address").hide();
 		$("#addressError").text("地址不能为空");
 		$("#addressError").show();
		$("#address").val("").focus().val(addressVal); 
		return false;
	}
	
	//11、如果需要发票。则验证发票表单
	var radioVal = $('input:radio[name="radio"]:checked').val();
	if($("#checkbox").attr("checked")=="checked"){
		var unitNameVal = $("#unitName").val();
		if(radioVal == "单位"){
			if(unitNameVal == ""){
				$("#_unitName").hide();	
		 		$("#unitNameError").show();
				$("#unitName").val("").focus().val(unitNameVal); 
				return false;
			}
		}
		
		var contactNameVal = $("#contactName").val();
		if(empty(contactNameVal)){
			$("#_contactName").hide();	
			$("#contactNameError").text("联系人姓名不能为空");
	 		$("#contactNameError").show();
			$("#contactName").val("").focus().val(contactNameVal); 
			return false;
		}
		if(!empty(contactNameVal) && (!regChina.test(contactNameVal) && !regEn.test(contactNameVal) || !patternValidate(contactNameVal))){
			$("#_contactName").hide();	
			$("#contactNameError").text("联系人姓名可为中、英文，但是不能有字符数字");
	 		$("#contactNameError").show();
			$("#contactName").val("").focus().val(contactNameVal); 
			return false;
		}	
		
		var contactPhoneVal = $("#contactPhone").val();
		if(empty(contactPhoneVal)){
			$("#_contactPhone").hide();
	 		$("#contactPhoneError").text("联系人手机不能为空");
	 		$("#contactPhoneError").show();
			$("#contactPhone").val("").focus().val(contactPhoneVal); 
			return false;
		}
		if(!regMobile.test(contactPhoneVal)){
			$("#contactPhoneError").text("手机号码格式不正确");
	 		$("#_contactPhone").hide();	
	 		$("#contactPhoneError").show();
			$("#contactPhone").val("").focus().val(contactPhoneVal); 
			return false;
		}
		
		//验证发票地址
		var invoiceSelProvinceVal = $("#invoiceSelProvince").val();
		if(empty(invoiceSelProvinceVal)){
			$("#buyCardInvoiceAdress").hide();
			$("#_invoiceAddress").hide();
			$("#invoiceAddressError").text("请选择省市");
			$("#invoiceAddressError").show();
			return false;
		}
		var invoiceCityVal = $("#invoiceCity").val();
		if(empty(invoiceCityVal)){
			$("#buyCardInvoiceAdress").hide();
			$("#_invoiceAddress").hide();
			$("#invoiceAddressError").text("请选择城市");
			$("#invoiceAddressError").show();
			return false;
		}
		var invoiceAddressVal = $("#invoiceAddress").val();
		if(empty(invoiceAddressVal)){
			$("#buyCardInvoiceAdress").hide();
			$("#_invoiceAddress").hide();
		 	$("#invoiceAddressError").text("地址不能为空");
		 	$("#invoiceAddressError").show();
			$("#invoiceAddress").val("").focus().val(invoiceAddressVal); 
			return false;
		}
		if(invoiceAddressVal.indexOf("信箱") != -1){
	 		$("#_invoiceAddress").hide();
	 		$("#invoiceAddressError").hide();
	 		$("#invoiceAddressError2").text("注意：邮寄地址请勿填写***信箱，否则快递将无法送达。");
	 		$("#buyCardInvoiceAdress").show();
	 		$("#invoiceAddress").val("").focus().val(invoiceAddressVal); 
			return false;
	 	}
		
		var zipCodeVal = $("#zipCode").val();
		if(empty(zipCodeVal)){
			$("#_zipCode").hide();
	 		$("#zipCodeError").text("邮编不能为空");
	 		$("#zipCodeError").show();
			$("#zipCode").val("").focus().val(zipCodeVal); 
			return false;
		}
		if(!regZip.test(zipCodeVal)){
			$("#zipCodeError").text("邮编格式不正确");
	 		$("#zipCodeError").show();
	 		$("#_zipCode").hide();
			$("#zipCode").val("").focus().val(zipCodeVal); 
			return false;
		}
	}
	return true;
}*/


function showRegister(){
	var fram = document.getElementById("frame");
	fram.style.display = "block";
}

function showMobileRegister(){
	showRegister();
	var fram = document.getElementById("mobile");
	var fram1 = document.getElementById("email");
	var fram2 = document.getElementById("message_ValidCode");
	var fram3 = document.getElementById("emailRegister");
	var fram4 = document.getElementById("mobileRegister");
	fram.style.display = "block";
	fram1.style.display = "none";
	document.getElementById("email").value="";
	fram2.style.display = "block";
	fram3.style.border= "1px solid #ffffff"; 
	fram4.style.border = "1px solid #ff0000";
}

function showEmailRegister(){
	showRegister();
	var fram = document.getElementById("mobile");	
	var fram1 = document.getElementById("email");
	var fram2 = document.getElementById("message_ValidCode");
	var fram3 = document.getElementById("mobileRegister");
	var fram4 = document.getElementById("emailRegister");
	fram.style.display = "none";
	document.getElementById("mobile").value="";
	fram1.style.display = "block";
	fram2.style.display = "none";
	document.getElementById("message_ValidCode").value="";	
	fram3.style.border = "1px solid #ffffff";
	fram4.style.border = "1px solid #ff0000";
}

/** 
 * 鼠标移上去显示层 
 * @param divId 显示的层ID 
 * @returns 
 */  
function xxx(){
	 $('#viewReInfo').myHoverTip("xieyi_float_box");
}

$.fn.myHoverTip = function(divId){
    var div = $("#" + divId); //要浮动在这个元素旁边的层  
    div.css("position", "absolute");//让这个层可以绝对定位  
    var self = $(this); //当前对象  
    self.hover(function() {  
        div.css("display", "block");  
		var p = self.position(); //获取这个元素的left和top  
        var x = p.left + self.width();//获取这个浮动层的left  
        var docWidth = $(document).width();//获取网页的宽  
        if (x > docWidth - div.width() - 20) {  
            x = p.left - div.width();  
        }  
        /* div.css("left", x);  */ 
        div.css("top", p.top);
        div.show();  
    }
/*     function() {  
        div.css("display", "none");  
    } */  
    );  
    return this;  
} 



$(function() {
   $('#viewReInfo').hover(function() {
	   $('#xieyi_float_box').show();
   })
})
   
function MM_over(){
	var mSubObj = document.getElementById("xieyi_float_box");
	mSubObj.style.display = "block";
	//scrollTo(0,0);//直接返回页面顶部协议展示
}
function MM_out(){
	var mSubObj = document.getElementById("xieyi_float_box");
	mSubObj.style.display = "none";						
}

function Register(){
	alert("hh");
	
}
