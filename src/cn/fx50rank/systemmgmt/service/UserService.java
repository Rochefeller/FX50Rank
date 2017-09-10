package cn.fx50rank.systemmgmt.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.client.ClientProtocolException;

import cn.fx50rank.systemmgmt.bean.User;



public interface UserService {
	
	User login(User user);
	
	void register(User user);
	
	void sendValidationCodeMessage(String mobilePhone) throws ClientProtocolException, IOException;
	
	boolean verifyCode(String mobilePhone, String validationCode);
	
	
}
