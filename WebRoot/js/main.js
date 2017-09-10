/**主页面加载时，自动提交到后台去获取收益排行交易员信息，并展示到前台**/
function main(){
	//alert("静态页面加载完毕后自动执行");
	$.ajax({
		type:"post",
		dataType:"json",
		data:{"mainPage":'mainPage'},
		url:"mainPage.htm",
		success:function(data){
			var id=data.userName;
			//alert(id);
			//document.getElementById("jiaoyiyuan1").href="userInfo.jsp?"+"accountid="+id;//后台定时推送4个交易员信息
			document.getElementById("jiaoyiyuan1").href="javascript:click()";//后台定时推送4个交易员信息
		},
		error:function(data){alert("error!")}
	});
}

function click(){
/*	$.ajax({
		type:"post",
		dataType:"json",
		data:{"accountId":10046919},
		url:"obtainStatisticParas.htm",
		success: function(data){alert('success')},
		error: function(data){alert('error')}
	});*/
	document.forms.form1.submit();
}