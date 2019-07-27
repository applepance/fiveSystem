package cn.five.testsys.mapper;

import cn.five.testsys.entity.User;
import java.util.List;

public interface UserMapper {
	User getUser_int(int uid);
	User getUser_string(String uname);
	int update_pwd(User user);
	int save(User user);
	List<User> getUser_power(String power);
}