package cn.fx50rank.bean;

/*统计表格*/
public class AccountStatInfo {
	private double AvgPipsLossOrders;//信号平均亏损点数
	private double AvgPipsWinOrders;//信号平均盈利点数
	private double AvgProfitLossOrders;//信号亏损订单平均亏损
	private double AvgProfitWinOrders;//信号盈利订单平均盈利
	private double CountLossOrders;//信号亏损订单数
	private double CountWinOrders;//信号盈利订单数
	private double CountTotalOrders;//信号总订单数
	private double CountYearTotalOrders;//信号年化订单数
	private double MaxDrawDown;//信号最大回撤金额
	private String MaxRateDrawDown;//信号最大回测率
	private double MinOpenLots;//信号最小持仓手数
	private double MaxOpenLots;//信号最大持仓手数
	private double MaxOpenOrders;//信号最大持仓订单数
	private double MinPutInvest;//信号最小跟单资金
	private String MaxSafeInvest;//信号最大止损百分比
	private double RateLoss;//信号输率
	private double RateOdds;//信号赔率
	private double RateWin;//信号胜率
	private double SumLossPips;//信号亏损点数
	private double SumWinPips;//信号盈利点数
	private double SumPips;//信号总累计点数
	private double SumProfitLossOrders;//信号亏损点数之和
	private double SumProfitWinOrders;//信号盈利点数之和
	private double SumProfit;//信号总利润
	private double SumYearProfit;//信号年华利润
	private double SumLots;//信号总手数
	private double SumYearLots;//信号年华手数
	private double Days;//交易时长（天）
	private double LastUpdated;//信号最近更新时间
	private String LastUpdatedTime;//信号最近更新时间
	private double MaxLossPips;//信号最大亏损点数
	private int CountSymbol;//信号交易产品数
	private String Symbols;//信号主要产品名称
	private double SymbolDis;//信号主要产品比例
	public double getAvgPipsLossOrders() {
		return AvgPipsLossOrders;
	}
	public void setAvgPipsLossOrders(double avgPipsLossOrders) {
		AvgPipsLossOrders = avgPipsLossOrders;
	}
	public double getAvgPipsWinOrders() {
		return AvgPipsWinOrders;
	}
	public void setAvgPipsWinOrders(double avgPipsWinOrders) {
		AvgPipsWinOrders = avgPipsWinOrders;
	}
	public double getAvgProfitLossOrders() {
		return AvgProfitLossOrders;
	}
	public void setAvgProfitLossOrders(double avgProfitLossOrders) {
		AvgProfitLossOrders = avgProfitLossOrders;
	}
	public double getAvgProfitWinOrders() {
		return AvgProfitWinOrders;
	}
	public void setAvgProfitWinOrders(double avgProfitWinOrders) {
		AvgProfitWinOrders = avgProfitWinOrders;
	}
	public double getCountLossOrders() {
		return CountLossOrders;
	}
	public void setCountLossOrders(double countLossOrders) {
		CountLossOrders = countLossOrders;
	}
	public double getCountWinOrders() {
		return CountWinOrders;
	}
	public void setCountWinOrders(double countWinOrders) {
		CountWinOrders = countWinOrders;
	}
	public double getCountTotalOrders() {
		return CountTotalOrders;
	}
	public void setCountTotalOrders(double countTotalOrders) {
		CountTotalOrders = countTotalOrders;
	}
	public double getCountYearTotalOrders() {
		return CountYearTotalOrders;
	}
	public void setCountYearTotalOrders(double countYearTotalOrders) {
		CountYearTotalOrders = countYearTotalOrders;
	}
	public double getMaxDrawDown() {
		return MaxDrawDown;
	}
	public void setMaxDrawDown(double maxDrawDown) {
		MaxDrawDown = maxDrawDown;
	}
	public String getMaxRateDrawDown() {
		return MaxRateDrawDown;
	}
	public void setMaxRateDrawDown(String maxRateDrawDown) {
		MaxRateDrawDown = maxRateDrawDown;
	}
	public double getMinOpenLots() {
		return MinOpenLots;
	}
	public void setMinOpenLots(double minOpenLots) {
		MinOpenLots = minOpenLots;
	}
	public double getMaxOpenLots() {
		return MaxOpenLots;
	}
	public void setMaxOpenLots(double maxOpenLots) {
		MaxOpenLots = maxOpenLots;
	}
	public double getMaxOpenOrders() {
		return MaxOpenOrders;
	}
	public void setMaxOpenOrders(double maxOpenOrders) {
		MaxOpenOrders = maxOpenOrders;
	}
	public double getMinPutInvest() {
		return MinPutInvest;
	}
	public void setMinPutInvest(double minPutInvest) {
		MinPutInvest = minPutInvest;
	}
	public String getMaxSafeInvest() {
		return MaxSafeInvest;
	}
	public void setMaxSafeInvest(String maxSafeInvest) {
		MaxSafeInvest = maxSafeInvest;
	}
	public double getRateLoss() {
		return RateLoss;
	}
	public void setRateLoss(double rateLoss) {
		RateLoss = rateLoss;
	}
	public double getRateOdds() {
		return RateOdds;
	}
	public void setRateOdds(double rateOdds) {
		RateOdds = rateOdds;
	}
	public double getRateWin() {
		return RateWin;
	}
	public void setRateWin(double rateWin) {
		RateWin = rateWin;
	}
	public double getSumLossPips() {
		return SumLossPips;
	}
	public void setSumLossPips(double sumLossPips) {
		SumLossPips = sumLossPips;
	}
	public double getSumWinPips() {
		return SumWinPips;
	}
	public void setSumWinPips(double sumWinPips) {
		SumWinPips = sumWinPips;
	}
	public double getSumPips() {
		return SumPips;
	}
	public void setSumPips(double sumPips) {
		SumPips = sumPips;
	}
	public double getSumProfitLossOrders() {
		return SumProfitLossOrders;
	}
	public void setSumProfitLossOrders(double sumProfitLossOrders) {
		SumProfitLossOrders = sumProfitLossOrders;
	}
	public double getSumProfitWinOrders() {
		return SumProfitWinOrders;
	}
	public void setSumProfitWinOrders(double sumProfitWinOrders) {
		SumProfitWinOrders = sumProfitWinOrders;
	}
	public double getSumProfit() {
		return SumProfit;
	}
	public void setSumProfit(double sumProfit) {
		SumProfit = sumProfit;
	}
	public double getSumYearProfit() {
		return SumYearProfit;
	}
	public void setSumYearProfit(double sumYearProfit) {
		SumYearProfit = sumYearProfit;
	}
	public double getSumLots() {
		return SumLots;
	}
	public void setSumLots(double sumLots) {
		SumLots = sumLots;
	}
	public double getSumYearLots() {
		return SumYearLots;
	}
	public void setSumYearLots(double sumYearLots) {
		SumYearLots = sumYearLots;
	}
	public double getDays() {
		return Days;
	}
	public void setDays(double days) {
		Days = days;
	}
	public double getLastUpdated() {
		return LastUpdated;
	}
	public void setLastUpdated(double lastUpdated) {
		LastUpdated = lastUpdated;
	}
	public String getLastUpdatedTime() {
		return LastUpdatedTime;
	}
	public void setLastUpdatedTime(String lastUpdatedTime) {
		LastUpdatedTime = lastUpdatedTime;
	}
	public double getMaxLossPips() {
		return MaxLossPips;
	}
	public void setMaxLossPips(double maxLossPips) {
		MaxLossPips = maxLossPips;
	}
	public int getCountSymbol() {
		return CountSymbol;
	}
	public void setCountSymbol(int countSymbol) {
		CountSymbol = countSymbol;
	}
	public String getSymbols() {
		return Symbols;
	}
	public void setSymbols(String symbols) {
		Symbols = symbols;
	}
	public double getSymbolDis() {
		return SymbolDis;
	}
	public void setSymbolDis(double symbolDis) {
		SymbolDis = symbolDis;
	}
}
