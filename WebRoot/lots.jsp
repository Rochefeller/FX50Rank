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
    <title>首页</title>

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
							<li><a href="#forum" class="scroll">FX50论坛</a></li>
							<li><a href="#about" class="scroll">关于我们</a></li>
							<!-- <li><a href="#portfolio" class="scroll">PORTFOLIO</a></li>
							<li><a href="#team" class="scroll">TEAM</a></li>
							<li><a href="#contact" class="scroll">CONTACT</a></li> -->
<!-- 						</ul>
						
						<ul class="nav navbar-top-links navbar-right"> -->
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
		                                <div>fx50top.com</div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <strong>John Smith</strong>
		                                    <span class="pull-right text-muted">
		                                        <em>Yesterday</em>
		                                    </span>
		                                </div>
		                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <strong>John Smith</strong>
		                                    <span class="pull-right text-muted">
		                                        <em>Yesterday</em>
		                                    </span>
		                                </div>
		                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a class="text-center" href="#">
		                                <strong>Read All Messages</strong>
		                                <i class="fa fa-angle-right"></i>
		                            </a>
		                        </li>
		                    </ul>
		                    <!-- /.dropdown-messages -->
		                </li>
		                <!-- /.dropdown -->
		                <!-- <li class="dropdown">
		                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
		                    </a>
		                    <ul class="dropdown-menu dropdown-tasks">
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <p>
		                                        <strong>Task 1</strong>
		                                        <span class="pull-right text-muted">40% Complete</span>
		                                    </p>
		                                    <div class="progress progress-striped active">
		                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
		                                            <span class="sr-only">40% Complete (success)</span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <p>
		                                        <strong>Task 2</strong>
		                                        <span class="pull-right text-muted">20% Complete</span>
		                                    </p>
		                                    <div class="progress progress-striped active">
		                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
		                                            <span class="sr-only">20% Complete</span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <p>
		                                        <strong>Task 3</strong>
		                                        <span class="pull-right text-muted">60% Complete</span>
		                                    </p>
		                                    <div class="progress progress-striped active">
		                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
		                                            <span class="sr-only">60% Complete (warning)</span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a href="#">
		                                <div>
		                                    <p>
		                                        <strong>Task 4</strong>
		                                        <span class="pull-right text-muted">80% Complete</span>
		                                    </p>
		                                    <div class="progress progress-striped active">
		                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
		                                            <span class="sr-only">80% Complete (danger)</span>
		                                        </div>
		                                    </div>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <a class="text-center" href="#">
		                                <strong>See All Tasks</strong>
		                                <i class="fa fa-angle-right"></i>
		                            </a>
		                        </li>
		                    </ul>
		                    /.dropdown-tasks
		                </li> -->
		                <!-- /.dropdown -->
		                <li class="dropdown">
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
		                    <!-- /.dropdown-alerts -->
		                </li>
		                <!-- /.dropdown -->
		                <li class="dropdown">
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
		                    <!-- /.dropdown-user -->
		                </li>
		                <!-- /.dropdown -->
		            	</ul>
						
					</div>
				</nav>
			</div>
		</div>
			<!-- //Navbar -->
	</div>
		<!-- //Header -->
     <div style="height:100px;width:100px">
         <div style="height:100px;width:100px"><img src="<%=path%>/images/fx50code.jpg" width="100" height="100" alt="微信二维码"></div>
         <p>微信二维码</p>
     </div>
     		
		<!-- Banner -->
	<div class="banner">
		<h1>FX50,您可信赖的外汇智能投顾</h1>
		<!-- <h3>For Your Design Needs</h3>
		<h4>Standard Chunk-To generate-Handful of model sentence </h4>
		<a href="#" data-toggle="modal" data-target="#myModal">READ MORE</a> -->
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

             <div class="navbar-default sidebar" role="navigation">
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
               
            </div>
            <!-- /.navbar-static-side -->
        </nav>

       
