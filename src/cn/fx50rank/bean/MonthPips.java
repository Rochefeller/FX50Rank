package cn.fx50rank.bean;

public class MonthPips {
	private int Y;//年
	private int M;//月
	private int account_id;//信号编码
	private double pips;//点数
	private String t;//统计月份
	public int getY() {
		return Y;
	}
	public void setY(int y) {
		Y = y;
	}
	public int getM() {
		return M;
	}
	public void setM(int m) {
		M = m;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public double getPips() {
		return pips;
	}
	public void setPips(double pips) {
		this.pips = pips;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
}
