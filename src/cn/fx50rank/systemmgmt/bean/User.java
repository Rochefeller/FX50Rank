package cn.fx50rank.systemmgmt.bean;

import java.io.Serializable;
import java.util.Date;



/**
 * 用户Entity
 * @author liufei
 * @version 1.0
 */

public class User implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	
	public User(){
		super();
	}
	
	public User(Integer id, String userName){
		this.id = id;
		this.userName = userName;
	}
	
	private Integer id; 		// 编号
	
	private String userName;//用户名
	
	private Integer userType;//用户类型 
	
	private String password;//密码 使用MD5加密（只针对注册用户）
	
	private Date lastLoginDate;//最后登录时间
	
	private String userEmail;//用户邮箱

	private String remarks;//备注信息
	
	private String loginErrorCode;//登录错误信息
	
	private Boolean isLoginSuccess;//是否登录成功
	
	private String mobilePhone;//电话号码
	
	private String inviteCode;//邀请码
	
	private String validationCode;//验证码
	
	private int recommendId;//


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getLoginErrorCode() {
		return loginErrorCode;
	}

	public void setLoginErrorCode(String loginErrorCode) {
		this.loginErrorCode = loginErrorCode;
	}

	public Boolean getIsLoginSuccess() {
		return isLoginSuccess;
	}

	public void setIsLoginSuccess(Boolean isLoginSuccess) {
		this.isLoginSuccess = isLoginSuccess;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getInviteCode() {
		return inviteCode;
	}

	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

	public int getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(int recommendId) {
		this.recommendId = recommendId;
	}
	
}


