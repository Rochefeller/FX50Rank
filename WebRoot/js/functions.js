function obtainTraderInfoPage(){
	document.forms.formTemp.submit();	
}

function ProfitAndLossChart(account_id){

	var psLineChar1 = echarts.init(document.getElementById('orderNetWorth'));
	var psLineChar2 = echarts.init(document.getElementById('orderNetPips'));
	var psLineChar3 = echarts.init(document.getElementById('orderProfitDrowdown'));
	var psLineChar4 = echarts.init(document.getElementById('orderPipsDrowdown'));
	function loadDrugs() {  
	    psLineChar1.clear();
	    psLineChar1.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar2.clear();
	    psLineChar2.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar3.clear();
	    psLineChar3.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar4.clear();
	    psLineChar4.showLoading({text: '正在努力的读取数据中...'});
	    $.getJSON('drawOrderProfitAndLoss.htm', {account_id:account_id},  function (data) {  
	        if(data.success){        	
	        	//alert(data.data);
	        	psLineChar1.setOption(JSON.parse(data.optionNetWorth), true);
	        	psLineChar1.hideLoading();
	        	psLineChar2.setOption(JSON.parse(data.optionNetPips), true);
	        	psLineChar2.hideLoading(); 
	        	psLineChar3.setOption(JSON.parse(data.optionProfitDrowdown), true);
	        	psLineChar3.hideLoading(); 
	        	psLineChar4.setOption(JSON.parse(data.optionPipsDrowdown), true);
	        	psLineChar4.hideLoading(); 
	        }
	        else{
	        	alert("提示！");
	        }
	  
	    }); 
	} 
	//载入图表  
    loadDrugs();
}

function HisDrowDownChart(account_id,planN,planInvest){
	//var psLineChar1 = echarts.init(document.getElementById('accountProfitDrowDown'));
	var psLineChar2 = echarts.init(document.getElementById('accountGrowth'));
	var psLineChar3 = echarts.init(document.getElementById('accountDrowDownRate'));
	var psLineChar4 = echarts.init(document.getElementById('accountMonthNetWorth'));
	var psLineChar5 = echarts.init(document.getElementById('accountMonthGrowth'));
	var psLineChar6 = echarts.init(document.getElementById('accountMonthPips'));
	function loadDrugs() {  
	    //psLineChar1.clear();
	    //psLineChar1.showLoading({text: '正在努力的读取数据中...'});
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
	    $.getJSON('drawAccountHisDrowdown.htm', {account_id:account_id,planN:planN,planInvest:planInvest},  function (data) {  
	        if(data.success){        	
	        	//alert(data.data);
	        	//psLineChar1.setOption(JSON.parse(data.optionProfitDrowDown), true);
	        	//psLineChar1.hideLoading();
	        	psLineChar2.setOption(JSON.parse(data.optionGrowth), true);
	        	psLineChar2.hideLoading(); 
	        	psLineChar3.setOption(JSON.parse(data.optiontDrowDownRate), true);
	        	psLineChar3.hideLoading(); 
	        	psLineChar4.setOption(JSON.parse(data.optionMonthNetWorth), true);
	        	psLineChar4.hideLoading(); 
	        	psLineChar5.setOption(JSON.parse(data.optionMonthGrowth), true);
	        	psLineChar5.hideLoading(); 
	        	psLineChar6.setOption(JSON.parse(data.optionMonthPips), true);
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

function AccountFloatingChart(account_id){
	var psLineChar1 = echarts.init(document.getElementById('accountFloatingCPWL'));
	var psLineChar2 = echarts.init(document.getElementById('accountFloatingKDD'));
	var psLineChar3 = echarts.init(document.getElementById('accountFloatingSumProfit'));
	function loadDrugs() {  
	    psLineChar1.clear();
	    psLineChar1.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar2.clear();
	    psLineChar2.showLoading({text: '正在努力的读取数据中...'});
	    psLineChar3.clear();
	    psLineChar3.showLoading({text: '正在努力的读取数据中...'});

	    $.getJSON('drawAccountFloatingDraft.htm', {account_id:account_id},  function (data) {  
	        if(data.success){        	
	        	//alert(data.data);
	        	psLineChar1.setOption(JSON.parse(data.optionAccountFloatingCPWL), true);
	        	psLineChar1.hideLoading();
	        	psLineChar2.setOption(JSON.parse(data.optionAccountFloatingKDD), true);
	        	psLineChar2.hideLoading(); 
	        	psLineChar3.setOption(JSON.parse(data.optionAccountFloatingSumProfit), true);
	        	psLineChar3.hideLoading();  
	        }
	        else{
	        	alert("系统故障！请联系网站相关负责人。");
	        }
	  
	    }); 
	} 
	//载入图表  
    loadDrugs();	
}