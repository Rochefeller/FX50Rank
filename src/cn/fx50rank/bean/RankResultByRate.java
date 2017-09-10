package cn.fx50rank.bean;

public class RankResultByRate {
	private int id;//序号1
	private String broker;//平台名称1
	private String name;//信号名称1
	private double sort;//评分值1
	private int PlanInvest;//投资金额1
	private String RateProfitYear;//年化收益1
	private double N;//跟单比例
	private double MaxDrawDown;//预期最大回撤
	private String MaxRateDrawDown;//最大回测率1
	private double RateWinLoss;//收益风险比
	private int Days;//交易时长1
	private double SumYearLots;//年化手数1
	private int CountYearTotalOrders;//年化订单数
	private double MinPutInvest;//最小跟单资金1
	private double MaxLots;//预期最大持仓手数1
	private double MaxOpenOrders;//预期最大持仓订单数1
	private int account;//帐号
	private int account_id;//信号编号（系统）
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBroker() {
		return broker;
	}
	public void setBroker(String broker) {
		this.broker = broker;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSort() {
		return sort;
	}
	public void setSort(double sort) {
		this.sort = sort;
	}
	public int getPlanInvest() {
		return PlanInvest;
	}
	public void setPlanInvest(int planInvest) {
		PlanInvest = planInvest;
	}
	public String getRateProfitYear() {
		return RateProfitYear;
	}
	public void setRateProfitYear(String rateProfitYear) {
		RateProfitYear = rateProfitYear;
	}
	public double getN() {
		return N;
	}
	public void setN(double n) {
		N = n;
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
	public double getRateWinLoss() {
		return RateWinLoss;
	}
	public void setRateWinLoss(double rateWinLoss) {
		RateWinLoss = rateWinLoss;
	}
	public double getSumYearLots() {
		return SumYearLots;
	}
	public void setSumYearLots(double sumYearLots) {
		SumYearLots = sumYearLots;
	}
	public double getMinPutInvest() {
		return MinPutInvest;
	}
	public void setMinPutInvest(double minPutInvest) {
		MinPutInvest = minPutInvest;
	}
	public double getMaxLots() {
		return MaxLots;
	}
	public void setMaxLots(double maxLots) {
		MaxLots = maxLots;
	}
	public double getMaxOpenOrders() {
		return MaxOpenOrders;
	}
	public void setMaxOpenOrders(double maxOpenOrders) {
		MaxOpenOrders = maxOpenOrders;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getCountYearTotalOrders() {
		return CountYearTotalOrders;
	}
	public void setCountYearTotalOrders(int countYearTotalOrders) {
		CountYearTotalOrders = countYearTotalOrders;
	}
	public int getDays() {
		return Days;
	}
	public void setDays(int days) {
		Days = days;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
}
