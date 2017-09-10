<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>交易员信息页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
	    <!-- DataTables CSS -->
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">    
    
        <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="css/othercss/bootstrap.css" type="text/css" />  
    <link rel="stylesheet"	href="css/othercss/style.css" type="text/css" />        	
	<link rel="stylesheet" href="css/othercss/swipebox.css">
	
	<link rel="stylesheet" href="css/mdsSlide.css">
	
	<link rel="stylesheet" type="text/css" href="css/reset-min.css">
<!-- 	<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
 -->	
 	<link href='css/progression.css' rel='stylesheet' type='text/css'>
	<link href='css/style.css' rel='stylesheet' type='text/css'>
	<link href='css/jquery.dataTables.min.css' rel='stylesheet' type='text/css'>
	<style type="text/css">
	.bgimage{background:url("<%=basePath%>/images/fx50top.jpg");}
	</style>
	<!-- <script src='js/echarts-all.js' type="text/javascript"></script> -->
	<!-- <script src='js/echarts.common.min.js' type="text/javascript"></script> -->
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	<script src='js/echarts.min.js' type="text/javascript"></script>
	<!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/StatisticDraft.js"type="text/javascript"></script>
  </head>
  
  <body>
   	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> 
    	<div class="container-fluid">
<!-- 	    	<div class="navbar-header"> 	    
		        <a class="navbar-brand" href="javascript:searchByRate()"><strong><font color="#ffffff">-返回排行榜-</font></strong></a> 
		    </div> -->
 			<div>
		        <ul class="nav navbar-nav"> 
					<li>
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">统计分析导航栏<b class="caret"></b></a>
		                <ul class="dropdown-menu">
		                	<li><a href="javascript:void(0)" id="accountHistoryDrowndown">1. 信号历史回测表现</a></li>
		                	<li><a href="javascript:void(0)" id="accountOrderLots">2. 信号订单手数与持仓信息</a></li>
		                    <li><a href="javascript:void(0)" id="accountStatAndOrders">3. 信号统计数据和订单列表</a></li>
		                    <li><a href="javascript:void(0)" id="accountProfitAndLoss">4. 信号原始订单收益与风险</a></li>
		                    <li><a href="javascript:void(0)" id="accountFloating">5. 信号浮动盈亏</a></li>		                    
		                    <li class="divider"></li>
		                    
		                </ul>
		            </li>
		            <li><a href="javascript:searchByRate()">返回排行榜</a></li>
		            <li><a href="searchPage.jsp" class="scroll">FX50搜索引擎</a></li>               
		        </ul>
	        </div>	              
    	</div>    
	</nav>
  	<div style="width:100%;height:2600px;background:rgb(195,195,195)">
  		<div style="width:1200px;height:2600px;background:rgb(195,195,195);margin-top:10px;margin:0 auto;border-radius:10px">		
  			<div style="width:100px;height:30px;margin:0 auto;background:rgb(195,195,195);margin-top:10px;margin-left:10px;float:left">
  				<!-- <h4><font size="3"><a href="javascript:searchByRate()"><input type="button" style="border-radius:5px;border:1px solid #fff" value="返回排行榜"/></a></font></h4> -->
  			</div>
  			<br>
  			<div style="width:1100px;height:60px;margin:0 auto;background:rgb(195,195,195);margin-top:10px;text-align:center">
  				<table style="width:1095px;height:60px;">
					<tr> 
						<td align="center" style="background:rgb(195,195,195);border:0px solid #00f;width:365px;height:55px">
 							<form style="width:300px;" id="accountStatAndOrdersForm" action="<c:url value="obtainAccountStatAndOrders.htm"/>" method="post">
								<input type="hidden" id="account_id_1" name="account_id_1"/>
								<input type="hidden" id="account_id_11" name="planN"/>
								<input type="hidden" id="account_id_12" name="planInvest"/>
<!-- 								<input type="button" id="accountStatAndOrders" style="width:300px;height:50px;font-size:20px;border-radius:5px;" value="原始统计数据和原始订单列表"/>
 -->							</form>
						</td>
						<td align="center" style="background:rgb(195,195,195);border:0px solid #00f;width:365px;height:55px">
 							<form style="width:300px;" id="accountOrderLotsForm" action="<c:url value="obtainTraderInfoPage.htm"/>" method="post">
								<input type="hidden" id="account_id_6" name="account_id"/>
								<input type="hidden" id="account_id_61" name="planN"/>
								<input type="hidden" id="account_id_62" name="planInvest"/>
							</form>												
						</td>
						<td align="center" style="background:rgb(195,195,195);border:0px solid #00f;width:365px;height:55px">
 							<form style="width:300px;" id="orderProfitAndLossForm" action="<c:url value="obtainOrderProfitAndLossPage.htm"/>" method="post">
								<input type="hidden" id="account_id_2" name="account_id_1"/>
								<input type="hidden" id="account_id_21" name="planN"/>
								<input type="hidden" id="account_id_22" name="planInvest"/>
