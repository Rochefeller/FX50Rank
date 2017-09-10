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
    <style type="text/css">
    .bgimage{background:url("<%=basePath%>/images/fx50top.jpg");}
    </style>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
	    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    
	 <script src='js/echarts.min.js' type="text/javascript"></script>
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

		<div style="background:rgb(195,195,195);width:100%;height:1800px;border: 1px solid #C3C3C3;margin:0 auto;border-radius:0px;text-align:center;float:left">
 			<div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
  				<div id="accountFloatingCPWL" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>
  			</div>
  			<div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="accountFloatingKDD" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
  			</div>
  			 <div class="bgimage" style="width:1100px;height:400px;margin:0 auto;margin-top:10px;">
				<div id="accountFloatingSumProfit" style="width:1100px;height:400px;margin:0 auto;margin-top:0px;"></div>  			
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
	<script type="text/javascript">
		//注意带上单引号
		var account_id='<%=request.getParameter("account_id_1")%>';
		var planN = '<%=request.getParameter("planN")%>';
	    var planInvest = '<%=request.getParameter("planInvest")%>';
		//alert(account_id);			  		
	  	var psel1 = document.getElementById("account_id_temp");
	  	psel1.value=account_id;
 	    var psel2 = document.getElementById("n_temp");
 		psel2.value=planN;
 		var psel3 = document.getElementById("invest_temp");
 		psel3.value=planInvest;
	  	//alert(psel1.value);
		window.onload=AccountFloatingChart(account_id);		
	</script>
</body>
</html>