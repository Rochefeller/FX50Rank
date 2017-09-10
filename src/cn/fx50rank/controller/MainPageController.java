package cn.fx50rank.controller;

import java.lang.annotation.Annotation;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import net.sf.json.JSONArray;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.abel533.echarts.util.EnhancedOption;

import cn.fx50rank.bean.AccountFloatingCPWL;
import cn.fx50rank.bean.AccountFloatingKDD;
import cn.fx50rank.bean.AccountFloatingSumProfit;
import cn.fx50rank.bean.AccountStatInfo;
import cn.fx50rank.bean.AccountSymbol;
import cn.fx50rank.bean.DayGrowthAndDDrate;
import cn.fx50rank.bean.DayProfitDrowdown;
import cn.fx50rank.bean.MaxLotsInfo;
import cn.fx50rank.bean.MonthGrowthAndNetWorth;
import cn.fx50rank.bean.MonthPips;
import cn.fx50rank.bean.NetPips;
import cn.fx50rank.bean.NetWorthInfo;
import cn.fx50rank.bean.OpenLots;
import cn.fx50rank.bean.OrderInfo;
import cn.fx50rank.bean.RankResultByRate;
import cn.fx50rank.interfaces.RankInterFaces;
import cn.fx50rank.services.ObtainAccountFloating;
import cn.fx50rank.services.ObtainAccountNetPips;
import cn.fx50rank.services.ObtainAccountNetWorth;
import cn.fx50rank.services.ObtainAccountStats;
import cn.fx50rank.services.ObtainAccountSymbols;
import cn.fx50rank.services.ObtainDayGrowthAndDDrate;
import cn.fx50rank.services.ObtainDayProfitDrowdown;
import cn.fx50rank.services.ObtainMaxLotsServices;
import cn.fx50rank.services.ObtainMonthGrowthAndNetWorth;
import cn.fx50rank.services.ObtainMonthPips;
import cn.fx50rank.services.ObtainOpenLotsServices;
import cn.fx50rank.services.ObtainOrderInfoListService;
import cn.fx50rank.services.ObtainRankInfoServices;
import cn.fx50rank.services.StatisticDraft;
import cn.fx50rank.systemmgmt.bean.User;


@Controller
@Scope("prototype")
public class MainPageController {
	
	@RequestMapping(value="/obtainRankByRate*", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView visitMainPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//String brokers = request.getParameter("brokers");
		String invest = request.getParameter("invest"); 
		String rate = request.getParameter("rate");
		String loss = request.getParameter("loss");
		//String live = request.getParameter("live");
		//String days = request.getParameter("days");
		//String profit = request.getParameter("profit");
		
		User user = (User) request.getSession().getAttribute("currentUser");
		if(user==null){
			request.getRequestDispatcher("/login.htm").forward(request, response);
			return new ModelAndView("system/login");
		}
		
		ModelAndView view = new ModelAndView("top50");
		
		//request.setAttribute("brokers", brokers);
		request.setAttribute("invest", invest);
		request.setAttribute("rate", rate);
		request.setAttribute("loss", loss);
		//request.setAttribute("live", live);
		//request.setAttribute("days", days);
		//request.setAttribute("profit", profit);
		//session.setAttribute("userInfo", userInfo);
		
		//request.getRequestDispatcher("pages/registerSuccess.jsp").forward(request, response);
		return view;
	}
	
