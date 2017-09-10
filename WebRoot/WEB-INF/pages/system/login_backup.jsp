<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>FX50TOP</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- jQuery 1.9.1 -->
	<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	
	<!-- jQuery cookie -->
	<script src="${ctxStatic}/jquery-cookie/jquery.cookie.js" type="text/javascript"></script>
	
	<!--i18next -->
	<script src="${ctxStatic}/i18next/i18next-1.9.0.js" type="text/javascript"></script>
	
	<!-- jQuery validate -->
	<link href="${ctxStatic}/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
	
	<!-- Bootstrap -->
	<link href="${ctxStatic}/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/bootstrap/js/bootstrap.js" type="text/javascript"></script>
	
	<!-- Font awesome -->
	<link rel="stylesheet" href="${ctxStatic}/font-awesome/css/font-awesome.css"/>	 
	  
	<!-- Customize CSS -->
	<link rel="stylesheet" href="${ctxStatic}/css/style.css"/>
	<!-- Bootstrap Dialog -->
		<link href="${ctxStatic}/bootstrap-dialog/css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />
		<script src="${ctxStatic}/bootstrap-dialog/js/bootstrap-dialog.js"></script>
	
	<style type="text/css">
		body,html {
			width: 100%;
			height: 100%;
			background: #F3F5F5
		}
		
		#body {
			height: calc(100% - 65px)
		}
		
		header {
			background: #FEFEFE;
			box-shadow: 0 0 10px rgba(0,0,0,.3)
		}
		
		header ul.z_navbar li a {
			color: #545454
		}
		
		header ul.c_navbar li.float_left a.font_size {
			color: #545454;
			border: 1px solid #545454
		}
		
		.divcenter {
			width: 100%;
			height: calc(100% - 65px)
		}
		
		button.active {
			outline: 0;
			border: none
		}
		
		#signpuBj {
			width: 100%;
			height: 85%;
			position: absolute;
			top: 65px
		}
		
		a:hover {
			text-decoration: none
		}
		
		#signup {
			background: #fff;
			box-shadow: 0 0 10px rgba(0,0,0,.3)
		}
		
		.signup {
			position: absolute;
			height: 510px;
			width: 510px;
			top: calc(50% - 220px);
			left: calc(50% - 255px)
		}
		
		.login,.reset,.resetPawd {
			position: absolute;
			height: 350px;
			width: 510px;
			top: calc(50% - 150px);
			left: calc(50% - 255px)
		}
		
		.signup-title {
			color: #7C838C;
			font-size: 30px;
			padding: 0;
			height: 70px;
			line-height: 70px;
			text-align: center;
			border-bottom: 1px solid #EDEDED;
			margin-bottom: 35px
		}
		
		.form-group {
			position: relative;
			left: 100px
		}
		
		.form-group i {
			position: absolute;
			left: 10px;
			top: 12px;
			opacity: .6
		}
		
		input,input:focus {
			outline: 0;
			box-shadow: none;
			border: 1px solid #bbb;
			padding: 3px 5px
		}
		
		input:autofill {
			background-color: none
		}
		
		input:focus {
			border: 1px solid #1ab394;
			outline: 0;
			box-shadow: 0 0 10px #1ab394;
			-webkit-transition: all .218s;
			-moz-transition: all .218s;
			-o-transition: all .218s;
			-ms-transition: all .218s;
			transition: all .218s
		}
		
		#signup input {
			width: 300px;
			height: 40px;
			text-indent: 15px;
			border-radius: 2px;
			background: #F8F8F9;
			font-weight: 400
		}		
		
		.input_on {
			background-color: #FFF
		}
		
		#signup .form-group .glyphicon-ok {
			color: #00f
		}
		
		#captchaimg {
			background: #fff;
			margin-left: 10px;
			border-radius: 15px 0;
			width: 100px;
			cursor: pointer
		}
		
		#signup .form-group img.e,img.c,img.i,img.p {
			position: relative;
			left: 10px;
			top: 0
		}
		
		#signup .form-group #captcha {
			width: 180px
		}
		
		.checkbox {
			line-height: 20px;
			height: 20px;
			font-size: 12px;
			margin-left: 100px
		}
		
		.checkbox #agree {
			width: 20px;
			height: 18px;
			font-size: 12px;
			margin-top: 2px
		}
		
		.checkbox a {
			color: #3F60EC;
			position: relative;
			top: -4px
		}
		
		.checkbox .terms {
			top: 0
		}
		
		.checkbox.signupPage {
			margin-left: 120px
		}
		
		.checkbox span.t {
			color: #878788
		}
		
		.form-signup {
			margin-top: 15px;
			position: relative;
			left: 100px
		}
		
		.form-signup button {
			width: 300px;
			height: 40px;
			border-radius: 5px;
			color: #fff;
			font-size: 16px
		}
		
		.btn-block {
			background: #1ab394;
			transition: .3s
		}
		
		.btn:focus,.btn:hover {
			color: #fff;
			background: #1ab394;
			outline: 0
		}
		
		p.p {
			color: #878788;
			margin-left: 100px;
			padding-top: 10px;
			font-size: 12px
		}
		
		#loginResult {
			width: 300px;
			text-indent: 30px;
			height: 40px;
			line-height: 40px;
			border-radius: 5px;
			color: #fff;
			font-size: 12px;
			position: absolute;
			top: 60px;
			left: 104px;
			background: #EF6578
		}
		
		.close_init {
			float: right;
			font-size: 16px;
			margin-right: 20px;
			margin-top: 12px;
			cursor: pointer
		}
		
		.reset_center {
			width: 400px;
			height: 150px;
			margin-top: 80px;
			margin-left: 70px
		}
		
		.reset_center>p {
			font-size: 16px;
			color: #858585
		}
		
		.event-top {
			margin-top: 30px
		}
		
		.btn-reset,.login-block {
			padding: 5px 12px;
			margin: 0 5px;
			border: 1px solid #4280CB;
			border-radius: 0
		}	
		
		.btn-login {
			background: #3F87C4;
			color: #fff;
			padding: 10px 40px;
			font-size: 16px;
			letter-spacing: 2px;
			position: absolute;
			left: 150px;
			bottom: 0
		}
	</style>
