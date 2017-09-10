package cn.fx50rank.services;

import java.util.List;

import cn.fx50rank.bean.AccountFloatingCPWL;
import cn.fx50rank.bean.AccountFloatingKDD;
import cn.fx50rank.bean.AccountFloatingSumProfit;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountFloating {
	
	public List<AccountFloatingCPWL> obtainAccountFloatingCPWL(String accountId) throws Exception{
		List<AccountFloatingCPWL> results = null;
		String serviceUrl = "http://47.91.166.3:8011/api/account/floating"; 
		RankInterFaces rankInterFaces = new RankInterFaces();
		results = rankInterFaces.testAccountFloatingCatCPWL(accountId, "60", "CPWL", serviceUrl);
		return results;
	}
	
	public List<AccountFloatingKDD> obtainAccountFloatingKDD(String accountId) throws Exception{
		List<AccountFloatingKDD> results = null;
		String serviceUrl = "http://47.91.166.3:8011/api/account/floating";
		RankInterFaces rankInterFaces = new RankInterFaces();
		results = rankInterFaces.testAccountFloatingCatKDD(accountId, "60", "KDD", serviceUrl);
		return results;
	}
	
	public List<AccountFloatingSumProfit> obtainAccountFloatingSumProfit(String accountId) throws Exception{
		List<AccountFloatingSumProfit> results = null;
		String serviceUrl = "http://47.91.166.3:8011/api/account/floating";
		RankInterFaces rankInterFaces = new RankInterFaces();
		results = rankInterFaces.testAccountFloatingSumprofit(accountId, "60", "", serviceUrl);
		return results;
	}

}
