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

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='css/jquery.dataTables.min.css' rel='stylesheet' type='text/css'>
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
                <a class="navbar-brand" href="index.html">返回导航页</a>
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

		<div style="background:rgb(195,195,195);width:1500px;height:2200px;border: 1px solid #C3C3C3;margin: auto;border-radius:0px;text-align:center;">
  			<div style="width:300px;height:2000px;margin:0 auto;background:rgb(230,230,230);margin-left:25px;margin-top:10px;float:left">
  				<div id="accountStat" style="width:290px;height:1990px;margin:0 auto;margin-top:5px;background:rgb(255,255,255)">
  				
  					<table>
  						<tr><td style="height:45px;border:1px solid #fff;background:rgb(235,151,146);font-weight:bold;" align="center" colspan="2">账户数据统计信息</td></tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号平均亏损点数（pips)</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.avgPipsLossOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号平均盈利点数(pips)</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.avgPipsWinOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号亏损订单平均亏损(USD)</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.avgProfitLossOrders }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号盈利订单平均盈利(USD)</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.avgProfitWinOrders}</td>
  						</tr>
   						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号亏损订单数</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.countLossOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号盈利订单数</td>
  							<td style="width:100px;height:35px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.countWinOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号总订单数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.countTotalOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号年化订单数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.countYearTotalOrders }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大回撤金额（USD)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.maxDrawDown }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大回撤率(％)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.maxRateDrawDown }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最小持仓手数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.minOpenLots }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大持仓手数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.maxOpenLots }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大持仓订单数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.maxOpenOrders }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最小跟单资金(USD)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.minPutInvest}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大止损百分比(％)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.maxSafeInvest}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号输率</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.rateLoss}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号赔率</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.rateOdds }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号胜率</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.rateWin}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号亏损点数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.sumLossPips }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号盈利点数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.sumWinPips }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号总累积点数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.sumPips}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号亏损金额之和（USD）</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.sumProfitLossOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号盈利金额之和（USD）</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.sumProfitWinOrders}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号总利润（USD)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.sumProfit}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号年化总利润(USD)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.sumYearProfit }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号总手数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.sumLots }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号年化总手数(手)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.sumYearLots}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号交易时长(天)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.days }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最近更新时间</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.lastUpdated}</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最近更新时间</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.lastUpdatedTime }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号最大亏损点数</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.maxLossPips }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号交易产品数(个)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.countSymbol }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号主要产品名称</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${accountStatInfo.symbols }</td>
  						</tr>
  						<tr>
  							<td style="width:190px;height:35px;border:1px solid #aaa;background:rgb(235,151,146);font-weight:bold;" align="center">信号主要产品比例(％)</td>
  							<td style="width:100px;height:35px;border:1px solid #aaa;background:rgb(200,200,200);font-weight:bold;" align="center">${ accountStatInfo.symbolDis}</td>
  						</tr> 						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						  						 						  						  						  						
  					</table>
  				
  				</div>
  			</div>
  			<div style="width:1100px;height:2000px;margin:0 auto;background:rgb(2,230,230);margin-right:25px;margin-top:10px;float:right">
   				 <div id="orders" style="background:rgb(195,195,195);width:1100px;height:1990px;margin:0 auto;margin-top:5px;background:rgb(255,255,255)">
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
    </div>
    <!-- /#wrapper -->
	
  		<script type="text/javascript" src="js/tabulous.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 		
  		<script type="text/javascript">
	  		$(document).ready(function() {
	  		 var account_id = '<%=request.getParameter("account_id")%>';	  		
	  		 alert(account_id);			    
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
  		</script>	
	
 

</body>
</html>