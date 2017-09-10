package cn.fx50rank.systemmgmt.config;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.fx50rank.systemmgmt.bean.User;



public class AuthenticationInterceptor implements HandlerInterceptor {

	Map<String, Map<String, Object>> pageMap = null;

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String uri = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		String path = uri.replaceFirst(contextPath, "");
		while (path.endsWith("/")) {
			path = path.substring(0, path.length() - 1);
		}
		if ("".equals(path)) {
			path = "/";
		}

		String[] pathStr = uri.split("/");
		String pagePath = pathStr[1];

		// Do not intercept root path & login path & REST path
		if ("/".equals(path) || "/login.htm".equals(path) || path.startsWith("/rest") || path.startsWith("/login.htm")) {
			return true;
		} else {
			User user = (User) request.getSession().getAttribute("currentUser");
			if (user != null) {
				return true;
			} else {
				request.getRequestDispatcher("/login.htm").forward(request, response);
				return false;
			}
		}

	}

}
