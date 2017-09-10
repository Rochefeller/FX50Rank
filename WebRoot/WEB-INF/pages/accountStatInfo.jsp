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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
<title>信号统计数据页</title>
	
<!-- Bootstrap Core CSS -->
   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
   <link href="dist/css/sb-admin-2.css" rel="stylesheet">

   <!--  Morris Charts CSS -->
   <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
   <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='css/jquery.dataTables.min.css' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    
	<script type="text/javascript" src="js/functions.js"></script>
</head>
<body>
 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="javascript:void" onclick="obtainTraderInfoPage()">返回导航页</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>平台邮箱</strong>
                                </div>
                                <div>fx50top@163.com</div>
                            </a>
                        </li>
                        <li class="divider"></li>                       
                        
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
            </ul>

 <!--            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="main.jsp"><i class="fa fa-dashboard fa-fw"></i> 返回FX50主页</a>
                        </li>
                    
                    </ul>
                </div>
                /.sidebar-collapse
            </div> -->
            <!-- /.navbar-static-side -->
        </nav>

		<div style="background:rgb(195,195,195);width:100%;height:1400px;border: 1px solid #C3C3C3;margin: auto;border-radius:0px;text-align:center;">
  			<div style="width:290px;height:1350px;margin:0 auto;background:rgb(230,230,230);margin-left:15px;margin-top:10px;float:left">
  				<div id="accountStat" style="width:290px;height:1300px;margin:0 auto;margin-top:5px;background:rgb(255,255,255)">
  				
  					<table id='table'>
  						<tr><td style="height:45px;border:1px solid #fff;background:rgb(93,193,248);font-weight:bold;" align="center" colspan="2">账户数据统计信息</td></tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号平均亏损点数（pips)</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.avgPipsLossOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号平均盈利点数(pips)</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.avgPipsWinOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号亏损订单平均亏损(USD)</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.avgProfitLossOrders }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号盈利订单平均盈利(USD)</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.avgProfitWinOrders}</h5></td>
  						</tr>
   						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号亏损订单数</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.countLossOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号盈利订单数</h5></td>
  							<td style="width:90px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.countWinOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号总订单数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.countTotalOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号年化订单数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.countYearTotalOrders }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大回撤金额（USD)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.maxDrawDown }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大回撤率(％)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.maxRateDrawDown }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最小持仓手数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.minOpenLots }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大持仓手数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.maxOpenLots }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大持仓订单数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.maxOpenOrders }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最小跟单资金(USD)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.minPutInvest}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大止损百分比(％)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.maxSafeInvest}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号输率</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.rateLoss}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号赔率</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.rateOdds }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号胜率</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.rateWin}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号亏损点数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.sumLossPips }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号盈利点数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.sumWinPips }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号总累积点数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.sumPips}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号亏损金额之和（USD）</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.sumProfitLossOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号盈利金额之和（USD）</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.sumProfitWinOrders}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号总利润（USD)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.sumProfit}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号年化总利润(USD)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.sumYearProfit }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号总手数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.sumLots }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号年化总手数(手)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.sumYearLots}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号交易时长(天)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.days }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最近更新时间</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.lastUpdated}</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最近更新时间</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.lastUpdatedTime }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号最大亏损点数</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.maxLossPips }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号交易产品数(个)</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.countSymbol }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号主要产品名称</h5></td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${accountStatInfo.symbols }</h5></td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(93,193,248);font-weight:bold;" align="center"><h5>信号主要产品比例(％)</td>
  							<td style="width:90px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center"><h5>${ accountStatInfo.symbolDis}</h5></td>
  						</tr> 						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						 						  						  						  						
  					</table>
  				
  				</div>
  			</div>
  			<div style="width:1000px;height:1350px;margin:0 auto;background:rgb(2,230,230);margin-left:20px;margin-top:10px;float:left">
   				 <div id="orders" style="background:rgb(195,195,195);width:1000px;height:1300px;margin:0 auto;margin-top:5px;background:rgb(255,255,255)">
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
   				 </div> 			
  			</div>	
		</div>
        <!-- /#page-wrapper -->
        <div>
        <form id="formTemp" action="<c:url value="obtainTraderInfoPage.htm"/>" method="post">
        	<input type="hidden" id="account_id_temp" name="account_id"/>
        	<input type="hidden" id="n_temp" name="planN"/> 
        	<input type="hidden" id="invest_temp" name="planInvest"/>        
        </form>
        </div>
    </div>
    <!-- /#wrapper -->
	
  		<script type="text/javascript" src="js/tabulous.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 		
  		<script type="text/javascript">
	  		$(document).ready(function() {
	  		 var account_id = '<%=request.getParameter("account_id_1")%>';
	  		 var planN = '<%=request.getParameter("planN")%>';
	  		 var planInvest = '<%=request.getParameter("planInvest")%>';
	  		 var psel1 = document.getElementById("account_id_temp");
	  		 psel1.value=account_id;
	  		 var psel2 = document.getElementById("n_temp");
	  		 psel2.value=planN;
	  		 var psel3 = document.getElementById("invest_temp");
	  		 psel3.value=planInvest;		  		
	  		// alert(account_id);			    
			 $('#orderList').DataTable( {
			    	"aLengthMenu": [23],
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
  		</script>	
	
</body>
</html>