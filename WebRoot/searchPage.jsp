<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">

<head>

 	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
    <title>FX50搜索引擎</title>

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
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

		<!-- Header -->
		<div class="header">
			
		
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
     <div style="height:100px;width:100px;float:left">
         <div style="height:100px;width:100px"><img src="<%=path%>/images/fx50code.jpg" width="100" height="100" alt="微信二维码"></div>
         <p>官方微信二维码</p>
     </div>
     <div style="float:right;margin-right:10px;margin-top:10px;background:rgb(10,10,50);border:1px solid #fff;border-radius:5px;padding:2px 3px"><a href="main.jsp"><h4><font color="#ffffff">返回首页</font></h4></a></div>
		<!-- //Header -->
		
		<!-- Banner -->
		<div class="banner">
			<h1 style="color:#E6413A">FX50,您可信赖的外汇智能投顾!</h1>
		</div>
	

    <div id="wrapper">

        <!-- Navigation -->
        	<nav role="navigation" style="margin-bottom: 0">
<!--             <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a></a>
            </div> -->
            <!-- /.navbar-header -->

            
            <!-- /.navbar-top-links -->

             <!-- <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">                        
                        <li>
                            <a href="main.jsp"><i class="fa fa-table fa-fw"></i>按固定比例</a>
                        </li>
                        <li>
                            <a href="lots.jsp"><i class="fa fa-edit fa-fw"></i>按固定手数</a>
                        </li>
                        <li>
                            <a href="introduction.jsp"><i class="fa fa-edit fa-fw"></i>FX50排行榜介绍</a>
                        </li>                       
                    </ul>
                </div>
               
            </div> -->
            <!-- /.navbar-static-side -->
        </nav>

       
			<div class="container" style="background:rgb(225,225,225)">
							<br>
                            <form class="form-horizontal" id="formRate" action="<c:url value="obtainAccountSearch.htm"/>" method="post">
	                            	<div class="form-group">
	                                    <label class="col-lg-5 control-label">平台名称:</label>
	                                    <div class="col-lg-5">
	                                        <!-- <input type="text" id="groupName" class="form-control" name="invest" value="10000"/> -->
	                                        <select name="broker" id="summaryMethodinvest" class="col-lg-12 control-label">
	                                            <option>全部</option>
	                                            <option>collective2</option>
	                                            <option>followme</option>
	                                            <option>fxbook</option>
	                                            <option>fxstat</option>
	                                            <option>mi-trader</option>
	                                            <option>mql5</option>
	                                            <option>signalstart</option>
	                                            <option>zulutrade</option>
	                                        </select>	                                        
	                                    </div>
                                	</div>

	                                <div class="form-group">
	                                    <label class="col-lg-5 control-label">信号名称:</label>
	                                    <div class="col-lg-5">
	                                        <input type="text" id="signalName" class="form-control" name="signalName" value=""/>	                                                                                
	                                    </div>
	                                </div>	                            		
 	                            		                                                                                                                                                                 
                            </form>                                               	                       	
    		</div>
    		<div class="container" style="background:rgb(225,225,225)">

                            <form class="form-horizontal">
	                            	<div class="form-group">
	                            	 	<label class="col-lg-5 control-label"></label>	                                    
	                                    <div class="col-lg-5">
	                                         <button type="button" class="btn btn-primary col-lg-3" id="searchByBrokerAndName">搜索一下</button>
	                                    </div>
                                	</div>	                                	                            		                                                                                                                                                                 
                            </form>							                                                                          	
    		</div>
    <!-- /#wrapper -->
    <br>
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

    <br>
    
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
<!--     <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script> -->

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    <script src="dist/js/namespace.js"></script>
    <script src="dist/js/proportion.js"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
/*     $(document).ready(function() {
        (new FX.top.proportionList()).init();
    }); */

    </script>

</body>

</html>
