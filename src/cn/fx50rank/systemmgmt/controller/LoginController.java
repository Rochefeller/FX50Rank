package cn.fx50rank.systemmgmt.controller;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.fx50rank.systemmgmt.bean.User;
import cn.fx50rank.systemmgmt.service.UserService;




@Controller
@Scope("prototype")
public class LoginController {
	
	@Resource
	private UserService userService;
	
//	@RequestMapping(value="/login")
	@RequestMapping(value="/login.htm", method={RequestMethod.GET,RequestMethod.POST})
	public String redirectLoginPage(){
		return "system"+"/login";
	}
	
//	@RequestMapping(value="/login/submit",method=RequestMethod.POST)
	@RequestMapping(value = "/login.htm/submit.htm", method = { RequestMethod.GET, RequestMethod.POST })
	public String submit(User user, HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {

		user = userService.login(user);
		if (user.getIsLoginSuccess()) {
			request.getSession().setAttribute("currentUser", user);
			return "redirect:/";
		} else {
			redirectAttributes.addFlashAttribute("message", user.getLoginErrorCode());
			return "redirect:/login.htm";
		}
	}
	
	@RequestMapping(value="/main.htm", method={RequestMethod.GET,RequestMethod.POST})
	public String redirectMainPage(){
		return "/main";
	}
	
	
//	@RequestMapping(value="/logout",method = RequestMethod.GET)
	@RequestMapping(value="/login.htm/logout.htm", method={RequestMethod.GET,RequestMethod.POST})
	public String logout(Model model,HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/main.htm";
	}
	
	@RequestMapping(value = "/login.htm/register.htm", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(User user, HttpServletRequest request, Model model) {
		
		//电话号查重
		boolean isExist = userService.validPhoneNoExist(user.getMobilePhone());
		if(isExist){
			model.addAttribute("errorMessage", "该手机号已被注册，请更换其他手机号");
			return "redirect:/login.htm/register.htm";
		}
		
		boolean isValid = userService.verifyCode(user.getMobilePhone(), user.getValidationCode());
		
		if (isValid){
			userService.register(user);
		}
		return "redirect:/login.htm";
	}
	
	@RequestMapping(value = "/login.htm/getValidationCode.htm", method = { RequestMethod.GET, RequestMethod.POST })
	public void getValidationCode(@RequestParam String mobilePhone) throws ClientProtocolException, IOException {

		userService.sendValidationCodeMessage(mobilePhone);
	
		
	}
	
	

}
