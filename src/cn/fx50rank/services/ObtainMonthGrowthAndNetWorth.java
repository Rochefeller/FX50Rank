package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;

import cn.fx50rank.bean.MonthGrowthAndNetWorth;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainMonthGrowthAndNetWorth {
	public List<MonthGrowthAndNetWorth> obtainMonthGrowthAndNetWorths(String accountId, String invest, String N) throws Exception{
		List<MonthGrowthAndNetWorth> resultList = new ArrayList<MonthGrowthAndNetWorth>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl =  "http://47.91.166.3:8011/api/account";
		resultList = rankInterFaces.testAccountPlanDdm(accountId, invest, N, serviceUrl);
		return resultList;
	}
}
