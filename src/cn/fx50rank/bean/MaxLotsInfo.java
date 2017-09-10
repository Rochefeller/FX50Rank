package cn.fx50rank.bean;

public class MaxLotsInfo {
	private int MaxOpenOrders;
	private double MinOpenLots;
	private double MaxOpenLots;
	private double MaxLots;
	private double Orders;
	private String Type;
	private String t;
	private double MinLots;
	public int getMaxOpenOrders() {
		return MaxOpenOrders;
	}
	public void setMaxOpenOrders(int maxOpenOrders) {
		MaxOpenOrders = maxOpenOrders;
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
	public double getMaxLots() {
		return MaxLots;
	}
	public void setMaxLots(double maxLots) {
		MaxLots = maxLots;
	}
	public double getOrders() {
		return Orders;
	}
	public void setOrders(double orders) {
		Orders = orders;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public double getMinLots() {
		return MinLots;
	}
	public void setMinLots(double minLots) {
		MinLots = minLots;
	}
}
