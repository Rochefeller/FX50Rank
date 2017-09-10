package cn.fx50rank.interfaces;



import java.io.InputStream;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.Consts;


import org.apache.http.NameValuePair;

import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

import com.sun.xml.internal.stream.Entity;

import cn.fx50rank.bean.AccountFloatingCPWL;
import cn.fx50rank.bean.AccountFloatingKDD;
import cn.fx50rank.bean.AccountFloatingSumProfit;
import cn.fx50rank.bean.AccountSearchInfo;
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



public class RankInterFaces {
	
	/*按比例跟单排行榜接口*/
	public ArrayList<RankResultByRate> testBoardRate( String investStr, String rateStr, String lossStr, String serviceUrl) throws Exception{
		ArrayList<RankResultByRate> results = new ArrayList<RankResultByRate>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		//params.add(new BasicNameValuePair("broker", brokerStr));
		params.add(new BasicNameValuePair("invest", investStr));
		params.add(new BasicNameValuePair("rate", rateStr));
		params.add(new BasicNameValuePair("loss", lossStr));
		//params.add(new BasicNameValuePair("days", daysStr));
		//params.add(new BasicNameValuePair("profit", profitStr));
		//params.add(new BasicNameValuePair("live", liveStr));
		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i=0;i<jsonArray.length();i++){
			RankResultByRate  rankResultByRates = new RankResultByRate();
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			
			rankResultByRates.setId(i+1);
			double sort = jsonObject.getDouble("sort");//排行榜排序标识
			rankResultByRates.setSort(sort);
			int account = jsonObject.getInt("account");//信号在来源平台的账号
			rankResultByRates.setAccount(account);
			int account_id = jsonObject.getInt("account_id");//信号编号（系统）
			rankResultByRates.setAccount_id(account_id);
			String name = jsonObject.getString("name");//信号名称
			rankResultByRates.setName(name);
			String broker = jsonObject.getString("broker");//信号来源网站
			rankResultByRates.setBroker(broker);
			
			JSONObject paras = jsonObject.getJSONObject("paras");
			//double Profit = paras.getDouble("Profit");//最小利润
			int PlanInvest = paras.getInt("PlanInvest");//预期投资金额
			rankResultByRates.setPlanInvest(PlanInvest);
			double PlanLoss = paras.getDouble("PlanLoss");
			
			//int Live = paras.getInt("Live");//信号最近活跃参数
			
			double PlanRate = paras.getDouble("PlanRate");//预期收益参数
			
			JSONObject plan = jsonObject.getJSONObject("plan");
			int Days = plan.getInt("Days");//信号最小交易时长
			rankResultByRates.setDays(Days);
			double MaxLots = plan.getDouble("MaxLots");//预期最大持仓手数
			rankResultByRates.setMaxLots(MaxLots);
			int CountYearTotalOrders = plan.getInt("CountYearTotalOrders");//信号年化订单数
			rankResultByRates.setCountYearTotalOrders(CountYearTotalOrders);
			BigDecimal bigDecimal = new BigDecimal(plan.getDouble("MaxRateDrawDown")*100);
			double MaxRateDrawDownDouble =bigDecimal.setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();//最大回撤率
			rankResultByRates.setMaxRateDrawDown(String.valueOf(MaxRateDrawDownDouble)+"%");
			double N = plan.getDouble("N");//预期手数跟单比例（N
			rankResultByRates.setN(N);
			double MinPutInvest = plan.getDouble("MinPutInvest");//信号所需最小跟单资金
			rankResultByRates.setMinPutInvest(MinPutInvest);
			BigDecimal bigDecimal2 = new BigDecimal(plan.getDouble("RateProfitYear")*100);
			double RateProfitYearDouble = bigDecimal2.setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();//预期年化收益(rate)
			rankResultByRates.setRateProfitYear(String.valueOf(RateProfitYearDouble)+"%");
			double MaxDrawDown = plan.getDouble("MaxDrawDown");//预期最大回撤
			rankResultByRates.setMaxDrawDown(MaxDrawDown);
			double MaxOpenOrders = plan.getDouble("MaxOpenOrders");//预期最大持仓订单数
			rankResultByRates.setMaxOpenOrders(MaxOpenOrders);
			double RateWinLoss = plan.getDouble("RateWinLoss");//预期收益风险比例
			rankResultByRates.setRateWinLoss(RateWinLoss);
			double SumYearLots = plan.getDouble("SumYearLots");//预期年化交易总手数
			rankResultByRates.setSumYearLots(SumYearLots);
			double NetWorth = plan.getDouble("NetWorth");//预期净值
			double Balance = plan.getDouble("Balance");//预期余额
			double Position = plan.getDouble("Position");//持仓订单浮动盈亏
			
			results.add(rankResultByRates);
		}
		
