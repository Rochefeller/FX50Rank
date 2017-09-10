package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.DayProfitDrowdown;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainDayProfitDrowdown {
	public List<DayProfitDrowdown> obtainDayProfitDrowdowns(String accountId) throws Exception{
		List<DayProfitDrowdown> resultsList = new ArrayList<DayProfitDrowdown>();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		RankInterFaces rankInterFaces = new RankInterFaces();
		resultsList = rankInterFaces.testAccountDdd(accountId, serviceUrl);
		return resultsList;
	}
}
