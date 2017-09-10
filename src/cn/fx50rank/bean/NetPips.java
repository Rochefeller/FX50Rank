/**
 * 
 */
package cn.fx50rank.bean;

/**
 * @author hq
 *
 */
public class NetPips {
	private int order_id;
	private double DrawDownPips;
	private String OpenTime;
	private double NetPips;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public double getDrawDownPips() {
		return DrawDownPips;
	}
	public void setDrawDownPips(double drawDownPips) {
		DrawDownPips = drawDownPips;
	}
	public String getOpenTime() {
		return OpenTime;
	}
	public void setOpenTime(String openTime) {
		OpenTime = openTime;
	}
	public double getNetPips() {
		return NetPips;
	}
	public void setNetPips(double netPips) {
		NetPips = netPips;
	}

}
