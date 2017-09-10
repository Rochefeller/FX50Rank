package cn.fx50rank.controller;

import java.util.List;

import net.sf.json.JSONArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.fx50rank.bean.AccountSearchInfo;
import cn.fx50rank.services.ObtainAccountSearch;
import cn.fx50rank.systemmgmt.bean.User;

@Controller
@Scope("prototype")
public class SearchPageController {
	@RequestMapping(value="/obtainAccountSearch*", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView visitMainPage(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String broker = request.getParameter("broker"); 
		String name = request.getParameter("signalName");
		if(broker.equalsIgnoreCase("全部"))
		{
			broker="";
		}
		if(name==null||name.length()==0){
			name="";
		}
		request.setAttribute("broker", broker);
		request.setAttribute("signalName", name);
		ModelAndView view = new ModelAndView("searchResults");				
		//request.getRequestDispatcher("pages/registerSuccess.jsp").forward(request, response);
		return view;
	}
	
	@RequestMapping(value="/searchInfoResult*", method={RequestMethod.GET,RequestMethod.POST})
	public void obtainSearchResult(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String broker = request.getParameter("broker");
		String signalName = request.getParameter("signalName");
		if(broker.equalsIgnoreCase("全部"))
		{
			broker="";
		}
		if(signalName==null||signalName.length()==0){
			signalName="";
		}
		List<AccountSearchInfo> listArrayList = new ObtainAccountSearch().obAccountSearchInfos(broker, signalName);
		JSONArray jsonArray = JSONArray.fromObject(listArrayList);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", jsonArray);
		
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonObject.toString());
		response.getWriter().flush();
		response.getWriter().close();
	}
	
	@RequestMapping(value="/obtainSearchInfoPage*", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView obtainSearchInfoPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String account_id = request.getParameter("account_id");
		String planN = request.getParameter("planN");//跟单比例
		planN = "50";
		String planInvest = request.getParameter("planInvest");
		planInvest = "10000";
		
		User user = (User) request.getSession().getAttribute("currentUser");
		if(user==null){
			request.getRequestDispatcher("/login.htm").forward(request, response);
			return new ModelAndView("system/login");
		}
		
		ModelAndView view = new ModelAndView("userInfo");
		request.setAttribute("account_id", account_id);
		request.setAttribute("planN", planN);//跟单比例
		request.setAttribute("planInvest", planInvest);
		return view;
	}

}