<!--             <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">按比例</h1>
                </div>
                /.col-lg-12
            </div> -->
			<div class="container" style="background:rgb(225,225,225)">
							<br>
							<form class="form-horizontal" id="formLots" action="<c:url value="obtainRankByLots.htm"/>" method="post"> 
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">平台</label>
                                    <div class="col-lg-5">
                                        <select name="brokers" id="summaryMethod" class="col-lg-12 control-label">
                                            <option></option>
                                            <option>followme</option>
                                            <option>fxbook</option>
                                            <option>mi-trader</option>
                                            <option>mql5</option>
                                            <option>signalstart</option>
                                            <option>zulutrade</option>
                                        </select>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label class="col-lg-5 control-label">预期投资金额(USD)</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="groupName" class="form-control" name="invest" value="10000"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">预期最大持仓手数</label>
                                    <div class="col-lg-5">
                                        <select name="brokers" id="summaryMethod" class="col-lg-12 control-label">
                                            <option></option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>                                            
                                        </select>
                                    </div>
                                </div>                                   
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">信号活跃度(天)</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="groupName" class="form-control" name="live" value="60"/>
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label class="col-lg-5 control-label">信号最少交易时长(天)</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="groupName" class="form-control" name="days" value="180"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-5 control-label">信号最低利润(USD)</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="groupName" class="form-control" name="profit" value="0"/>
                                    </div>
                                </div>                                  
                            </form>                                              	                       	
    		</div>
    		<div class="container" style="background:rgb(225,225,225)">

                            <form class="form-horizontal">
	                            	<div class="form-group">
	                            	 	<label class="col-lg-5 control-label"></label>	                                    
	                                    <div class="col-lg-5">
	                                         <button type="button" class="btn btn-primary col-lg-3" id="searchByRate">查询</button>
	                                    </div>
                                	</div>	                                	                            		                                                                                                                                                                 
                            </form>
                                               	
    		</div>
    <!-- /#wrapper -->
    <br>
    <!-- About -->
	<div id="forum" >
		<div class="container" style="background:rgb(225,225,225)">
			<h3><b>FX50 论坛</b></h3>
			<br>
			<h5><a href="http://my.fx678.com/thread-1541625-1-1.html">1、就外汇跟单中的不同策略说说自己的看法（结合马丁详细解释）</a></h5>
			<h5><a href="https://www.fxshell.com/article/1247">2、全球主要外汇交易社交网站介绍</a></h5>
			<h5><a href="http://blog.sina.cn/dpool/blog/s/blog_6309a6790102xl9e.html">3、外汇跟单中不同的策略如何来跟</a></h5>
			<h5><a href="http://mp.weixin.qq.com/s?__biz=MzAxNzM2MjgwNg==&mid=2653164289&idx=1&sn=7618e4bfe4a4c99622b362b0301e2622&chksm=80360918b741800e96a174d7cc3cea26d4bb24c3a239fb8bac2d67253a67da70f6989b705f38&scene=21#wechat_redirect">4、详解同台跟单模式</a></h5>
			<h5><a href="http://m.fxunion.com/news/2016/53150.html">5、三大外汇交易模式正崛起，大数据交易系统、社会化交易和程序化EA</a></h5>
			<h5><a href="http://m.fxunion.com/news/2016/56638.html">6、初探：基于MT4的跨平台跨市场正反向大数据跟单交易模式</a></h5>
			<h5><a href="http://mp.weixin.qq.com/s?__biz=MzI0NDgwMjkxNA==&mid=2247484435&idx=1&sn=bf221004ef140b1730032e5121b95d1f&chksm=e959701ede2ef908dabf551ea9d76fa4f0c8bb2c473ae15ba72cabd2f3932ef58088ec5106cb&mpshare=1&scene=1&srcid=0722QgoxJs5fQsKYXrUqeb3h#rd">7、资管永不眠，资管靠交易更靠经营！</a></h5>
			<h5><a href="http://mp.weixin.qq.com/s?__biz=MzI0NDgwMjkxNA==&mid=2247484429&idx=2&sn=505981e51449860c7aea7a315f4d9bf4&chksm=e9597000de2ef9166a6dff7f2e60bc83cb86c3fa52516f0434e0c5933735240015445583baec&mpshare=1&scene=1&srcid=0721I0EHwfp2Xkc6uC2DIfMb#rd">8、从实战经验来看，究竟如何才能做出赚钱的量化投资策略？</a></h5>
			<h5><a href="http://mp.weixin.qq.com/s?__biz=MzIzNTU4ODEyMQ==&mid=2247483785&idx=1&sn=7ed8002769ebb2f1f27b58c01a893ee6&chksm=e8e59effdf9217e968fb9788400a349d33adbd8d52d333b0983ea68f3326db5492d386a66e01&mpshare=1&scene=1&srcid=0809TCY11XVUL2xKMEGhkmU3#rd">9、（深度！秘籍！）职业交易员透露标准，让你超过99%的交易人 ！！！</a></h5>
			<br>
		</div>
	</div>
    <br>
    <!--Services -->
	<div  id="about">
		<div class="container" style="background:rgb(225,225,225)">
			<h3><b>关于我们</b></h3>
			<br>
			<h4 class="text-left"><b>FX50团队:</b></h4>
				<p >&nbsp;&nbsp;&nbsp;&nbsp;我们专注于黄金外汇行业，专注于为黄金外汇的投资者和交易者设计开发产品。我们在北京和成都有资深的产品设计与开发团队，研发包括黄金外汇套利、交易策略评估、信号筛选、多账户管理、跨平台复制交易等产品与服务。</p>
			<h4 class="text-left"><b>FX50使命:</b></h4>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;通过我们提供的产品和服务，让黄金外汇投资理财更简单、更轻松、更安全、更成功！</p>
			<h4 class="text-left"><b>FX50发展规划:</b></h4>
				<ul>&nbsp;&nbsp;&nbsp;&nbsp;1、2017年8月，FX50排行榜上线</ul>
				<ul>&nbsp;&nbsp;&nbsp;&nbsp;2、2017年9月，FX50复制基金上线</ul>	
			<br>		
		</div>
		<br>
		<div class="container" style="background:rgb(225,225,225)">
			<br>
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;欢迎志同道合的朋友一起加入我们，与我们一起做产品，一起做服务，一起为中国的外汇投资者和交易者做一点点的贡献!</h2>
			<br>
		</div>
	</div>	
    

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

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
