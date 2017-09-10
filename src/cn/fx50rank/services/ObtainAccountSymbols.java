package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.AccountSymbol;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountSymbols {
	public List<AccountSymbol> obatAccountSymbols(String accountId) throws Exception{
		List<AccountSymbol> accountSymbolsList = new ArrayList<AccountSymbol>();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		RankInterFaces rankInterFaces = new RankInterFaces();
		accountSymbolsList = rankInterFaces.testAccountSymbols(accountId, serviceUrl);
		return accountSymbolsList;
	}

}