</head>
<body id="body">
	<!-- 顶部导航栏，后续通过@include的方式加载 -->
	<header class="navbar navbar-default navbar-static-top" style="margin-bottom: 0px;">
		<div class="container-fluid">
			<div class="navbar-header">				
				<a class="navbar-brand" href="${ctx}" data-i18n="app.name"></a>
			</div>			
		</div>
	</header><!-- 顶部导航栏 END-->
	
	<div class="divcenter">
		<form id="signup" method="post" action="${ctx}/login/submit" role="form" class="login">
			<div class="signup-title" data-i18n="login.submit">登&nbsp;&nbsp;录</div>
			
			<c:if test="${not empty message }">
				<div class="form-group">
					<p class="error">* ${message }</p>
				</div>
			</c:if>
			<div class="form-group">
				<label form="username" class="control-label">
					<input type="text" id="username" name="userName" placeholder="用户名" class="required email" data-i18n="[placeholder]table.username"/>
				</label>
			</div>
			<div class="form-group">
				<label form="password" class="control-label"> 
					<input id="password" name="password" placeholder="密码" type="password" class="required" data-i18n="[placeholder]table.password"/>
				</label>
			</div>			
			<div class="form-signup">
				<button id="loginBtn" class="btn btn-block" data-i18n="login.submit">登录</button>
				<input id="loginStatus" type="hidden">
			</div>
			<div id="register" class="form-group" align="center">
			   <font color="blue">注册新用户</font>
			</div>				
		</form>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#signup").validate();
			});
			i18n.init({		
				cookieName: 'lang' ,
				lng: $.cookie('lang'),
				resGetPath: '${ctxStatic}/i18next/locales/__lng__/__ns__.json'},function(t) {
			  		$("body").i18n();			
			});
			
			$(function(){          
				$(".page-language").click(function(){
					var lang = $(this).attr("lang");
					$.cookie('lang',lang);
					i18n.init({ 
						lng: lang,
						resGetPath: '${ctxStatic}/i18next/locales/__lng__/__ns__.json'},function(t) {
					  $("body").i18n();			
					});
				});
				(function($)  
						{  
						    $.extend(  
						    {  
						        NV:function(name)  
						        {  
						var NV = {};  
						var UA = navigator.userAgent.toLowerCase();  
						try  
						{  
						    NV.name=!-[1,]?'ie':  
						    (UA.indexOf("firefox")>0)?'firefox':  
						    (UA.indexOf("chrome")>0)?'chrome':  
						    window.opera?'opera':  
						    window.openDatabase?'safari':  
						    'unkonw';  
						}catch(e){};  
						try  
						{  
						    NV.version=(NV.name=='ie')?UA.match(/msie ([\d.]+)/)[1]:  
						    (NV.name=='firefox')?UA.match(/firefox\/([\d.]+)/)[1]:  
						    (NV.name=='chrome')?UA.match(/chrome\/([\d.]+)/)[1]:  
						    (NV.name=='opera')?UA.match(/opera.([\d.]+)/)[1]:  
						    (NV.name=='safari')?UA.match(/version\/([\d.]+)/)[1]:  
						    '0';  
						}catch(e){};  
						try  
						{  
						    NV.shell=(UA.indexOf('360ee')>-1)?'360极速浏览器':  
						    (UA.indexOf('360se')>-1)?'360安全浏览器':  
						    (UA.indexOf('se')>-1)?'搜狗浏览器':  
						    (UA.indexOf('aoyou')>-1)?'遨游浏览器':  
						    (UA.indexOf('theworld')>-1)?'世界之窗浏览器':  
						    (UA.indexOf('worldchrome')>-1)?'世界之窗极速浏览器':  
						    (UA.indexOf('greenbrowser')>-1)?'绿色浏览器':  
						    (UA.indexOf('qqbrowser')>-1)?'QQ浏览器':  
						    (UA.indexOf('baidu')>-1)?'百度浏览器':  
						    '未知或无壳';  
						}catch(e){}  
						            switch(name)  
						            {  
						                case 'ua':  
						                case 'UA':br=UA;break;  
						                case 'name':br=NV.name;break;  
						                case 'version':br=NV.version;break;  
						                case 'shell':br=NV.shell;break;  
						                default:br=NV.name;  
						            }  
						            return br;  
						        }  
						    });  
						})(jQuery); 
				var lang = $.cookie('lang');
					var browser=$.NV('name');
					if("firefox"!=browser){
						BootstrapDialog.show({
							 title: 'en'==lang?"Notice":"提示",
							            message: 'en'==lang?"Please Use Firefox to Visit OSS":"请使用Firefox访问OSS",
							            buttons: [{
							            	 label: 'en'==lang?"Close":"关闭",
								             cssClass: 'btn-primary',
							                 action: function(dialog) {
							                    dialog.close();
							                }
							            }]
				        });
						$("#loginBtn").attr('disabled','disabled');
				}
			});
		</script>
	</div>
</body>
</html>