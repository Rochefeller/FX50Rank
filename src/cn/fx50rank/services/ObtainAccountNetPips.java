package cn.fx50rank.services;

import java.util.ArrayList;
import java.util.List;

import cn.fx50rank.bean.NetPips;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainAccountNetPips {
	public List<NetPips> obtainAccountNetPips(String accountId) throws Exception{
		List<NetPips> resultsArrayList = new ArrayList<NetPips>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/account";
		resultsArrayList = rankInterFaces.testAccountPips(accountId, serviceUrl);
		return resultsArrayList;
	}
}
