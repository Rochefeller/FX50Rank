package cn.fx50rank.bean;

public class MonthGrowthAndNetWorth {
	private double Growth;//每月收益率
	private double DrawDownRate;//回撤值
	private String t ;//统计月份
	private double DrawDown;//回撤值
	private double NetWorth;//每月利润
	private double Profit;//每月收益率
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
	public double getProfit() {
		return Profit;
	}
	public void setProfit(double profit) {
		Profit = profit;
	}
}
