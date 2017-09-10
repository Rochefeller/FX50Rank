package cn.fx50rank.systemmgmt.mapper;

import cn.fx50rank.systemmgmt.bean.User;

public interface UserMapper {
	
	User findUserByPhone(String name);
	
	int addUser(User user);

}
