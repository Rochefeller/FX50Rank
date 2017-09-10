$(document).ready(function(){
	$("#searchByRate").click(function(){
		//parasfixed();
		document.forms.formRate.submit();
	});
	$("#searchByBrokerAndName").click(function(){
		document.forms.formRate.submit();
	});
	/*$("#searchByLots").click(function(){
		document.forms.formLots.submit();
	});
	$("#searchByDrowndown").click(function(){
		document.forms.formRate.submit();
	});*/
})

function autoparasfixed(valueinvest, valuerate, valueloss){

	$("#summaryMethodinvest").val(valueinvest);
	$("#summaryMethodrate").val(valuerate);
	$("#summaryMethodloss").val(valueloss);
	
}

function searchByRate(){
	document.forms.formRateDefault.submit();
}

function obtainTraderInfoPage(row){
	var account_id = row["account_id"];
	var n = row["n"];
	var invest=row["planInvest"];
	//alert("n="+n);
	//alert("invest"+invest);
	$("#traderAccount_id").val(account_id);
	$("#traderN").val(n);
	$("#traderInvest").val(invest);
	document.forms.form1.submit();	
}

function obtainSearchInfoPage(row){
	var account_id = row["account_id"];
	$("#traderAccount_id").val(account_id);
	document.forms.form1.submit();	
}
