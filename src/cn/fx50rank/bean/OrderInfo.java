package cn.fx50rank.bean;

public class OrderInfo {
	public int count;
	
	private int id;//订单编码
	private String Symbol;//交易品种
	private double ClosePrice;//平仓价格
	private String OpenTime;//建仓时间
	private int account_id;//信号编码
	private double Pips;//交易点数
	private double Lots;//交易手数
	private String CloseTime;//平仓时间
	private double Commission;//订单佣金
	private double Net_Profit;//净利润
	private double OpenPrice;//建仓价格
	private double Profit;//毛利润
	private String Type;//交易类型
	private double Swap;//订单利息
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getClosePrice() {
		return ClosePrice;
	}
	public void setClosePrice(double closePrice) {
		ClosePrice = closePrice;
	}
	public String getOpenTime() {
		return OpenTime;
	}
	public void setOpenTime(String openTime) {
		OpenTime = openTime;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public double getPips() {
		return Pips;
	}
	public void setPips(double pips) {
		Pips = pips;
	}
	public double getLots() {
		return Lots;
	}
	public void setLots(double lots) {
		Lots = lots;
	}
	public String getCloseTime() {
		return CloseTime;
	}
	public void setCloseTime(String closeTime) {
		CloseTime = closeTime;
	}
	public double getCommission() {
		return Commission;
	}
	public void setCommission(double commission) {
		Commission = commission;
	}
	public double getNet_Profit() {
		return Net_Profit;
	}
	public void setNet_Profit(double net_Profit) {
		Net_Profit = net_Profit;
	}
	public double getOpenPrice() {
		return OpenPrice;
	}
	public void setOpenPrice(double openPrice) {
		OpenPrice = openPrice;
	}
	public double getProfit() {
		return Profit;
	}
	public void setProfit(double profit) {
		Profit = profit;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public double getSwap() {
		return Swap;
	}
	public void setSwap(double swap) {
		Swap = swap;
	}
	public String getSymbol() {
		return Symbol;
	}
	public void setSymbol(String symbol) {
		Symbol = symbol;
	}
}
