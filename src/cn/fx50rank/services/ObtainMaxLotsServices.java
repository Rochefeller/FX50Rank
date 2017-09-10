package cn.fx50rank.services;

import java.util.ArrayList;

import cn.fx50rank.bean.MaxLotsInfo;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainMaxLotsServices {
	public ArrayList<MaxLotsInfo> obtainMaxLots(String accountId) throws Exception{
		ArrayList<MaxLotsInfo> resultsArrayList = new ArrayList<MaxLotsInfo>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		resultsArrayList = rankInterFaces.testBoardAccountLots(accountId, serviceUrl);
		return resultsArrayList;
	}
}
