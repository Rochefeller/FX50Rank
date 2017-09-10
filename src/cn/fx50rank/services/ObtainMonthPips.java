package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.ARRAYLENGTH;

import cn.fx50rank.bean.MonthPips;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainMonthPips {
	public List<MonthPips> obtainMonthPips(String accountId) throws Exception{
		List<MonthPips> resultlList = new ArrayList<MonthPips>();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		RankInterFaces rankInterFaces = new RankInterFaces();
		resultlList = rankInterFaces.testAccountMpips(accountId, serviceUrl);
		return resultlList;
	}
}
