<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FX50TOP</title>
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link
	href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- 在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!--jquery.validate-->
<script type="text/javascript" src="${ctxStatic}/jQuery/jquery.validate.min.js"></script>

<style type="text/css">
body {
	background: url(${ctxStatic}/images/4.jpg) no-repeat;
	background-size: cover;
	font-size: 16px;
}

.form {
	background: rgba(255, 255, 255, 0.2);
	width: 400px;
	margin: 100px auto;
}

#login_form {
	display: block;
}

#register_form {
	display: none;
}

.fa {
	display: inline-block;
	top: 27px;
	left: 6px;
	position: relative;
	color: #ccc;
}

input[type="text"], input[type="password"] {
	padding-left: 26px;
}

.checkbox {
	padding-left: 21px;
}
</style>
</head>
<body>
	<!--  
            基础知识：  
            网格系统:通过行和列布局  
            行必须放在container内  
            手机用col-xs-*  
            平板用col-sm-*  
            笔记本或普通台式电脑用col-md-*  
            大型设备台式电脑用col-lg-*  
            为了兼容多个设备，可以用多个col-*-*来控制；  
        -->
	<div class="container">
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3"
				id="login_form" action="${ctx}/login.htm/submit.htm" role="form">
				<div class="col-sm-9 col-md-9">
				<h3 class="form-title" align="center">登&nbsp&nbsp&nbsp&nbsp录</h3>
				</div>
				<div class="col-sm-9 col-md-9">
					<!-- <div class="form-group">
						<i class="fa fa-user fa-lg"></i> <input
							class="form-control required" type="text" placeholder="Username"
							name="username" autofocus="autofocus" maxlength="20" />
					</div> -->
					<div class="form-group">
						<i class="fa fa-phone"></i> <input
							class="form-control required" type="text" placeholder="电话号码"
							name="mobilePhone" autofocus="autofocus" maxlength="20" />
					</div>
					<div class="form-group">
						<i class="fa fa-lock fa-lg"></i> <input
							class="form-control required" type="password"
							placeholder="密码" name="password" maxlength="15" />
					</div>
					<div class="form-group">
						<label class="checkbox"> <input type="checkbox"
							name="remember" value="1" /> 记住我
						</label>
						<hr />
						<!-- 
						<a href="javascript:;" id="register_btn" class="" ><font color="#FF0000">创建新账户</font></a>
						-->
						<a id="register_btn" class="" ><font color="#FF0000">创建新账户</font></a>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right"
							value="Login " />
					</div>
				</div>
			</form>
		</div>

		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3"
				id="register_form" action="${ctx}/login.htm/register.htm" role="form">
				<h3 class="form-title">注册新账户</h3>
				<div class="col-sm-9 col-md-9">
					<!-- 
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i> <input
							class="form-control required" type="text" placeholder="用户名"
							name="userName" autofocus="autofocus" />
					</div>
					 -->
					<div class="form-group">
						<i class="fa fa-phone"></i> <input id = "mobilePhone"
							class="form-control required" type="text" placeholder="电话号码"
							name="mobilePhone" autofocus="autofocus" maxlength="12" />
					</div>
					
					<div class="form-group">
						 <i class="fa fa-arrows"></i> <input id = "validationCode" class="form-control required" type="text" placeholder="验证码"
							name="validationCode" autofocus="autofocus" maxlength="12" />
						 <div class="input-group text-center pull-right">
		                    <button type="button" class="btn btn-primary pull-right" id="acquire_validation_code">获取验证码<tton>
						 </div>
					</div>
					
					<div class="form-group">
						 <i class="fa fa-filter"></i> <input class="form-control required" type="text" placeholder="邀请码"
							name="inviteCode" autofocus="autofocus" maxlength="12" />
					</div>
					
					<div class="form-group">
						<i class="fa fa-lock fa-lg"></i> <input
							class="form-control required" type="password"
							placeholder="密码" id="register_password" name="password" />
					</div>
					<div class="form-group">
						<i class="fa fa-check fa-lg"></i> <input
							class="form-control required" type="password"
							placeholder="再次输入密码" name="rpassword" />
					</div>
					<!-- 
					<div class="form-group">
						<i class="fa fa-envelope fa-lg"></i> <input
							class="form-control eamil" type="text" placeholder="邮箱"
							name="userEmail" />
					</div>
					-->
					
					
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right"
							value="注册" /> 
							<!-- <input type="submit"
							class="btn btn-info pull-left" id="back_btn" value="Back" /> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStatic}/js/login.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#acquire_validation_code").click(function(){
				mobilePhone = $("#mobilePhone").val();
				var param={"mobilePhone":mobilePhone};
				alert(mobilePhone);
				$.ajax({
			 		url:"${ctx}/login.htm/getValidationCode.htm",
				 	type:"POST",
				 	data:param,
			 		dataType:'json',
			 		beforeSend: function () {
				    	$("#submit").prop("disabled",true);
				    },
			 		success:function(result){
			 			
				 	},
				 	complete: function () {
						$("#submit").prop("disabled",false);
			     	},
		  		});
			});
		});
	
	
	</script>
</body>
</html>