package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.NetWorthInfo;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountNetWorth {
	public List<NetWorthInfo> obtainAccountNetWorth(String accountId) throws Exception{
		List<NetWorthInfo> resultsArrayList = new ArrayList<NetWorthInfo>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		resultsArrayList = rankInterFaces.testAccountDdo(accountId, serviceUrl);
		return resultsArrayList;
	}
}