<!-- 								<input type="button" id="accountProfitAndLoss" style="width:300px;height:50px;font-size:20px;border-radius:5px;" value="信号原始订单收益与风险"/>
 -->						</form>												
						</td>
						<td align="center" style="background:rgb(195,195,195);border:0px solid #00f;width:365px;height:55px">
 							<form style="width:300px;" id="historyDrowDownForm" action="<c:url value="obtainHistoryDrowDownPage.htm"/>" method="post">
								<input type="hidden" id="account_id_3" name="account_id_1"/>
								<input type="hidden" id="account_id_4" name="planN"/>
								<input type="hidden" id="account_id_5" name="planInvest"/>
<!-- 								<input type="button" id="accountHistoryDrowndown" style="width:300px;height:50px;font-size:20px;border-radius:5px;" value="信号历史回测表现"/>
 -->						</form>							
						</td>
						<td align="center" style="background:rgb(195,195,195);border:0px solid #00f;width:365px;height:55px">
 							<form style="width:300px;" id="accountFloatingForm" action="<c:url value="obatinAccountFloatingPage.htm"/>" method="post">
								<input type="hidden" id="account_id_7" name="account_id_1"/>
								<input type="hidden" id="account_id_71" name="planN"/>
								<input type="hidden" id="account_id_72" name="planInvest"/>
<!-- 								<input type="button" id="accountHistoryDrowndown" style="width:300px;height:50px;font-size:20px;border-radius:5px;" value="信号历史回测表现"/>
 -->						</form>							
						</td>						
					</tr>
  				</table>
  			</div>
  			<br>
  			<div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
  				<div id="maxlots" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>
  			</div>
  			<div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
   				 <div id="orders" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div> 			
  			</div>
  			<div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="openLots" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
  			</div>
  			 <div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="orderNetprofit" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
  			</div>
  			 <div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="orderPips" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
  			</div>
  			 <div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="orderSymbols" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
  			</div>
<!-- 排行榜默认提交form -->
<div>
		<form id="formRateDefault" action="<c:url value="obtainRankByRate.htm"/>" method="post">
                <input type="hidden" id="groupName" name="invest" value="10000"/>	                                       	                                        
                <input type="hidden" id="groupName" name="rate" value="50"/>
                <input type="hidden" id="groupName" name="loss" value="20"/>	                            		                                                                                                                                                                 
       </form>
</div>  			 
  			<br>
