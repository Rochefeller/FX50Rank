package cn.fx50rank.services;

import cn.fx50rank.bean.AccountStatInfo;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountStats {
	public AccountStatInfo obtainaccountStats(String accountId) throws Exception{
		AccountStatInfo accountStatInfo = new AccountStatInfo();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl="http://47.91.166.3:8011/api/account";
		accountStatInfo = rankInterFaces.testAccountStat(accountId, serviceUrl);
		return accountStatInfo;
	}
}
