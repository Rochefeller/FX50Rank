package cn.fx50rank.services;

import java.util.ArrayList;

import cn.fx50rank.bean.OrderInfo;
import cn.fx50rank.bean.RankResultByRate;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainOrderInfoListService {
	public ArrayList<OrderInfo> obtainRankResultsByRate( String accountId) throws Exception{
		ArrayList<OrderInfo> results = new ArrayList<OrderInfo>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/orders";
		results = rankInterFaces.testOrders(accountId, "", "", "-1", serviceUrl);
		return results;
	}
}
