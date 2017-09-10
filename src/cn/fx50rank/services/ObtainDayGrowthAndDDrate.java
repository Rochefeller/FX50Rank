package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.DayGrowthAndDDrate;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainDayGrowthAndDDrate {
	public List<DayGrowthAndDDrate> obtainDayGrowthAndDDrates(String accountId, String invest, String N) throws Exception{
		List<DayGrowthAndDDrate> resultList = new ArrayList<DayGrowthAndDDrate>();
		String serviceUrl ="http://47.91.166.3:8011/api/account";
		RankInterFaces rankInterFaces = new RankInterFaces();
		resultList = rankInterFaces.testAccountPlanDdd(accountId, invest, N, serviceUrl);
		return resultList;
	}
}
