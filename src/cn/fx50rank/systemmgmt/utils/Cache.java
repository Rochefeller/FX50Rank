package cn.fx50rank.systemmgmt.utils;

/**
 * 缓存类
 * @author yuchao
 *
 */
public class Cache {

	private String key;// 缓存ID

	private Object value;// 缓存数据

	private long timeOut;// 更新时间

	private boolean expired; // 是否终止

	public Cache() {
		super();
	}

	public Cache(String key, Object value, long timeOut, boolean expired) {
		this.key = key;
		this.value = value;
		this.timeOut = timeOut;
		this.expired = expired;
	}

	public String getKey() {
		return key;
	}

	public long getTimeOut() {
		return timeOut;
	}

	public Object getValue() {
		return value;
	}

	public boolean isExpired() {
		return expired;
	}

	public void setExpired(boolean expired) {
		this.expired = expired;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setTimeOut(long timeOut) {
		this.timeOut = timeOut;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}
