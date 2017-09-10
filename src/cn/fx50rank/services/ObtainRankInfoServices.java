package cn.fx50rank.services;

import java.util.ArrayList;

import cn.fx50rank.bean.RankResultByRate;
import cn.fx50rank.interfaces.RankInterFaces;

public class ObtainRankInfoServices {
	public ArrayList<RankResultByRate> obtainRankResultsByRate( String invest, String rate, String loss) throws Exception{
		ArrayList<RankResultByRate> results = new ArrayList<RankResultByRate>();
		RankInterFaces rankInterFaces = new RankInterFaces();
		String serviceUrl = "http://47.91.166.3:8011/api/board/rate";
		results = rankInterFaces.testBoardRate( invest, rate, loss, serviceUrl);
		return results;
	}
}
