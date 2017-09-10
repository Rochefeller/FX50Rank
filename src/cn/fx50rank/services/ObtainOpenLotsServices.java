package cn.fx50rank.services;

import java.util.ArrayList;

import cn.fx50rank.bean.OpenLots;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainOpenLotsServices {
	
	public ArrayList<OpenLots> obatinOpenLots(String accountId) throws Exception{
		
		ArrayList<OpenLots> resultsArrayList = new ArrayList<OpenLots>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/orders";
		resultsArrayList = rankInterFaces.testOrdersLots(accountId, serviceUrl);
		return resultsArrayList;
		
	}
}
