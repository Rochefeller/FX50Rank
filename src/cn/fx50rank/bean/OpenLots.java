package cn.fx50rank.bean;

public class OpenLots {
	private double netProfit;
	private String openTime;
	private String closeTime;
	private double pips;
	private double lots;
	private int count;
	private int account_Id;
	public double getLots() {
		return lots;
	}
	public void setLots(double lots) {
		this.lots = lots;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAccount_Id() {
		return account_Id;
	}
	public void setAccount_Id(int account_Id) {
		this.account_Id = account_Id;
	}
	public double getNetProfit() {
		return netProfit;
	}
	public void setNetProfit(double netProfit) {
		this.netProfit = netProfit;
	}
	public String getOpenTime() {
		return openTime;
	}
	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}
	public String getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}
	public double getPips() {
		return pips;
	}
	public void setPips(double pips) {
		this.pips = pips;
	}
}
