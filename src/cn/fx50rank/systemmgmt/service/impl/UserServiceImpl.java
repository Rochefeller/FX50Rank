package cn.fx50rank.systemmgmt.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import cn.fx50rank.systemmgmt.bean.User;
import cn.fx50rank.systemmgmt.mapper.UserMapper;
import cn.fx50rank.systemmgmt.service.UserService;
import cn.fx50rank.systemmgmt.utils.Cache;
import cn.fx50rank.systemmgmt.utils.CacheManager;
import cn.fx50rank.systemmgmt.utils.CheckSumBuilder;



//@Service("userServiceImpl")
@Repository("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	 //发送验证码的请求路径URL
    private static final String
            SERVER_URL="https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
    private static final String 
            APP_KEY="6557b2c40f1327cc64520c00f8994fb0";
    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
    private static final String APP_SECRET="5c19cf5a6fe6";
    //随机数
    private static final String NONCE="123456";
    //短信模板ID
    private static final String TEMPLATEID="3057527";
    //手机号
//    private static final String MOBILE="18810555800";
    //验证码长度，范围4～10，默认为4
    private static final String CODELEN="6";
	
	
	@Transactional(readOnly=false)
	@Override
	public User login(User user) {
		// 查询用户是否在数据库中存在
		User resultUser = userMapper.findUserByPhone(user.getMobilePhone());
		if (resultUser == null) {
			user.setIsLoginSuccess(false);
			user.setLoginErrorCode("No such user in system");
		} else {// 存在
			if (resultUser.getPassword().equals(user.getPassword())) {
				user = resultUser;
				user.setIsLoginSuccess(true);
				// 设置登录时间
				user.setLastLoginDate(new Date());
			} else {
				user.setIsLoginSuccess(false);
				user.setLoginErrorCode("Password is incorrect");
			}
		}
		return user;
	};
	
	@Transactional(readOnly=false)
	@Override
	public void register(User user) {
		int result;
		Date createDate = new Date();
	    try {
	    	user.setLastLoginDate(createDate);
	    	result = userMapper.addUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
	};
	
	@Override
	public void sendValidationCodeMessage(String mobilePhone) throws ClientProtocolException, IOException {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(SERVER_URL);
		String curTime = String.valueOf((new Date()).getTime() / 1000L);
		/*
		 * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
		 */
		String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);

		// 设置请求的header
		httpPost.addHeader("AppKey", APP_KEY);
		httpPost.addHeader("Nonce", NONCE);
		httpPost.addHeader("CurTime", curTime);
		httpPost.addHeader("CheckSum", checkSum);
		httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		// 设置请求的的参数，requestBody参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		/*
		 * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档” 2.参数格式是jsonArray的格式，例如
		 * "['13888888888','13666666666']"
		 * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
		 */
		// nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
		nvps.add(new BasicNameValuePair("mobile", mobilePhone));
		nvps.add(new BasicNameValuePair("codeLen", CODELEN));

		httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

		// 执行请求
		HttpResponse response = httpClient.execute(httpPost);
		/*
		 * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
		 * 2.具体的code有问题的可以参考官网的Code状态表
		 */
		
		Cache cache = new Cache();
		cache.setKey(mobilePhone);
		cache.setTimeOut(300000 + System.currentTimeMillis());
		cache.setValue(EntityUtils.toString(response.getEntity(), "utf-8"));
		CacheManager.putCache(mobilePhone, cache);
	}
	
	@Override
	public boolean verifyCode(String mobilePhone, String validationCode) {
		if (StringUtils.isEmpty(validationCode) || StringUtils.isEmpty(mobilePhone))
			return false;

		String code = null;
		try {
			code = (String) CacheManager.getCache(mobilePhone).getValue();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JsonObject jsonObject = new JsonParser().parse(code).getAsJsonObject();
		String cacheValidationCode = jsonObject.get("obj").getAsString();
		if (!StringUtils.isEmpty(cacheValidationCode) && validationCode.equals(cacheValidationCode)) {
			return true;
		} else {
			return false;
		}

	}
}