	@RequestMapping(value="/rankInfoByRate*", method={RequestMethod.GET,RequestMethod.POST})
	public void showTradeHisInf(HttpServletRequest request, HttpServletResponse response)throws Exception{
		//String brokers = request.getParameter("brokers");
		String invest = request.getParameter("invest"); 
		String rate = String.valueOf(Integer.parseInt(request.getParameter("rate"))/100.0);
		String loss = String.valueOf(Integer.parseInt(request.getParameter("loss"))/100.0);
		//String live = request.getParameter("live");
		//String days = request.getParameter("days");
		//String profit = request.getParameter("profit");
		
		ArrayList<RankResultByRate> listsArrayList = new ObtainRankInfoServices().obtainRankResultsByRate(invest, rate, loss);		
		JSONArray jsonArray = JSONArray.fromObject(listsArrayList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", jsonArray);
		
		//System.out.println(jsonObject.toString());
		
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
				
	}
	
	@RequestMapping(value="/obtainOrderInfoList*", method={RequestMethod.GET,RequestMethod.POST})
	public void obtainOrderList(HttpServletRequest request, HttpServletResponse response)throws Exception{
		//String brokers = request.getParameter("brokers");
		String account_id = request.getParameter("account_id"); 
		//String live = request.getParameter("live");
		//String days = request.getParameter("days");
		//String profit = request.getParameter("profit");
		
		ArrayList<OrderInfo> listsArrayList = new ObtainOrderInfoListService().obtainRankResultsByRate(account_id);		
		JSONArray jsonArray = JSONArray.fromObject(listsArrayList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", jsonArray);
		
		//System.out.println(jsonObject.toString());
		
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
				
	}	
	
	@RequestMapping(value="/obtainTraderInfoPage*", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showTraderInfoPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id");
		String planN = request.getParameter("planN");//跟单比例
		String planInvest = request.getParameter("planInvest");
		ModelAndView view = new ModelAndView("userInfo");
		request.setAttribute("account_id", account_id);
		request.setAttribute("planN", planN);//跟单比例
		request.setAttribute("planInvest", planInvest);
		return view;
	}
	
	@RequestMapping(value="/obtainOrderProfitAndLossPage*", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showOrderProfitAndLossPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id_1");
		ModelAndView view = new ModelAndView("orderProfitAndLoss");
		return view;
	}	
	
	@RequestMapping(value="/obtainHistoryDrowDownPage*", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showAccountHisDrowDownPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id_1");
		String planN = request.getParameter("planN");
		ModelAndView view = new ModelAndView("accountHisDrowDown");
		return view;
	}	
	
	@RequestMapping(value="/obtainAccountStatAndOrders*", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showAccountStatandOrders(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id_1");
		
		ModelAndView view = new ModelAndView("accountStatInfo");
		AccountStatInfo accountStatInfo = new AccountStatInfo();
		accountStatInfo = new ObtainAccountStats().obtainaccountStats(account_id);
		request.setAttribute("accountStatInfo", accountStatInfo);
		
		return view;
	}
	
	@RequestMapping(value="/RankprofitDraft*", method={RequestMethod.GET, RequestMethod.POST})
	public void drowRank(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id");
		
		//获得持仓手数和持仓订单数
		ObtainMaxLotsServices obtainMaxLotsServices = new ObtainMaxLotsServices();
		ArrayList<MaxLotsInfo> resultsArrayList = obtainMaxLotsServices.obtainMaxLots(account_id);
		List<Integer> xMaxLotsList= new ArrayList<Integer>();
		List<Double> yMaxLotsList = new ArrayList<Double>();
		List<Double> yOrdersList = new ArrayList<Double>();
		
		for(int i=0;i<resultsArrayList.size();i++){
			xMaxLotsList.add(i+1);
			yMaxLotsList.add(resultsArrayList.get(i).getMaxLots());
			yOrdersList.add(resultsArrayList.get(i).getOrders());
		}

		//获得建仓手数
		ObtainOpenLotsServices obtainOpenLotsServices = new ObtainOpenLotsServices();
		ArrayList<OpenLots> resultArrayList1 = obtainOpenLotsServices.obatinOpenLots(account_id);
		List<Integer> xOpenLotsList= new ArrayList<Integer>();
		List<Double> yOpenLotsList = new ArrayList<Double>();
		
		//获得订单利润和订单点数
		List<Double> yOrderNetProfitList = new ArrayList<Double>();
		List<Double> yOrderPipsList = new ArrayList<Double>();
		for(int i=0;i<resultArrayList1.size();i++){
			xOpenLotsList.add(i+1);
			yOpenLotsList.add(resultArrayList1.get(i).getLots());
			yOrderNetProfitList.add(resultArrayList1.get(i).getNetProfit());
			yOrderPipsList.add(resultArrayList1.get(i).getPips());
		}
		
		//	获得信号产品分布
		ObtainAccountSymbols obtainAccountSymbols = new ObtainAccountSymbols();
		List<AccountSymbol> resultArrayList2 = obtainAccountSymbols.obatAccountSymbols(account_id);
		//List<String> xSymbolList = new ArrayList<String>();
		//List<Double> ySymbolList = new ArrayList<Double>();
		Map<String, Double> symbolMap = new HashMap<String, Double>();
		for(int i=0;i<resultArrayList2.size();i++){
			String symbolString = resultArrayList2.get(i).getSymbol();
			int count = resultArrayList2.get(i).getCount();
			symbolMap.put(symbolString, (double)count);
/*			xSymbolList.add(resultArrayList2.get(i).getSymbol());
			ySymbolList.add((double)resultArrayList2.get(i).getCount());*/
		}
		
		StatisticDraft statisticDraft = new StatisticDraft();
		EnhancedOption optionMaxLots = statisticDraft.drawOneBar(xMaxLotsList, yMaxLotsList, "最大持仓分布图", "最大持仓", "手");
		EnhancedOption optionOrders = statisticDraft.drawOneBar(xMaxLotsList, yOrdersList, "持仓订单分布图", "持仓订单", "");
		EnhancedOption optionOpenLots =statisticDraft.drawOneBar(xOpenLotsList, yOpenLotsList, "建仓手数分布图", "建仓手数", "手");
		EnhancedOption optionOrderNetprofit =statisticDraft.drawOneBar(xOpenLotsList, yOrderNetProfitList, "订单利润分布图", "订单利润", "");
		EnhancedOption optionOrderPips =statisticDraft.drawOneBar(xOpenLotsList, yOrderPipsList, "订单点数分布图", "订单点数", "");
        EnhancedOption optionOrderSymbols = statisticDraft.drawPie(symbolMap, "交易产品分布图");
		//EnhancedOption optionOrderSymbols = statisticDraft.drawOneBarString(xSymbolList, ySymbolList, "交易产品分布图", "", "");
		JSONObject jsonObject = new JSONObject();
        jsonObject.put("optionMaxLots", optionMaxLots);
        jsonObject.put("optionOrders", optionOrders);
        jsonObject.put("optionOpenLots", optionOpenLots);
        jsonObject.put("optionOrderNetprofit", optionOrderNetprofit);
        jsonObject.put("optionOrderPips", optionOrderPips);
        jsonObject.put("optionOrderSymbols", optionOrderSymbols);
        
        jsonObject.put("success", true);
        
        request.setAttribute("account_id", account_id);
        
        //System.out.println(jsonObject.toString());
        response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		//System.out.println(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}

	@RequestMapping(value="/drawOrderProfitAndLoss*", method={RequestMethod.GET, RequestMethod.POST})
	public void drowOrderProfitAndLoss(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id");
		
		//获得订单累计利润和订单利润回撤
		ObtainAccountNetWorth obtainAccountNetWorth = new ObtainAccountNetWorth();
		List<NetWorthInfo> resultsArrayList = obtainAccountNetWorth.obtainAccountNetWorth(account_id);
		List<Integer> xNetWorthList= new ArrayList<Integer>();
		List<Double> yNetWorthList = new ArrayList<Double>();
		List<Double> yDrowdownProfitList = new ArrayList<Double>();
		
		for(int i=0;i<resultsArrayList.size();i++){
			xNetWorthList.add(i+1);
			yNetWorthList.add(resultsArrayList.get(i).getNetWorth());
			yDrowdownProfitList.add(resultsArrayList.get(i).getDrawDown());
		}
		//获得订单累计点数和订单点数回撤
		ObtainAccountNetPips obtainAccountNetPips = new ObtainAccountNetPips();
		List<NetPips> resultsArrayList1 = obtainAccountNetPips.obtainAccountNetPips(account_id);
		List<Integer> xNetPipsList = new ArrayList<Integer>();
		List<Double> yNetPipsList = new ArrayList<Double>();
		List<Double> yDrowdownPipsList = new ArrayList<Double>();
		
 		for(int i=0;i<resultsArrayList1.size();i++){
			xNetPipsList.add(i+1);
			yNetPipsList.add(resultsArrayList1.get(i).getNetPips());
			yDrowdownPipsList.add(resultsArrayList1.get(i).getDrawDownPips());
		}
		
		StatisticDraft statisticDraft = new StatisticDraft();
		EnhancedOption optionNetWorth = statisticDraft.drawOneBar(xNetWorthList, yNetWorthList, "订单累计利润图", "订单累计利润(USD)", "");
		EnhancedOption optionNetPips = statisticDraft.drawOneBar(xNetWorthList, yNetPipsList, "订单累计点数图", "订单累计点数", "");
		EnhancedOption optionProfitDrowdown = statisticDraft.drawOneBar(xNetWorthList, yDrowdownProfitList, "订单利润回撤图", "订单利润(USD)回撤", "");
		EnhancedOption optionPipsDrowdown = statisticDraft.drawOneBar(xNetWorthList, yDrowdownPipsList, "订单点数回撤图", "订单点数回撤", "");
		
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("optionNetWorth", optionNetWorth);
        jsonObject.put("optionNetPips", optionNetPips);
        jsonObject.put("optionProfitDrowdown", optionProfitDrowdown);
        jsonObject.put("optionPipsDrowdown", optionPipsDrowdown);
        
        jsonObject.put("success", true);
        
        request.setAttribute("account_id", account_id);
        
        //System.out.println(jsonObject.toString());
        response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		//System.out.println(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	@RequestMapping(value="/drawAccountHisDrowdown*", method={RequestMethod.GET, RequestMethod.POST})
	public void drawAccountHisDrowdown(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id");
		String invest = request.getParameter("planInvest");
		String N = request.getParameter("planN");
		
		//获得帐号每日利润回撤
		/*ObtainDayProfitDrowdown obtainDayProfitDrowdown = new ObtainDayProfitDrowdown();
		List<DayProfitDrowdown> resultsArrayList = obtainDayProfitDrowdown.obtainDayProfitDrowdowns(account_id);
		List<Integer> xDayProfitDrowdownList= new ArrayList<Integer>();
		List<Double> yDayProfitDrowdownList = new ArrayList<Double>();
		
		for(int i=0;i<resultsArrayList.size();i++){
			xDayProfitDrowdownList.add(i+1);
			yDayProfitDrowdownList.add(resultsArrayList.get(i).getDrawDown());
		}*/
		//获得帐号每日收益率和每日最大回撤率
		ObtainDayGrowthAndDDrate obtainDayGrowthAndDDrate = new ObtainDayGrowthAndDDrate();
		List<DayGrowthAndDDrate> resultsArrayList1 = obtainDayGrowthAndDDrate.obtainDayGrowthAndDDrates(account_id, invest, N);
		List<String> xDayGrowthAndDDrateList = new ArrayList<String>();
		List<Double> yGrowthList = new ArrayList<Double>();
		List<Double> yDDrateList = new ArrayList<Double>();
		
 		for(int i=0;i<resultsArrayList1.size();i++){
 			xDayGrowthAndDDrateList.add(resultsArrayList1.get(i).getT());
 			yGrowthList.add(resultsArrayList1.get(i).getGrowth());
			yDDrateList.add(resultsArrayList1.get(i).getDrawDownRate());
		}
		
 		//获得帐号每月利润和月收益率
 		ObtainMonthGrowthAndNetWorth obtainMonthGrowthAndNetWorth = new ObtainMonthGrowthAndNetWorth();
 		List<MonthGrowthAndNetWorth> resultsArrayList2 = obtainMonthGrowthAndNetWorth.obtainMonthGrowthAndNetWorths(account_id, invest, N);
 		List<String> xMonthGrowthAndNetWorthList = new ArrayList<String>();
 		List<Double> yMonthGrowthList = new ArrayList<Double>();
 		List<Double> yMonthNetWorthList = new ArrayList<Double>();
 		
 		for(int i=0;i<resultsArrayList2.size();i++){
 			xMonthGrowthAndNetWorthList.add(resultsArrayList2.get(i).getT());
 			yMonthGrowthList.add(resultsArrayList2.get(i).getGrowth());
 			yMonthNetWorthList.add(resultsArrayList2.get(i).getProfit());
 		}
 		
 		//获得每月点数
 		ObtainMonthPips obtainMonthPips = new ObtainMonthPips();
 		List<MonthPips> resultsArrayList3 = obtainMonthPips.obtainMonthPips(account_id);
 		List<String> xMonthPipsList = new ArrayList<String>();
 		List<Double> yMonthPipsList = new ArrayList<Double>();
 		
 		for(int i=0;i<resultsArrayList3.size();i++){
 			xMonthPipsList.add(resultsArrayList3.get(i).getT());
 			yMonthPipsList.add(resultsArrayList3.get(i).getPips());
 		}
 		
 		
		StatisticDraft statisticDraft = new StatisticDraft();
		//EnhancedOption optionProfitDrowDown = statisticDraft.drawOneBar(xDayProfitDrowdownList, yDayProfitDrowdownList, "每日利润回撤图", "每日利润(USD)回撤", "");
		EnhancedOption optionGrowth = statisticDraft.drawOneBarString(xDayGrowthAndDDrateList, yGrowthList, "每日累计收益增长率(%)图", "每日累计收益增长率(%)", "");
		EnhancedOption optiontDrowDownRate = statisticDraft.drawOneBarString(xDayGrowthAndDDrateList, yDDrateList, "每日最大回撤率(%)图", "每日最大回撤(%)", "");
		EnhancedOption optionMonthNetWorth = statisticDraft.drawOneBarString(xMonthGrowthAndNetWorthList, yMonthNetWorthList, "每月利润(USD)图", "每月利润(USD)", "");
		EnhancedOption optionMonthGrowth = statisticDraft.drawOneBarString(xMonthGrowthAndNetWorthList, yMonthGrowthList, "月收益率(%)图", "月收益率", "");
		EnhancedOption optionMonthPips = statisticDraft.drawOneBarString(xMonthPipsList, yMonthPipsList, "每月点数图", "每月点数", "");
		
		
        JSONObject jsonObject = new JSONObject();
        //jsonObject.put("optionProfitDrowDown", optionProfitDrowDown);
        jsonObject.put("optionGrowth", optionGrowth);
        jsonObject.put("optiontDrowDownRate", optiontDrowDownRate);
        jsonObject.put("optionMonthNetWorth", optionMonthNetWorth);
        jsonObject.put("optionMonthGrowth", optionMonthGrowth);
        jsonObject.put("optionMonthPips", optionMonthPips);
        
        jsonObject.put("success", true);
        
        request.setAttribute("account_id", account_id);
        
        //System.out.println(jsonObject.toString());
        response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		//System.out.println(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	@RequestMapping(value="/obatinAccountFloatingPage*", method={RequestMethod.GET, RequestMethod.POST})
	ModelAndView obtainAccountFloatingPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView view = new ModelAndView("accountFloating");
		return view;
	}
	
	@RequestMapping(value="/drawAccountFloatingDraft*", method={RequestMethod.GET, RequestMethod.POST})
	public void obtainAccountFloatingDraft(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String accountId = request.getParameter("account_id");
		
		ObtainAccountFloating obtainAccountFloating = new ObtainAccountFloating();
		List<AccountFloatingCPWL> accountFloatingCPWLs = obtainAccountFloating.obtainAccountFloatingCPWL(accountId);
		List<String> xFloatingCPWLList = new ArrayList<String>();
		List<Double> yFloatingCPWLList = new ArrayList<Double>();
		for (int i = 0; i < accountFloatingCPWLs.size(); i++) {
			xFloatingCPWLList.add(accountFloatingCPWLs.get(i).getT());
			String teString = accountFloatingCPWLs.get(i).getCloseNetWorth();
			double temp=Double.parseDouble(teString);
			yFloatingCPWLList.add(temp);
		}
				
		List<AccountFloatingKDD> accountFloatingKDDs = obtainAccountFloating.obtainAccountFloatingKDD(accountId);
		List<String> xFloatingKDD = new ArrayList<String>();
		List<Double> yFloatingKDD = new ArrayList<Double>();
		for(int i=0;i<accountFloatingKDDs.size();i++){
			xFloatingKDD.add(accountFloatingKDDs.get(i).getT());
			yFloatingKDD.add(Double.parseDouble(accountFloatingKDDs.get(i).getLineNetWorth()));
		}
		
		List<AccountFloatingSumProfit> accountFloatingSumProfits = obtainAccountFloating.obtainAccountFloatingSumProfit(accountId);
		List<String> xFloatingSumProfit = new ArrayList<String>();
		List<Double> yFloatingSumProfit= new ArrayList<Double>();
		for(int i=0;i<accountFloatingSumProfits.size();i++){
			xFloatingSumProfit.add(accountFloatingSumProfits.get(i).getKID());
			yFloatingSumProfit.add(accountFloatingSumProfits.get(i).getSumProfit());
		}
		
		StatisticDraft statisticDraft = new StatisticDraft();
		
		EnhancedOption optionAccountFloatingCPWL = statisticDraft.drawOneBarString(xFloatingCPWLList, yFloatingCPWLList, "信号平仓（浮动）盈亏", "平仓（浮动）盈亏", "$");
		EnhancedOption optionAccountFloatingKDD = statisticDraft.drawOneBarString(xFloatingKDD, yFloatingKDD, "信号浮动盈亏净值回撤", "浮动盈亏净值回撤", "$");
		EnhancedOption optionAccountFloatingSumProfit = statisticDraft.drawOneBarString(xFloatingSumProfit, yFloatingSumProfit, "信号利润浮动盈亏", "利润浮动盈亏", "$");
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("optionAccountFloatingCPWL", optionAccountFloatingCPWL);
		jsonObject.put("optionAccountFloatingKDD", optionAccountFloatingKDD);
		jsonObject.put("optionAccountFloatingSumProfit", optionAccountFloatingSumProfit);
		
		jsonObject.put("success", true);
		
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}
	
}