<!--   			<div style="background:rgb(195,195,195);width:1100px;height:50px;border: 1px solid #C3C3C3;margin: auto;border-radius:5px;text-align:center;">订单列表</div>
 				<div style="background:rgb(195,195,195);width:1100px;height:2000px;border: 1px solid #C3C3C3;margin: auto;border-radius:0px;text-align:center;">
					<table id="orderList" class="display" style="text-align:center;margin: auto" cellspacing="0" width="890px">
				        <thead style="height:50px">
				            <tr>
				                <th style="text-align:center">订单编号</th>
				                <th style="text-align:center">交易品种</th>
				                <th style="text-align:center">交易类型</th>
				                <th style="text-align:center">交易手数</th>
				                <th style="text-align:center">建仓时间</th>
				                <th style="text-align:center">平仓时间</th>
				                <th style="text-align:center">建仓价格</th>			                
				                <th style="text-align:center">平仓价格</th>				                
				                <th style="text-align:center">订单利息</th>
				                <th style="text-align:center">订单佣金</th>				                
				                <th style="text-align:center">交易点数</th>
				                <th style="text-align:center">毛利润</th>
				                <th style="text-align:center">净利润</th>				               				               
				            </tr>
				        </thead>
				        <tfoot>
				            <tr>
				                <th style="text-align:center">订单编号</th>
				                <th style="text-align:center">交易品种</th>
				                <th style="text-align:center">交易类型</th>
				                <th style="text-align:center">交易手数</th>
				                <th style="text-align:center">建仓时间</th>
				                <th style="text-align:center">平仓时间</th>
				                <th style="text-align:center">建仓价格</th>			                
				                <th style="text-align:center">平仓价格</th>				                
				                <th style="text-align:center">订单利息</th>
				                <th style="text-align:center">订单佣金</th>				                
				                <th style="text-align:center">交易点数</th>
				                <th style="text-align:center">毛利润</th>
				                <th style="text-align:center">净利润</th>							               
				            </tr>
				        </tfoot>
				    </table>							
				</div> -->  				 			
  		</div>
  	</div>
  	
  		<script type="text/javascript" src="js/tabulous.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 		
  		<%-- <script type="text/javascript">
	  		$(document).ready(function() {
	  		var account_id = '<%=request.getParameter("account_id")%>';
	  		var psel1 = document.getElementById("account_id_1");
	  		psel1.value=account_id;
	  		/* alert("psel"+psel.value); */
	  		 			    
			 $('#orderList').DataTable( {
			    	"aLengthMenu": [25],
			    	"bAutoWidth":false,
			    	"pagingType":   "full_numbers", //"simple" "simple_numbers" "full" "full_numbers"
				    "language": {
	                 "lengthMenu": "每页 _MENU_ 条记录",
	                 "zeroRecords": "没有找到记录",
	                 "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
	                 "infoEmpty": "无记录",
	                 "infoFiltered": "(从 _MAX_ 条记录过滤)",
	                 "sSearch": "查询",
	                 "sProcessing": "处理中...", 
	                 "oPaginate": {	                 	    
		                 	"sFirst": "首页",
		                 	"sLast": "尾页" ,		                  
 			                "sPrevious": "前一页",  
			                "sNext": "后一页",		                 
		           		 }  
	            	 },
	            	/*"bSort" : true,
	            	"paging": true,*/
			        "processing": true,
			       // "serverSide": true,
			        //"ajax": "data/arrays.txt",
  			        "ajax": {			        		        	
 			            "url": "obtainOrderInfoList.htm",
 			            "data":{"account_id":account_id},
			            "type": "POST", 
 			            //"success":function(data){alert("success");alert(data.data.first_name)},
			            //"error":function(data){alert("error")} 
			        } ,  
 			        "columns": [
			            { "data": "id" },
			            { "data": "symbol" },
			            { "data": "type" },
			            { "data": "lots" },
			            { "data": "openTime" },
			            { "data": "closeTime" },
			            { "data": "openPrice"},
			            //{ "data": "maxDrawDown"},
			            { "data": "closePrice"},
			            //{ "data": "rateWinLoss"},
			            { "data": "swap"},
			            { "data": "commission"},
			            //{ "data": "countYearTotalOrders"},
			            { "data": "pips"},
			            { "data": "profit"},			         
			            { "data": "net_Profit"}
			            //{ "data": "account"}
			        ]
			    } );
			    
			   /*  $("#orderList tbody").on("click","tr",function(){
			    	//alert("right!");
			    	var table = $('#rankInfo').DataTable();
			    	var row = table.row( this ).data();
			    	console.log(row);
					console.log(row['account_id']);
			    	if ( $(this).hasClass('selected') ) {
			            $(this).removeClass('selected');
			        }
			        else {
			            table.$('tr.selected').removeClass('selected');
			            $(this).addClass('selected');
			        }
			        obtainTraderInfoPage(row);
			    }); */
			    
/*    			    $("#rankInfo tbody").on("click","td",function(){
			    	alert("right!");
			    	var table = $('#rankInfo').DataTable();
			    	var cellData = table.cell( this ).data();
					console.log( cellData );
			    }); */				    
			} );
  		</script> --%>
  	
  	<script type="text/javascript">
		//注意带上单引号
		var account_id='<%=request.getParameter("account_id")%>';
		var planN='<%=request.getParameter("planN")%>';	
		var planInvest='<%=request.getParameter("planInvest")%>';			  		
	  	var psel1 = document.getElementById("account_id_1");
	  	psel1.value=account_id;
	  	//alert(psel1.value);
	  	var psel2 = document.getElementById("account_id_2");
	  	psel2.value=account_id;
	  	//alert(psel2.value);
	  	var psel3 = document.getElementById("account_id_3");
	  	psel3.value=account_id;
	  	var psel10 = document.getElementById("account_id_6");
	  	psel10.value=account_id;
	  	var psel11 = document.getElementById("account_id_61");
	  	psel11.value=planN;
	  	var psel12 = document.getElementById("account_id_62");
	  	psel12.value=planInvest;
	  	var psel4 = document.getElementById("account_id_4");
	  	psel4.value=planN;
	  	var psel6 = document.getElementById("account_id_11");
	  	psel6.value=planN;
	  	var psel7 = document.getElementById("account_id_21");
	  	psel7.value=planN;
	  	var psel5 = document.getElementById("account_id_5");
	  	psel5.value=planInvest;
	  	var psel8 = document.getElementById("account_id_12");
	  	psel8.value=planInvest;
	  	var psel9 = document.getElementById("account_id_22");
	  	psel9.value=planInvest;
	  	var psel13 =document.getElementById("account_id_7");
	  	psel13.value =account_id;
	  	var psel14 = document.getElementById("account_id_71");
	  	psel14.value = planN;
	  	var psel15 = document.getElementById("account_id_72");
	  	psel15.value = planInvest; 
	  	//alert(psel3.value);
		window.onload=RankprofitChart(account_id);		
	</script>
  </body>
</html>
