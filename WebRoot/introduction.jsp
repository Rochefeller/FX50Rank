<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
		p{text-indent:2em}
	</style>

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
                <a class="navbar-brand" href="index.html">FX 50</a>
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
                <li class="dropdown">
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
                    <!-- /.dropdown-tasks -->
                </li>
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
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="main.jsp"><i class="fa fa-dashboard fa-fw"></i> 返回FX50主页</a>
                        </li>
                    
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
			<h2 class="text-center">FX50排行榜，让外汇投资更轻松</h2>
			<h3>一、FX50排行榜推出的市场背景</h3>
			<P>外汇跟单目前很火、很流行，参与的投资者也很多，各外汇经纪商和IB也都纷纷通过外汇跟单社区发展客户。国外已经非常成熟，国内早些时候有Inkever，交易家，followme，金融圈等，最近的云策略、大帮汇等，还有更多的跟单社区正在筹建和准备上市之中。</P>
			<p>外汇跟单看起来很简单、很容易，其实是很难、很专业。投资者面对众多的信号，包括各跟单网站、各微信群、QQ群晒单、晒EA的数据与图表，一个个看起来都那么光鲜亮丽，不要说投资者，很多专业人士都很难分辨好坏。</p>
			<p>因为，数据与图表分析没有一个统一的标准。不同跟单网站的数据分析与统计方法可能不尽相同，导致跨平台的信号很难比较。比如Zulutrade的信号分析，注重点数分析，没有本金和出入金的数据，无法直接得到真实的收益率与回撤。而MQL5等都有详细的本金与出入金记录等，因此投资者很难对Zulutraded的信号与Myfxbook的信号进行直观的比较。</p>
			<p>即使是同一个平台，因为本金的大小、出入金等影响、交易周期的长短等影响，也导致很难直观比较信号的好坏。因此，往往投资者即使看到了各种统计数据与图表，仍然是一头雾水，似懂非懂，难以真正理解，难以抉择。</p>
			<P>假如投资者很幸运，他找到了一个好的信号，他到底是按比例跟？还是按固定手数跟？ 按比例跟的话，跟多少比例合适？按固定手数跟的话，跟多少手合适？ 确定好手数或比例之后，跟单预计有多少收益？有多大的风险？绝大多数投资者是不清楚的，只是迷迷糊糊的跟着感觉走。很自然的结果是信号赚钱，投资者不赚钱甚至亏钱。</P>
			<p>FX50排行榜的推出，主要是希望能纠正和解决目前跟单投资者以上最经常出现的困惑与难题，让外汇投资真的简单、轻松又有趣。</p>
			<h3>二、FX50排行榜的产品设计思路</h3>
			<h4>1．优秀信号的来源：</h4>
			<p>FX50排行榜主要来自于各跟单网站公开的交易策略与信号，比如Myfxbook，Zulutrade，Collective2，Mql5，Signalstart等国际上著名的老牌跟单网站。 每一个策略及策略的详细分析数据，都是公开的、透明的、真实的，可以查到的。后期国内民间的高手、各优秀的理财工作室、EA策略者也会加盟到我们的信号数据库当中来。</p>
			<P>我们一直鼓励分散投资、做投资组合，我们希望投资者把资金分散在多个优质的平台（资金安全），把策略分散在多个优秀的信号上(策略稳定）。任何一个交易室开发的EA或策略，都有一定的局限性，或模式化。</P>
			<p>我们后期要开发的FX50复制基金，就是希望把资金平均的分配到50个优秀的信号上去。如果其中80%的策略是有效的，整体的FX50基金收益预期会比较稳定。对FX50基金感兴趣的朋友，可以联系我们一起合作。</p>
			<h4>2．数据归一化处理与指标计算</h4>
			<P>我们把搜集到的信号策略数据，做归一化处理。让大家都按同一个标准进行统计分析，这样得出来的各项指标才有可比性。</P>
			<P>比如本金都按1万美金计算、年化收益=50%的情况下，比较各个信号的最大回撤。或者客户投资1万美金，预期最大回撤相同的情况下，比较各信号的收益率大小。</P>
			<h4>3．FX50评估模型</h4>
			<p>单独的一项指标不能全面真实的反应信号策略的好坏。我们需要建立一个评估模型，选择多个重要的指标，并对每个指标赋予不同的权重。</p>
			<P>不同的投资理念，选择的评估指标及赋予的权重都不相同。比如Darwinex 及Fxstat等都有自己的评估模型。FX50的评估模型除了风险、收益、稳定性等指标之外，还结合我国国内的投资者与IB、资管的现状，更接地气。</P>
			<h3>三、FX50排行榜的筛选与评估方法</h3>
			<h4>1．账户要求</h4>
			<p>必须是真实账户，不能用模拟账户；</p>
			<P>必须是标准或ECN账户，不能用美分微型账户。如果想做美分账户的跟单，可看看Fxcopy，Share4you等跟单网。</P>
			<h4>2．交易时长要求</h4>
			<p>最少真实交易6个月以上，低于6个月的信号直接淘汰。短时间的交易结果完全不能反映策略的真实好坏。最典型的就是马丁交易与趋势交易。</p>
			<p>在较短的时间周期，马丁交易每个月都有稳定的盈利，而趋势交易，可能连续3-4个月都盈利很少或略有亏损。而在较长的时间周期，可能马丁一次亏损一夜回到解放前，趋势交易一波行情就盆满钵满。</p>
			<h4>3．最大持仓手数要求</h4>
			<p>这是一个最容易被投资者忽视的问题。所谓的暴利或爆仓，都与重仓有关。我们希望的理想标准是1万美金最大持仓2手，现在放宽到1万美金最大持仓5手。主要是考虑到国情，IB代理要一点合适的单量才能生存，另外，投资者的对收益的期望也普遍偏高，过低的持仓可能达不到投资者的不合理期望。</p>
			<h4>4．最大回撤的要求</h4>
			<p>最大回撤不能高于30%。目前各跟单网站计算的收益与回撤都是依据账户平仓余额，而不是真实的账户实时净值。因此能看到一条条光鲜亮丽的收益增长曲线漫天飞，尤其是马丁交易的策略。</p>
			<p>我们现在对待最大回撤的解读方式：回撤大=风险高。但反过来不成立：回撤小≠风险低。</p>
			<P>风险要综合来看，不能只看最大回撤。</P>
			<P>不久我们会开发出一款计算各信号真实最大回撤的产品。通过我们的产品，各马丁目前隐藏的扛单风险会真实的暴露出来。</P>
			<P>比如账户本金3万美金，浮动亏损2万美金，一直抗住最后反弹到盈亏5000美金平仓，账户余额3.5万美金。目前的统计结果是最大回撤=0%，曲线很漂亮。而将来通过我们的产品评估，会真实的反应最大回撤=67%。</P>
			<h4>5．其他评估指标</h4>
			<P>其他重要的指标还有最大止损点数与金额，以及盈利订单的盈利点数等。</P>
			<h3>四、FX50排行榜的数据指标说明</h3>
			<p>FX50的定位，是作为外汇投资者的一个智能的投资顾问，对外汇投资者的每个关键投资环节提供专业建议。</p>
			<h4>1. 在投资之前，你需要明确的三个问题</h4>
			<P>你打算投多少钱（USD）？</P>
			<P>你期望年回报多少？</P>
			<P>你愿意承担的风险是多少？</P>
			<h4>2. 根据您的需求，我们会推荐50个优秀的信号</h4>
			<P>为什么是50个？是希望您做投资组合，把资金分散到多个策略上去。</P>
			<h4>3. 评分值</h4>
			<p>FX50根据评估模型，对每一个信号的跟单策略给出一个综合加权评分。排行榜按评分值的高低排序。评分越高，说明这个信号的质量越高。</p>
			<p>同一个信号和策略，不同的跟单资金、不同的跟单策略，会有不同的收益和风险表现，因此评分也会变化。</p>
			<h4>4. 跟单比例</h4>
			<p>例如跟单比例=0.3，表示信号下1手，你的账户自动下0.3手。我们根据你的投资金额的大小、收益与风险的要求，每一个信号都会给你推荐一个合适的跟单比例，跟单比例太大会增加风险，跟单比例太小会收益目标达不到。</p>
			<h4>5. 最大回撤</h4>
			<p>目前是按每天的最大回撤计算。在一个统计周期内，如果第i天的净值=Di，第i天之前的最高净值是Dj，则第i天的最大回撤就是=（Dj-Di)/Dj*100%。</p>
			<h4>6. 年化交易手数</h4>
			<p>根据您预设的投资金额，如果我们推荐的跟单比例进行跟单，预计您一年的交易手数。根据这个交易手数可计算出你的佣金成本或收益。</p>
			<h4>7. 交易时长</h4>
			<p>信号账户从开始交易到现在交易天数。我们要求信号账户最低180天。时长越长越好。</p>
			<h4>8. 最小跟单资金</h4>
			<p>每一个策略的交易订单数与交易手数大小都不一样，我们计算完整复制每一个信号的交易策略所需要的最小跟单资金，我们只推荐哪些最小跟单资金小于您的投资额的信号。这样保证您的收益与风险保持与信号的一致性。</p>
			<h4>9. 预计最大持手数</h4>
			<p>根据您预设的投资金额，假如信号维持历史的交易策略不变，如果按我们推荐的跟单比例进行跟单，则预计未来一年账户最大的持仓手数。1万美金最大持仓不能超过5手，我们建议1万美金最大持仓2手会更加稳健。</p>
			<h4>10. 预计最大持仓订单数</h4>
			<p>假如信号维持历史的交易策略不变，则预计最大持仓订单数不超过之前的最大持仓订单数。一般马丁或对冲的交易订单数很多，对订单数超过20的信号要保持谨慎，一定要仔细分析。</p>
			<p>欢迎广大外汇投资者、交易员免费使用我们的产品，您在使用过程中有问题随时请与我们联系，并欢迎对我们的产品提出宝贵的改进意见和建议，谢谢！</p>
			<h3>我们的联系方式：</h3>
			<h4>邮箱：fx50top.com</h4>
			<h4>网址：www.fx50top.com</h4>
            <!-- <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">统计分析</h1>
                </div>
                /.col-lg-12
            </div>
            /.row
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Area Chart Example
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        /.panel-body
                    </div>
                    /.panel
                </div>
                /.col-lg-6
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                        /.panel-body
                    </div>
                    /.panel
                </div>
                /.col-lg-6
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Line Chart Example
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                        </div>
                        /.panel-body
                    </div>
                    /.panel
                </div>
                /.col-lg-6
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Donut Chart Example
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                        </div>
                        /.panel-body
                    </div>
                    /.panel
                </div>
                /.col-lg-6
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Morris.js Usage
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <p>Morris.js is a jQuery based charting plugin created by Olly Smith. In SB Admin, we are using the most recent version of Morris.js which includes the resize function, which makes the charts fully responsive. The documentation for Morris.js is available on their website, <a target="_blank" href="http://morrisjs.github.io/morris.js/">http://morrisjs.github.io/morris.js/</a>.</p>
                            <a target="_blank" class="btn btn-default btn-lg btn-block" href="http://morrisjs.github.io/morris.js/">View Morris.js Documentation</a>
                        </div>
                        /.panel-body
                    </div>
                    /.panel
                </div>
                /.col-lg-6
            </div>
            /.row -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
<!--     <script src="data/morris-data.js"></script>
 -->
    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>
</html>