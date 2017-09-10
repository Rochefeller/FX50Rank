package cn.fx50rank.bean;

public class DayProfitDrowdown {
	private double Profit;//统计周期利润
	private double Growth;//累计利润增长率
	private double DrawDownRate;//回撤率
	private String t;//统计日期
	private double DrawDown;//回撤值
	private double NetWorth;//累积利润
	public double getProfit() {
		return Profit;
	}
	public void setProfit(double profit) {
		Profit = profit;
	}
	public double getGrowth() {
		return Growth;
	}
	public void setGrowth(double growth) {
		Growth = growth;
	}
	public double getDrawDownRate() {
		return DrawDownRate;
	}
	public void setDrawDownRate(double drawDownRate) {
		DrawDownRate = drawDownRate;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public double getDrawDown() {
		return DrawDown;
	}
	public void setDrawDown(double drawDown) {
		DrawDown = drawDown;
	}
	public double getNetWorth() {
		return NetWorth;
	}
	public void setNetWorth(double netWorth) {
		NetWorth = netWorth;
	}

}