        return results;
		
	}

	/*按固定手数排行榜接口*/
	public static void testBoardLots(String brokerStr, String investStr, String lotsStr, String daysStr, String profitStr, String liveStr, String serviceUrl) throws Exception{

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("brokers", brokerStr));
		params.add(new BasicNameValuePair("invest", investStr));
		params.add(new BasicNameValuePair("lots", lotsStr));
		params.add(new BasicNameValuePair("days", daysStr));
		params.add(new BasicNameValuePair("profit", profitStr));
		params.add(new BasicNameValuePair("live", liveStr));
		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));  
        System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		System.out.println("status=" + nCode);

		System.out.println(response.getEntity().getContentType().getName());
		System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			
			double sort = jsonObject.getDouble("sort");//排行榜排序标识
			int account = jsonObject.getInt("account");//信号在来源平台的账号
			
			int account_id = jsonObject.getInt("account_id");//信号编号（系统）
			String name = jsonObject.getString("name");//信号名称
			String broker = jsonObject.getString("broker");//信号来源网站
			
			
			JSONObject paras = jsonObject.getJSONObject("paras");
			double Profit = paras.getDouble("Profit");//最小利润
			int PlanInvest = paras.getInt("PlanInvest");//预期投资金额
			int Days = paras.getInt("Days");//信号最小交易时长
			int Live = paras.getInt("Live");//信号最近活跃参数
			String Brokers = paras.getString("Brokers");//null
			double PlanLots = paras.getDouble("PlanLots");//预期最大持仓手数
			
			JSONObject plan = jsonObject.getJSONObject("plan");
			double MaxLots = plan.getDouble("MaxLots");//预期最大持仓手数
			int CountYearTotalOrders = plan.getInt("CountYearTotalOrders");//预期年化交易总订单数
			double MaxRateDrawDown =plan.getDouble("MaxRateDrawDown");//预期最大回撤率
			double M = plan.getDouble("M");//预计固定跟单手数（M)
			double MinPutInvest = plan.getDouble("MinPutInvest");//信号所需最小跟单资金
			double RateProfitYear = plan.getDouble("RateProfitYear");//预期年化收益
			double MaxDrawDown = plan.getDouble("MaxDrawDown");//预期最大回撤
			double MaxOpenOrders = plan.getDouble("MaxOpenOrders");
			double RateWinLoss = plan.getDouble("RateWinLoss");//预期收益风险比例
			double SumYearLots = plan.getDouble("SumYearLots");//预期年化交易总手数
			double NetWorth = plan.getDouble("NetWorth");//预期净值
			double Balance = plan.getDouble("Balance");//预期余额
			double Position = plan.getDouble("Position");//持仓订单浮动盈亏
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        System.exit(0);
		
	}
	
	/*按最大回撤排行榜接口*/
	public static void testBoardDd(String brokerStr, String investStr, String ddStr, String daysStr, String profitStr, String liveStr, String serviceUrl) throws Exception{

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("brokers", brokerStr));
		params.add(new BasicNameValuePair("invest", investStr));
		params.add(new BasicNameValuePair("dd", ddStr));
		params.add(new BasicNameValuePair("days", daysStr));
		params.add(new BasicNameValuePair("profit", profitStr));
		params.add(new BasicNameValuePair("live", liveStr));
		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));  
        System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		System.out.println("status=" + nCode);

		System.out.println(response.getEntity().getContentType().getName());
		System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			
			double sort = jsonObject.getDouble("sort");//排行榜排序标识
			int account = jsonObject.getInt("account");//信号在来源平台的账号
			int account_id = jsonObject.getInt("account_id");//信号编号（系统）
			String name = jsonObject.getString("name");//信号名称
			String broker = jsonObject.getString("broker");//信号来源网站
			
			
			JSONObject paras = jsonObject.getJSONObject("paras");
			double Profit = paras.getDouble("Profit");//最小利润
			int PlanInvest = paras.getInt("PlanInvest");//预期投资金额
			int Days = paras.getInt("Days");//信号最小交易时长
			int Live = paras.getInt("Live");//信号最近活跃参数
			String accounts = paras.getString("accounts");
			String Brokers = paras.getString("Brokers");//null
			double PlanDD = paras.getDouble("PlanDD");//预期投资收益参数(USD)
			
			JSONObject plan = jsonObject.getJSONObject("plan");
			int CountYearTotalOrders = plan.getInt("CountYearTotalOrders");//预期年化交易总订单数
			double SumYearLots = plan.getDouble("SumYearLots");//预期年化交易总手数
			double MaxDrawDown = plan.getDouble("MaxDrawDown");//预期最大回撤
			double MaxRateDrawDown =plan.getDouble("MaxRateDrawDown");//预期最大回撤率
			double N = plan.getDouble("N");//预期手数跟单比例（N
			double MinPutInvest = plan.getDouble("MinPutInvest");//信号所需最小跟单资金
			double RateProfitYear = plan.getDouble("RateProfitYear");//预期年化收益
			double NetWorth = plan.getDouble("NetWorth");//预期净值
			double Position = plan.getDouble("Position");//持仓订单浮动盈亏
			double RateWinLoss = plan.getDouble("RateWinLoss");//预期收益风险比例
			double Balance = plan.getDouble("Balance");	//预期余额		
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        System.exit(0);
		
	}

	
	public static void testBoardBrokers(  String serviceUrl) throws Exception{

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "brokers"));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));  
        System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		System.out.println("status=" + nCode);

		System.out.println(response.getEntity().getContentType().getName());
		System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i=0;i<jsonArray.length();i++){
			String broker = jsonArray.getString(i);
		}
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        System.exit(0);
		
	}

	/*信号统计信息获取*/
	public static void testBoardAccountStat( String account_idStr, String serviceUrl) throws Exception{

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "stat"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str =EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));  
        System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		System.out.println("status=" + nCode);

		System.out.println(response.getEntity().getContentType().getName());
		System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			int index = jsonObject.getInt("index");
			String key = jsonObject.getString("key");
			double value = jsonObject.getDouble("value");
			String value_str = jsonObject.getString("value_str");
			String desc = jsonObject.getString("desc");
			int id = jsonObject.getInt("id");
			int account_id = jsonObject.getInt("account_id");
		}
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        System.exit(0);
		
	}

	/*信号按天回测详情*/
	public static void testBoardAccountDdd( String account_idStr, String serviceUrl) throws Exception{

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "ddd"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8));  
        System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		System.out.println("status=" + nCode);

		System.out.println(response.getEntity().getContentType().getName());
		System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Profit = jsonObject2.getDouble("Profit");//当日利润
			String t = jsonObject2.getString("t");//订单平仓时间
			double DrawDown = jsonObject2.getDouble("DrawDown");//回撤值
			double NetWorth = jsonObject2.getDouble("NetWorth");//当日净值
		}
		double MaxRateDrawDown = jsonObject.getDouble("MaxRateDrawDown");//总体最大回撤率
		double MaxDrawDown = jsonObject.getDouble("MaxDrawDown");//总体最大回撤
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        System.exit(0);
		
	}

	/*信号按订单回撤详情*/
	public List<NetWorthInfo> testAccountDdo( String account_idStr, String serviceUrl) throws Exception{
		List<NetWorthInfo> results = new ArrayList<NetWorthInfo>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "ddo"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			NetWorthInfo netWorthInfo = new NetWorthInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Profit = jsonObject2.getDouble("Profit");//当日利润
			netWorthInfo.setProfit(Profit);
			String t = jsonObject2.getString("t");//订单平仓时间
			netWorthInfo.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");//回撤值
			netWorthInfo.setDrawDown(DrawDown);
			double NetWorth = jsonObject2.getDouble("NetWorth");//当日净值
			netWorthInfo.setNetWorth(NetWorth);
			results.add(netWorthInfo);
		}
		double MaxRateDrawDown = jsonObject.getDouble("MaxRateDrawDown");//总体最大回撤率
		double MaxDrawDown = jsonObject.getDouble("MaxDrawDown");//总体最大回撤
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}

	/*信号按订单累积点数及其分布详情/api/account?cat=pips*/
	public List<NetPips> testAccountPips( String account_idStr, String serviceUrl) throws Exception{
		List<NetPips> results = new ArrayList<NetPips>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "pips"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i =0;i<jsonArray.length();i++){
			NetPips netPips = new NetPips();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			int order_id = jsonObject2.getInt("order_id");//当日利润
			netPips.setOrder_id(order_id);
			double DrawDownPips = jsonObject2.getDouble("DrawDownPips");//订单平仓时间
			netPips.setDrawDownPips(DrawDownPips);
			String OpenTime = jsonObject2.getString("OpenTime");//回撤值
			netPips.setOpenTime(OpenTime);
			double NetPips = jsonObject2.getDouble("NetPips");//当日净值
			netPips.setNetPips(NetPips);
			results.add(netPips);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}	

	/*交易产品分布图/api/account?cat=symbols*/
	public List<AccountSymbol> testAccountSymbols( String account_idStr, String serviceUrl) throws Exception{
		List<AccountSymbol> results = new ArrayList<AccountSymbol>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "symbols"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i =0;i<jsonArray.length();i++){
			AccountSymbol accountSymbol = new AccountSymbol();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			int Count = jsonObject2.getInt("Count");//当日利润
			accountSymbol.setCount(Count);
			String Symbol = jsonObject2.getString("Symbol");
			accountSymbol.setSymbol(Symbol);
			int account_id = jsonObject2.getInt("account_id");
			accountSymbol.setAccount_id(account_id);
			results.add(accountSymbol);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}		
	
	/*信号（原始）回撤详情 /api/account?cat=ddd 按日*/
	public List<DayProfitDrowdown> testAccountDdd( String account_idStr, String serviceUrl) throws Exception{
		List<DayProfitDrowdown> results = new ArrayList<DayProfitDrowdown>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "ddd"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			DayProfitDrowdown dayProfitDrowdown = new DayProfitDrowdown();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Profit = jsonObject2.getDouble("Profit");
			dayProfitDrowdown.setProfit(Profit);
			/*double Growth = jsonObject2.getDouble("Growth");
			dayProfitDrowdown.setGrowth(Growth);*/
			double DrawDownRate = jsonObject2.getDouble("DrawDownRate");
			dayProfitDrowdown.setDrawDownRate(DrawDownRate);
			String t = jsonObject2.getString("t");
			dayProfitDrowdown.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");
			dayProfitDrowdown.setDrawDown(DrawDown);
			double NetWorth = jsonObject2.getDouble("NetWorth");
			dayProfitDrowdown.setNetWorth(NetWorth);
			results.add(dayProfitDrowdown);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}	

	/*信号（预期）按天回撤详情 /api/account?cat=plan.ddd 预期按日计算*/
	public List<DayGrowthAndDDrate> testAccountPlanDdd( String account_idStr, String investStr, String NStr, String serviceUrl) throws Exception{
		List<DayGrowthAndDDrate> results = new ArrayList<DayGrowthAndDDrate>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "plan.ddd"));
		params.add(new BasicNameValuePair("account_id", account_idStr));
		params.add(new BasicNameValuePair("invest", investStr));
		params.add(new BasicNameValuePair("N", NStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			DayGrowthAndDDrate dayGrowthAndDDrate = new DayGrowthAndDDrate();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Growth = jsonObject2.getDouble("Growth");
			dayGrowthAndDDrate.setGrowth(Growth);
			double DrawDownRate = jsonObject2.getDouble("DrawDownRate");
			dayGrowthAndDDrate.setDrawDownRate(DrawDownRate);
			String t = jsonObject2.getString("t");
			dayGrowthAndDDrate.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");
			dayGrowthAndDDrate.setDrawDown(DrawDown);
			double NetWorth = jsonObject2.getDouble("NetWorth");
			dayGrowthAndDDrate.setNetWorth(NetWorth);
			double Profit = jsonObject2.getDouble("Profit");
			dayGrowthAndDDrate.setProfit(Profit);
			results.add(dayGrowthAndDDrate);	
			
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}
	
	/*信号（预期）按月回撤详情 按日 /api/account?cat=plan.ddm 预期按月计算*/
	public List<MonthGrowthAndNetWorth> testAccountPlanDdm( String account_idStr, String investStr, String NStr, String serviceUrl) throws Exception{
		List<MonthGrowthAndNetWorth> results = new ArrayList<MonthGrowthAndNetWorth>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "plan.ddm"));
		params.add(new BasicNameValuePair("account_id", account_idStr));
		params.add(new BasicNameValuePair("invest", investStr));
		params.add(new BasicNameValuePair("N", NStr));
		
		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			MonthGrowthAndNetWorth monthGrowthAndNetWorth = new MonthGrowthAndNetWorth();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Growth = jsonObject2.getDouble("Growth");
			monthGrowthAndNetWorth.setGrowth(Growth);
			double DrawDownRate = jsonObject2.getDouble("DrawDownRate");
			monthGrowthAndNetWorth.setDrawDownRate(DrawDownRate);
			String t = jsonObject2.getString("t");
			monthGrowthAndNetWorth.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");
			monthGrowthAndNetWorth.setDrawDown(DrawDown);
			double NetWorth = jsonObject2.getDouble("NetWorth");
			monthGrowthAndNetWorth.setNetWorth(NetWorth);
			double Profit = jsonObject2.getDouble("Profit");
			monthGrowthAndNetWorth.setProfit(Profit);
			results.add(monthGrowthAndNetWorth);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}
	
	/*每月点数/api/account?cat=mpips*/
	public List<MonthPips> testAccountMpips( String account_idStr, String serviceUrl) throws Exception{
		List<MonthPips> results = new ArrayList<MonthPips>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "mpips"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		for(int i =0;i<jsonArray.length();i++){
			MonthPips monthPips = new MonthPips();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			int Y = jsonArray.getJSONObject(i).getInt("Y");
			monthPips.setY(Y);
			int M = jsonArray.getJSONObject(i).getInt("M");
			monthPips.setM(M);
			int account_id = jsonArray.getJSONObject(i).getInt("account_id");
			monthPips.setAccount_id(account_id);
			double Pips = jsonArray.getJSONObject(i).getDouble("Pips");
			monthPips.setPips(Pips);
			String t = jsonArray.getJSONObject(i).getString("t");
			monthPips.setT(t);
			results.add(monthPips);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
        
		return results;
		
	}
	/*信号最大持仓详情*/
	
	public ArrayList<MaxLotsInfo> testBoardAccountLots( String account_idStr, String serviceUrl) throws Exception{
		
		ArrayList<MaxLotsInfo> results = new ArrayList<MaxLotsInfo>();
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "lots"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		int MaxOpenOrders = jsonObject.getInt("MaxOpenOrders");//最大持仓订单数
		double MinOpenLots = jsonObject.getDouble("MinOpenLots");//最小持仓手数
		double MaxOpenLots = jsonObject.getDouble("MaxOpenLots");//最大持仓手数
		
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			MaxLotsInfo maxLotsInfo = new MaxLotsInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double MaxLots = jsonObject2.getDouble("MaxLots");//历史最大持仓
			maxLotsInfo.setMaxLots(MaxLots);
			int Orders = jsonObject2.getInt("Orders");//历史最大持仓订单数
			maxLotsInfo.setOrders(Orders);
			String Type = jsonObject2.getString("Type");
			maxLotsInfo.setType(Type);
			String t = jsonObject2.getString("t");//该订单平仓时间
			maxLotsInfo.setT(t);
			double MinLots = jsonObject2.getDouble("MinLots");//历史最小持仓
			maxLotsInfo.setMinLots(MinLots);
			results.add(maxLotsInfo);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
		
	}

	/*信号订单获取--展示订单列表 /api/orders?cat=orders*/
	public ArrayList<OrderInfo> testOrders(String account_idStr, String order_byStr, String pageStr, String sizeStr, String serviceUrl) throws Exception{
		
		ArrayList<OrderInfo> results = new ArrayList<OrderInfo>();
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "orders"));
		params.add(new BasicNameValuePair("account_id", account_idStr));
		params.add(new BasicNameValuePair("order_by", order_byStr));//可选
		params.add(new BasicNameValuePair("page", pageStr));//可选
		params.add(new BasicNameValuePair("size", sizeStr));//可选 -1表示获取所有订单

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		int count = jsonObject.getInt("count");//订单总数
		JSONArray jsonArray = jsonObject.getJSONArray("orders");
		for(int i=0;i<jsonArray.length();i++){			
			OrderInfo orderInfo = new OrderInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			
			double ClosePrice = jsonObject2.getDouble("ClosePrice");//平仓价格
			orderInfo.setClosePrice(ClosePrice);
			String OpenTime = jsonObject2.getString("OpenTime");//建仓时间
			orderInfo.setOpenTime(OpenTime);
			int account_id = jsonObject2.getInt("account_id");//信号编号（系统
			orderInfo.setAccount_id(account_id);
			double Pips = jsonObject2.getDouble("Pips");//盈利点数
			orderInfo.setPips(Pips);
			double Lots = jsonObject2.getDouble("Lots");//交易手数
			orderInfo.setLots(Lots);
			String Symbol =jsonObject2.getString("Symbol");//交易品种
			orderInfo.setSymbol(Symbol);
			String CloseTime = jsonObject2.getString("CloseTime");//平仓时间
			orderInfo.setCloseTime(CloseTime);
			double Commission = jsonObject2.getDouble("Commission");//佣金
			orderInfo.setCommission(Commission);
			double Net_Profit = jsonObject2.getDouble("Net Profit");//净利润
			orderInfo.setNet_Profit(Net_Profit);
			double OpenPrice = jsonObject2.getDouble("OpenPrice");//建仓价格
			orderInfo.setOpenPrice(OpenPrice);
			double Profit = jsonObject2.getDouble("Profit");//毛利润
			orderInfo.setProfit(Profit);
			String Type = jsonObject2.getString("Type");//交易类型
			orderInfo.setType(Type);
			int id = jsonObject2.getInt("id");//单编号（系统）
			orderInfo.setId(id);
			double Swap = jsonObject2.getDouble("Swap");//利息
			orderInfo.setSwap(Swap);
			
			results.add(orderInfo);
		}
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		
		return results;
	}
	
	
	/*信号建仓手数分布---展示建仓手数分布图/api/orders?cat=paras*/
	public ArrayList<OpenLots> testOrdersLots(String account_idStr, String serviceUrl) throws Exception{
		ArrayList<OpenLots> results = new ArrayList<OpenLots>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "paras"));
		params.add(new BasicNameValuePair("account_id", account_idStr));
		//params.add(new BasicNameValuePair("order_by", order_byStr));
		//params.add(new BasicNameValuePair("page", pageStr));
		//params.add(new BasicNameValuePair("size", sizeStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
       // System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		int count = jsonObject.getInt("count");//订单总数
		JSONArray jsonArray = jsonObject.getJSONArray("orders");
		for(int i=0;i<jsonArray.length();i++){
			OpenLots openLots = new OpenLots();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			int account_id = jsonObject2.getInt("account_id");//信号编号（系统
			openLots.setAccount_Id(account_id);
			double netProfit = jsonObject2.getDouble("NetProfit");
			openLots.setNetProfit(netProfit);
			String openTime = jsonObject2.getString("OpenTime");
			openLots.setOpenTime(openTime);
			String closeTime = jsonObject2.getString("CloseTime");
			double pips = jsonObject2.getDouble("Pips");
			openLots.setPips(pips);
			double Lots = jsonObject2.getDouble("Lots");//交易手数
			openLots.setLots(Lots);
			results.add(openLots);
		}
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		
		return results;
	}
	
	/*获取信号账户相关统计参数信息/api/account?cat=stat*/
	public AccountStatInfo testAccountStat(String account_idStr, String serviceUrl) throws Exception{
		
		AccountStatInfo accountStatInfo = new AccountStatInfo();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "stat"));
		params.add(new BasicNameValuePair("account_id", account_idStr));
		String url = serviceUrl;
		
		InputStream is=null;
		CloseableHttpResponse response=null;
		CloseableHttpClient httpClient=null;
		
		String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));
		
        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);
        
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		accountStatInfo.setAvgPipsLossOrders(jsonArray.getJSONObject(0).getDouble("value"));
		accountStatInfo.setAvgPipsWinOrders(jsonArray.getJSONObject(1).getDouble("value"));
		accountStatInfo.setAvgProfitLossOrders(jsonArray.getJSONObject(2).getDouble("value"));
		accountStatInfo.setAvgProfitWinOrders(jsonArray.getJSONObject(3).getDouble("value"));
		accountStatInfo.setCountLossOrders(jsonArray.getJSONObject(4).getDouble("value"));
		accountStatInfo.setCountWinOrders(jsonArray.getJSONObject(5).getDouble("value"));
		accountStatInfo.setCountTotalOrders(jsonArray.getJSONObject(6).getDouble("value"));
		accountStatInfo.setCountYearTotalOrders(jsonArray.getJSONObject(7).getDouble("value"));
		accountStatInfo.setMaxDrawDown(jsonArray.getJSONObject(8).getDouble("value"));
		accountStatInfo.setMaxRateDrawDown(jsonArray.getJSONObject(9).getString("value_str"));
		accountStatInfo.setMinOpenLots(jsonArray.getJSONObject(10).getDouble("value"));
		accountStatInfo.setMaxOpenLots(jsonArray.getJSONObject(11).getDouble("value"));
		accountStatInfo.setMaxOpenOrders(jsonArray.getJSONObject(12).getDouble("value"));
		accountStatInfo.setMinPutInvest(jsonArray.getJSONObject(13).getDouble("value"));
		accountStatInfo.setMaxSafeInvest(jsonArray.getJSONObject(14).getString("value_str"));
		accountStatInfo.setRateLoss(jsonArray.getJSONObject(15).getDouble("value"));
		accountStatInfo.setRateOdds(jsonArray.getJSONObject(16).getDouble("value"));
		accountStatInfo.setRateWin(jsonArray.getJSONObject(17).getDouble("value"));
		accountStatInfo.setSumLossPips(jsonArray.getJSONObject(18).getDouble("value"));
		accountStatInfo.setSumWinPips(jsonArray.getJSONObject(19).getDouble("value"));
		accountStatInfo.setSumPips(jsonArray.getJSONObject(20).getDouble("value"));
		accountStatInfo.setSumProfitLossOrders(jsonArray.getJSONObject(21).getDouble("value"));
		accountStatInfo.setSumProfitWinOrders(jsonArray.getJSONObject(22).getDouble("value"));
		accountStatInfo.setSumProfit(jsonArray.getJSONObject(23).getDouble("value"));
		accountStatInfo.setSumYearProfit(jsonArray.getJSONObject(24).getDouble("value"));
		accountStatInfo.setSumLots(jsonArray.getJSONObject(25).getDouble("value"));
		accountStatInfo.setSumYearLots(jsonArray.getJSONObject(26).getDouble("value"));
		accountStatInfo.setDays(jsonArray.getJSONObject(27).getDouble("value"));
		accountStatInfo.setLastUpdated(jsonArray.getJSONObject(28).getDouble("value"));
		accountStatInfo.setLastUpdatedTime(jsonArray.getJSONObject(29).getString("value_str"));
		accountStatInfo.setMaxLossPips(jsonArray.getJSONObject(30).getDouble("value"));
		accountStatInfo.setCountSymbol(jsonArray.getJSONObject(31).getInt("value"));
		accountStatInfo.setSymbols(jsonArray.getJSONObject(32).getString("value_str"));
		accountStatInfo.setSymbolDis(jsonArray.getJSONObject(33).getDouble("value"));
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return accountStatInfo;
	}

	/*获取订单累计利润和每日累计利润收益率 api/account?cat=ddd*/
