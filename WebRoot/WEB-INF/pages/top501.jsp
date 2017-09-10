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
    <title>Top50排行榜</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<link  rel="stylesheet" href="css/othercss/bootstrap.css" type="text/css" />  
    <link rel="stylesheet"	href="css/othercss/style.css" type="text/css" />        	
	<link rel="stylesheet" href="css/othercss/swipebox.css">
	    
	<link rel="stylesheet" href="css/mdsSlide.css">
	
	<link rel="stylesheet" type="text/css" href="css/reset-min.css">
	<link href='css/jquery.dataTables.min.css' rel='stylesheet' type='text/css'>
	<link href='css/progression.css' rel='stylesheet' type='text/css'>
	<link href='css/style.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/reset-min.css">
	<!-- <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> -->
	
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/Mds.onePic.1.0.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
	<script src="dist/js/proportion.js" type="text/javascript"></script>
		
  </head>
  
  <body text-align="center" height="100%">
  	
  			<!-- Header -->
		<div class="header">
			<!-- Top-Bar -->
			<!-- <div class="top-bar">
				<div class="container">
					<div class="logo">
						<a href="#"><h2>BUSINESS PARK</h2></a>
					</div>
					<div class="header-right">
						<div class="phone">
							<ul>
								<li><span class="glyphicon glyphicon-earphone phone" aria-hidden="true"></span></li>
								<li>+8044261150</li>
							</ul>
						</div>
						<div class="social-icons-top">
							<ul>
								<li><a class="linkedin" href="#"></a></li>
								<li><a class="google" href="#"></a></li>
								<li><a class="twitter" href="#"></a></li>
								<li><a class="facebook" href="#"></a></li>
								
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div> -->
			<!-- //Top-Bar -->
		
			<!-- Navbar -->
			<div class="total-navbar">
				<div class="container">
				<nav class="navbar navbar-default">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
		
					<div id="navbar" class="navbar-collapse navbar-right collapse hover-effect">
		
						<ul class="nav navbar-nav">
							<li><a href="javascript:searchByRate()" class="scroll">FX50排行榜</a></li>
							<li><a href="forum.jsp" class="scroll">FX50论坛</a></li>
							<li><a href="about.jsp" class="scroll">关于我们</a></li>
							<!-- <li><a href="#portfolio" class="scroll">PORTFOLIO</a></li>
							<li><a href="#team" class="scroll">TEAM</a></li>
							<li><a href="#contact" class="scroll">CONTACT</a></li> -->
		                <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);">
		                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
		                    </a>
		                    <ul class="dropdown-menu dropdown-messages">
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <strong>平台邮箱</strong>		                                    
		                                </div>
		                                <div>fx50top.com</div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                    </ul>
		                    <!-- /.dropdown-messages -->
		                </li>
		                
		               <!--  <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
		                    </a>
		                    <ul class="dropdown-menu dropdown-alerts">
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <i class="fa fa-comment fa-fw"></i> New Comment
		                                    <span class="pull-right text-muted small">4 minutes ago</span>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
		                                    <span class="pull-right text-muted small">12 minutes ago</span>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
		                                    <span class="pull-right text-muted small">4 minutes ago</span>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <i class="fa fa-tasks fa-fw"></i> New Task
		                                    <span class="pull-right text-muted small">4 minutes ago</span>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
		                                    <span class="pull-right text-muted small">4 minutes ago</span>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a class="text-center" href="#">
		                                <strong>See All Alerts</strong>
		                                <i class="fa fa-angle-right"></i>
		                            </a>
		                        </li>
		                    </ul>
		                    /.dropdown-alerts
		                </li -->>
		                <!-- /.dropdown -->
		                <!-- <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
		                    </a>
		                    <ul class="dropdown-menu dropdown-user">
		                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
		                        </li>
		                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
		                        </li>
		                        <li class="divider"></li>
		                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		                        </li>
		                    </ul>
		                    /.dropdown-user
		                </li> -->
		                <!-- /.dropdown -->
		            	</ul>
						
					</div>
				</nav>
			</div>
		</div>
			<!-- //Navbar -->
	</div>
		<!-- //Header -->
  	
  	<div style="margin-left:0px;margin-right:0px;height:1800px;">
 		<div style="background:rgb(195,195,195);width:1300px;height:400px;border: 1px solid #fff;margin: auto;border-radius:10px;text-align:center;">
			 <div class="wrap">			
				<div id="slide">
					<ul class="list">
						<li><a href="javascript:;"><img src="images/user/1.png" alt=""></a></li>
						<li><a href="javascript:;"><img src="images/user/2.png" alt=""></a></li>
						<li><a href="javascript:;"><img src="images/user/3.png" alt=""></a></li>
						<li><a href="javascript:;"><img src="images/user/4.png" alt=""></a></li>
						<li><a href="javascript:;"><img src="images/user/5.png" alt=""></a></li>
					</ul>
				</div>			
			</div>
 		
 		</div>
 		<br>
 		<div style="background:rgb(195,195,195);width:1300px;height:50px;border: 1px solid #C3C3C3;margin: auto;border-radius:5px;text-align:center;">
			<form id="formRate"  action="<c:url value="obtainRankByRate.htm"/>" method="post">
			        <table>
			        	<tr>
			        		<td style="width:180px" align="center">您计划投多少钱？(USD)</td>			        		
			        		<td style="width:100px" align="center">
									<select name="invest" id="summaryMethodinvest" class="col-lg-12 control-label">
										
                                        <option>1000</option>
                                        <option>2000</option>
                                        <option>3000</option>
                                        <option>5000</option>
                                        <option>10000</option>
                                        <option>20000</option>
                                        <option>30000</option>
                                        <option>50000</option>
                                    </select>			        		
			        		</td>
			        		<td></td>
			        		<td style="width:180px" align="center">您期望年回报多少？(%)</td>
			        		<td style="width:100px" align="center">
	                                        <select name="rate" id="summaryMethodrate" class="col-lg-12 control-label">
	                                            <option>10</option>
	                                            <option>20</option>
	                                            <option>30</option>
	                                            <option>40</option>
	                                            <option>50</option>	                                            
	                                        </select>			        		
			        		</td>
			        		<td></td>
			        		<td style="width:180px" align="center">您愿意承担多大风险？(%)</td>
			        		<td style="width:100px" align="center">
	                                        <select name="loss" id="summaryMethodloss" class="col-lg-12 control-label">
	                                            <option>10</option>
	                                            <option>15</option>
	                                            <option>20</option>
	                                            <option>25</option>
	                                            <option>30</option>	                                            
	                                        </select>			        		
			        		</td>
			        		<td style="width:50px"></td>
			        		<td align="center"><input type="button" id="searchByRate" class="btn btn-primary col-lg-3" style="width:80px" value="查询"/></td>
			        	</tr>
			        </table>
			</form>  				
 		</div>
		
 		
 		<div style="background:rgb(195,195,195);width:1300px;height:600px;border: 1px solid #C3C3C3;margin: auto;border-radius:0px;text-align:center;cursor:pointer;">
					<table id="rankInfo" class="display" style="text-align:center;margin: auto" cellspacing="0" width="890px">
				        <thead style="height:50px">
				            <tr>
				                <th style="text-align:center">序号</th>
				                <th style="text-align:center">平台名称</th>
				                <th style="text-align:center">信号名称</th>
				                <th style="text-align:center">评分值</th>
				                <th style="text-align:center">投资金额(USD)</th>
				                <th style="text-align:center">年化收益</th>
				                <th style="text-align:center">跟单比例</th>			                
				                <th style="text-align:center">最大回撤率</th>				                
				                <th style="text-align:center">年化手数</th>
				                <th style="text-align:center">交易时长(天)</th>				                
				                <th style="text-align:center">最小跟单资金(USD)</th>
				                <th style="text-align:center">预期最大持仓手数(手)</th>
				                <th style="text-align:center">预期最大持仓订单数</th>				               				               
				            </tr>
				        </thead>
				        <tfoot>
				            <tr>
				                <th style="text-align:center">序号</th>
				                <th style="text-align:center">平台名称</th>
				                <th style="text-align:center">信号名称</th>
				                <th style="text-align:center">评分值</th>
				                <th style="text-align:center">投资金额(USD)</th>
				                <th style="text-align:center">年化收益</th>
				                <th style="text-align:center">跟单比例</th>			                
				                <th style="text-align:center">最大回撤率</th>				                
				                <th style="text-align:center">年化手数</th>
				                <th style="text-align:center">交易时长(天)</th>				                
				                <th style="text-align:center">最小跟单资金(USD)</th>
				                <th style="text-align:center">预期最大持仓手数(手)</th>
				                <th style="text-align:center">预期最大持仓订单数</th>							               
				            </tr>
				        </tfoot>
				    </table>							
		</div>
		<form class="form-horizontal" id="formRateDefault" action="<c:url value="obtainRankByRate.htm"/>" method="post">
         	<div class="form-group">	                                    
                 <div class="col-lg-5">
                     <input type="hidden" id="groupName" class="form-control" name="invest" value="10000"/>	                                       	                                        
                 </div>
            </div>

             <div class="form-group">                           
                 <div class="col-lg-5">
                     <input type="hidden" id="groupName" class="form-control" name="rate" value="50"/>	                                        	                                        
                 </div>
             </div>	                            		

             <div class="form-group">	                                    
                 <div class="col-lg-5">
                    	<input type="hidden" id="groupName" class="form-control" name="loss" value="20"/>	                                                                              
                 </div>
             </div> 	                            		                                                                                                                                                                 
       </form> 		
		<form id="form1" action="<c:url value="obtainTraderInfoPage.htm"/>" method="post">
		<input id="traderAccount_id" type="hidden" name="account_id" value="" />
		<input id="traderN" type="hidden" name="planN" value="" />
		<input id="traderInvest" type="hidden" name="planInvest" value="" />
		</form>
		<script type="text/javascript" src="js/tabulous.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>		
  		<script type="text/javascript">
	  		$(document).ready(function() {
	  		 //var brokers = '<%=request.getParameter("brokers")%>';
	  		 var invest = '<%=request.getParameter("invest")%>';
	  		 var rate = '<%=request.getParameter("rate")%>';
	  		  var loss = '<%=request.getParameter("loss")%>';
	  		 //var live = '<%=request.getParameter("live")%>';
	  		 //var days = '<%=request.getParameter("days")%>';
	  		 //var profit = '<%=request.getParameter("profit")%>';
	  		 			    
			 $('#rankInfo').DataTable( {
			    	"aLengthMenu": [10],
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
 			            "url": "rankInfoByRate.htm",
 			            "data":{"invest":invest,"rate":rate,"loss":loss},
			            "type": "POST", 
 			            //"success":function(data){alert("success");alert(data.data.first_name)},
			            //"error":function(data){alert("error")} 
			        } ,  
 			        "columns": [
			            { "data": "id" },
			            { "data": "broker" },
			            { "data": "name" },
			            { "data": "sort" },
			            { "data": "planInvest" },
			            { "data": "rateProfitYear" },
			            { "data": "n"},
			            //{ "data": "maxDrawDown"},
			            { "data": "maxRateDrawDown"},
			            //{ "data": "rateWinLoss"},
			            { "data": "sumYearLots"},
			            { "data": "days"},
			            //{ "data": "countYearTotalOrders"},
			            { "data": "minPutInvest"},
			            { "data": "maxLots"},			         
			            { "data": "maxOpenOrders"}
			            //{ "data": "account"}
			        ]
			    } );
			    
			   /*  $("#rankInfo tbody").on('mouseover','td', function(){
			    	var table = $('#rankInfo').DataTable();
			    	var colIdx = table.cell(this).index().column;
			    	if(colIdx != lastIdx){
			    	 $( table.column( colIdx ).nodes() ).addClass( 'selected' );
			    	}
			    }).on('mouseleave', function () {
            		$( table.column( colIdx ).nodes() ).removeClass( 'selected' );
        		} ); */
			     $("#rankInfo tbody").on("mouseover","tr",function(){
			    	//alert("right!");
			    	var table = $('#rankInfo').DataTable();
			    	var row = table.row( this ).data();
			    	//console.log(row);
					//console.log(row['account_id']);
			    	if ( $(this).hasClass('selected') ) {
			            $(this).removeClass('selected');
			        }
			        else {
			            table.$('tr.selected').removeClass('selected');
			            $(this).addClass('selected');
			        }			       
			    }).on("mouseleave", "tr", function () {
            		$(this).removeClass('selected');
        		} );
			    
			    $("#rankInfo tbody").on("click","tr",function(){
			    	//alert("right!");
			    	var table = $('#rankInfo').DataTable();
			    	var row = table.row( this ).data();
			    	//console.log(row);
					//console.log(row['account_id']);
			    	if ( $(this).hasClass('selected') ) {
			            $(this).removeClass('selected');
			        }
			        else {
			            table.$('tr.selected').removeClass('selected');
			            $(this).addClass('selected');
			        }
			        obtainTraderInfoPage(row);
			    });
			    
/*    			    $("#rankInfo tbody").on("click","td",function(){
			    	alert("right!");
			    	var table = $('#rankInfo').DataTable();
			    	var cellData = table.cell( this ).data();
					console.log( cellData );
			    }); */				    
			} );
  		</script>
  	</div>
 	<script type="text/javascript">
		var valueinvest = '<%=request.getParameter("invest")%>';
		var valuerate = '<%=request.getParameter("rate")%>';
	  	var valueloss = '<%=request.getParameter("loss")%>';
		window.onload = autoparasfixed(valueinvest, valuerate, valueloss);
	</script>
	<script>
		$('#slide').MdsSlideFade({
			pageNum: true,time: '3000'
		});
		
	</script>
	
	<!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
   <!--  <script src="vendor/metisMenu/metisMenu.min.js"></script> -->

    <!--  DataTables JavaScript -->
    <!-- <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script> -->

<!--     Custom Theme JavaScript
    <script src="dist/js/sb-admin-2.js"></script>
    <script src="dist/js/namespace.js"></script>
    <script src="dist/js/proportion.js"></script>	 -->

  			  				  		
  </body>
</html>
