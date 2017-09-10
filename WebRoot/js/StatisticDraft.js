
function profitChart(){
	//alert("profitChart");
	var psLineChar1 = echarts.init(document.getElementById('tabs-1'));
	var psLineChar2 = echarts.init(document.getElementById('tabs-2'));
	var psLineChar3 = echarts.init(document.getElementById('tabs-3'));
	var psLineChar4 = echarts.init(document.getElementById('tabs-4'));
	var psLineChar5 = echarts.init(document.getElementById('tabs-5'));
	var psLineChar6 = echarts.init(document.getElementById('tabs-6'));
	var psLineChar7 = echarts.init(document.getElementById('tabs-7'));
	var psLineChar8 = echarts.init(document.getElementById('tabs-8'));
	
	function loadDrugs() {  
	    psLineChar1.clear();
	    psLineChar1.showLoading({text: '正在努力的读取数据中...'});
	    $.getJSON('profitDraft.htm', function (data) {  
	        if(data.success){        	
	        	//alert(data.data);
	        	psLineChar1.setOption(JSON.parse(data.optionProfit), true);
	        	psLineChar1.hideLoading(); 
	        	psLineChar2.setOption(JSON.parse(data.optionPips), true);
	        	psLineChar2.hideLoading();
	        	psLineChar3.setOption(JSON.parse(data.optionBalance),true);
	        	psLineChar3.hideLoading();
	        	psLineChar4.setOption(JSON.parse(data.optionGainMonth),true);
	        	psLineChar4.hideLoading();
	        	psLineChar5.setOption(JSON.parse(data.optionGainRateMonth),true);
	        	psLineChar5.hideLoading();
	        	psLineChar6.setOption(JSON.parse(data.optionProductStatistic),true);
	        	psLineChar6.hideLoading();
	        	psLineChar7.setOption(JSON.parse(data.optionDrowDownRate),true);
	        	psLineChar7.hideLoading();
	        	psLineChar8.setOption(JSON.parse(data.optionWtrGrowth),true);
	        	psLineChar8.hideLoading();
	        }
	        else{
	        	alert("提示！");
	        }
	  
	    }); 
	} 
	//载入图表  
    loadDrugs();

}


function obtainStatisticParameters(){
	$.ajax({
		type:"post",
		dataType:"json",
		data:{"accountId":10046919},
		url:"user/obtainStatisticParas.htm",
		success: function(data){alert('success')},
		error: function(data){alert('error')}
	});
}


function RankprofitChart(account_id){

	var psLineChar1 = echarts.init(document.getElementById('maxlots'));
	var psLineChar2 = echarts.init(document.getElementById('orders'));
	var psLineChar3 = echarts.init(document.getElementById('openLots'));
	var psLineChar4 = echarts.init(document.getElementById('orderNetprofit'));
	var psLineChar5 = echarts.init(document.getElementById('orderPips'));
	var psLineChar6 = echarts.init(document.getElementById('orderSymbols'));
	function loadDrugs() {  
	    psLineChar1.clear();
	    psLineChar1.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar2.clear();
	    psLineChar2.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar3.clear();
	    psLineChar3.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar4.clear();
	    psLineChar4.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar5.clear();
	    psLineChar5.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar6.clear();
	    psLineChar6.showLoading({text: '正在努力的读取数据中...'});
	    $.getJSON('RankprofitDraft.htm', {account_id:account_id},  function (data) {  
	        if(data.success){        	
	        	//alert(data.data);
	        	psLineChar1.setOption(JSON.parse(data.optionMaxLots), true);
	        	psLineChar1.hideLoading(); 
	        	psLineChar2.setOption(JSON.parse(data.optionOrders), true);
	        	psLineChar2.hideLoading();
	        	psLineChar3.setOption(JSON.parse(data.optionOpenLots), true);
	        	psLineChar3.hideLoading(); 
	        	psLineChar4.setOption(JSON.parse(data.optionOrderNetprofit), true);
	        	psLineChar4.hideLoading(); 
	        	psLineChar5.setOption(JSON.parse(data.optionOrderPips), true);
	        	psLineChar5.hideLoading(); 
	        	psLineChar6.setOption(JSON.parse(data.optionOrderSymbols), true);
	        	psLineChar6.hideLoading(); 
	        }
	        else{
	        	alert("提示！");
	        }
	  
	    }); 
	} 
	//载入图表  
    loadDrugs();
}
 

function searchByRate(){
	document.forms.formRateDefault.submit();
}

$(document).ready(function(){
	$("#accountStatAndOrders").click(function(){
		//parasfixed();
		document.forms.accountStatAndOrdersForm.submit();
	});
	$("#accountOrderLots").click(function(){
		//parasfixed();
		document.forms.accountOrderLotsForm.submit();
	});
	$("#accountProfitAndLoss").click(function(){
		document.forms.orderProfitAndLossForm.submit();
	});
	$("#accountHistoryDrowndown").click(function(){
		document.forms.historyDrowDownForm.submit();
	});
	$("#accountFloating").click(function(){
		document.forms.accountFloatingForm.submit();
	});
	
})