/*	public List<NetWorthInfo> testAccountDdd( String account_idStr, String serviceUrl) throws Exception{
		List<NetWorthInfo> results = new ArrayList<NetWorthInfo>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("cat", "ddd"));
		params.add(new BasicNameValuePair("account_id", account_idStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		int Count = jsonObject.getInt("Count");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			NetWorthInfo netWorthInfo = new NetWorthInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			double Profit = jsonObject2.getDouble("Profit");//当日利润
			netWorthInfo.setProfit(Profit);
			double Growth = jsonObject2.getDouble("Growth");
			netWorthInfo.setGrowth(Growth);
			double DrawDownRate = jsonObject2.getDouble("DrawDownRate");
			netWorthInfo.setDrawDownRate(DrawDownRate);
			String t = jsonObject2.getString("t");
			netWorthInfo.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");//回撤值
			netWorthInfo.setDrawDown(DrawDown);
			double NetWorth = jsonObject2.getDouble("NetWorth");//累计利润
			netWorthInfo.setNetWorth(NetWorth);
			results.add(netWorthInfo);
		}
		double MaxRateDrawDown = jsonObject.getDouble("MaxRateDrawDown");//总体最大回撤率
		double MaxDrawDown = jsonObject.getDouble("MaxDrawDown");//总体最大回撤
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
	}*/	

	/*获取搜索账户信息api/account/search?*/
	public List<AccountSearchInfo> testAccountSearch( String brokerStr, String nameStr, String pageStr, String sizeStr, String serviceUrl) throws Exception{
		List<AccountSearchInfo> results = new ArrayList<AccountSearchInfo>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("broker", brokerStr));
		params.add(new BasicNameValuePair("name", nameStr));
		params.add(new BasicNameValuePair("page", pageStr));
		params.add(new BasicNameValuePair("size", sizeStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONObject jsonObject = obj.getJSONObject("data");
		int Count = jsonObject.getInt("count");
		JSONArray jsonArray = jsonObject.getJSONArray("accounts");
		for(int i =0;i<jsonArray.length();i++){
			AccountSearchInfo accountSearchInfo = new AccountSearchInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			accountSearchInfo.setId(i);
			int account = jsonObject2.getInt("account");
			accountSearchInfo.setAccount(account);
			int account_id = jsonObject2.getInt("account_id");
			accountSearchInfo.setAccount_id(account_id);
			String name = jsonObject2.getString("name");
			accountSearchInfo.setName(name);
			String broker = jsonObject2.getString("broker");
			accountSearchInfo.setBroker(broker);
			
			results.add(accountSearchInfo);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
	}
	
	
	public static void testAccountFloatingSymbol( String account_idStr, String ktype, String catStr, String serviceUrl) throws Exception{
		List<AccountSearchInfo> results = new ArrayList<AccountSearchInfo>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account_id",account_idStr));
		params.add(new BasicNameValuePair("ktype", ktype));
		params.add(new BasicNameValuePair("cat", catStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		
		/*JSONObject jsonObject = obj.getJSONObject("data");
		int Count = jsonObject.getInt("count");
		JSONArray jsonArray = jsonObject.getJSONArray("accounts");
		for(int i =0;i<jsonArray.length();i++){
			AccountSearchInfo accountSearchInfo = new AccountSearchInfo();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			accountSearchInfo.setId(i);
			int account = jsonObject2.getInt("account");
			accountSearchInfo.setAccount(account);
			int account_id = jsonObject2.getInt("account_id");
			accountSearchInfo.setAccount_id(account_id);
			String name = jsonObject2.getString("name");
			accountSearchInfo.setName(name);
			String broker = jsonObject2.getString("broker");
			accountSearchInfo.setBroker(broker);
			
			results.add(accountSearchInfo);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;*/
	}

	/*平仓（浮动）盈亏*/
	public List<AccountFloatingCPWL> testAccountFloatingCatCPWL( String account_idStr, String ktype, String catStr, String serviceUrl) throws Exception{
		List<AccountFloatingCPWL> results = new ArrayList<AccountFloatingCPWL>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account_id",account_idStr));
		params.add(new BasicNameValuePair("ktype", ktype));
		params.add(new BasicNameValuePair("cat", catStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		
		for(int i =0;i<jsonArray.length();i++){
			AccountFloatingCPWL accountFloatingCPWL = new AccountFloatingCPWL();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			String Pofit = jsonObject2.getString("Profit");
			accountFloatingCPWL.setPofit(Pofit);
			String OpenTime = jsonObject2.getString("OpenTime");
			accountFloatingCPWL.setOpenTime(OpenTime);
			String t = jsonObject2.getString("t");
			accountFloatingCPWL.setT(t);
			String CloseNetWorth = jsonObject2.getString("CloseNetWorth");
			accountFloatingCPWL.setCloseNetWorth(CloseNetWorth);
			
			results.add(accountFloatingCPWL);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
	}
	
	/*浮动盈亏净值回撤*/
	public List<AccountFloatingKDD> testAccountFloatingCatKDD( String account_idStr, String ktype, String catStr, String serviceUrl) throws Exception{
		List<AccountFloatingKDD> results = new ArrayList<AccountFloatingKDD>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account_id",account_idStr));
		params.add(new BasicNameValuePair("ktype", ktype));
		params.add(new BasicNameValuePair("cat", catStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		JSONArray jsonArray = obj.getJSONArray("data");
		
		for(int i =0;i<jsonArray.length();i++){
			 AccountFloatingKDD accountFloatingKDD = new AccountFloatingKDD();
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			String LineNetWorth = jsonObject2.getString("LineNetWorth");
			accountFloatingKDD.setLineNetWorth(LineNetWorth);
			double DrawDownRate = jsonObject2.getDouble("DrawDownRate");
			accountFloatingKDD.setDrawDownRate(DrawDownRate);
			String t = jsonObject2.getString("t");
			accountFloatingKDD.setT(t);
			double DrawDown = jsonObject2.getDouble("DrawDown");
			accountFloatingKDD.setDrawDown(DrawDown);
			results.add(accountFloatingKDD);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
	}	
	
	/*利润（USD）浮动盈亏*/
	public List<AccountFloatingSumProfit> testAccountFloatingSumprofit( String account_idStr, String ktype, String symbolStr, String serviceUrl) throws Exception{
		List<AccountFloatingSumProfit> results = new ArrayList<AccountFloatingSumProfit>();
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("account_id",account_idStr));
		params.add(new BasicNameValuePair("ktype", ktype));
		params.add(new BasicNameValuePair("symbol", symbolStr));

		String url = serviceUrl;
		
		InputStream is = null; 
		CloseableHttpResponse  response =null;
		CloseableHttpClient httpClient=null;
	 
        //转换为键值对  
        String str = addToken(EntityUtils.toString(new UrlEncodedFormEntity(params, Consts.UTF_8)));  
        //System.out.println(str);  

        //创建Get请求  
        HttpGet httpGet = new HttpGet(url+"?"+str);  
        //执行Get请求，        
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(60000).setConnectTimeout(60000).build();
        httpGet.setConfig(requestConfig);
        httpClient = HttpClients.custom().setDefaultRequestConfig(requestConfig).build();
        response = httpClient.execute(httpGet);
        
        int nCode = response.getStatusLine().getStatusCode();
		//System.out.println("status=" + nCode);

		//System.out.println(response.getEntity().getContentType().getName());
		//System.out.println(response.getEntity().getContentType().getValue());
		
		String content = EntityUtils.toString(response.getEntity()); 
		//System.out.println(content);
		JSONObject obj = new JSONObject(content);
		String msg = obj.getString("msg");
		int code = obj.getInt("code");
		
		JSONObject jsonObject = obj.getJSONObject("data");
		int Count = jsonObject.getInt("Count");
		JSONArray jsonArray = jsonObject.getJSONArray("results");
		for(int i =0;i<jsonArray.length();i++){
			AccountFloatingSumProfit accountFloatingSumProfit = new AccountFloatingSumProfit();
			JSONObject jObject = jsonArray.getJSONObject(i);
			int CountOrder = jObject.getInt("CountOrder");
			accountFloatingSumProfit.setCountOrder(CountOrder);
			double SumProfit = jObject.getDouble("SumProfit");
			accountFloatingSumProfit.setSumProfit(SumProfit);
			double SumPips = jObject.getDouble("SumPips");
			accountFloatingSumProfit.setSumPips(SumPips);
			String kID = jObject.getString("KID");
			accountFloatingSumProfit.setKID(kID);
			results.add(accountFloatingSumProfit);
		}
		
		String msg_code = obj.getString("msg_code");
		String errmsg = obj.getString("errmsg");
		return results;
	}	
	
	public static String addToken(String url){
		String token="9CA446A63E9301B7D4A9F7BD75BC3C46";
		return url+"&token"+"="+token;
	}
   
	/*public static void main(String[] args) throws Exception{
    	//testBoardRate("", "10000", "0.5", "180", "0", "60", "http://47.91.166.3:8011/api/board/rate");
    	//testBoardBrokers("http://47.91.166.3:8011/api/board/account");
		//testAccountFloatingSymbol("70000034", "", "symbol", "http://47.91.166.3:8011/api/account/floating");
		//testAccountFloatingSumprofit("70000034", "", "", "http://47.91.166.3:8011/api/account/floating");
		
		//testAccountDdd("70000052", "http://47.91.166.3:8011/api/account");
		//testAccountSearch("", "", "", "", "http://47.91.166.3:8011/api/account/search");
    }*/
}
