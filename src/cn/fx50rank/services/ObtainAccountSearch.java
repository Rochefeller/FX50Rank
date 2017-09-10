package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.AccountSearchInfo;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountSearch {
	public List<AccountSearchInfo> obAccountSearchInfos(String broker, String name) throws Exception{
		List<AccountSearchInfo> resultsArrayLists = new ArrayList<AccountSearchInfo>();
		String serviceUrl = "http://47.91.166.3:8011/api/account/search";
		RankInterFaces rankInterFaces = new RankInterFaces();
		resultsArrayLists = rankInterFaces.testAccountSearch(broker, name, "", "-1", serviceUrl);
		return resultsArrayLists;
		
	}
}
