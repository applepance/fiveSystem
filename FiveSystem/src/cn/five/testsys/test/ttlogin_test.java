package cn.five.testsys.test;

import cn.five.testsys.dao.UserDao;
import cn.five.testsys.entity.User;

public class ttlogin_test {
	public static void main(String[] args) {
		String uname="一般孤儿";
		String pwd="123456w";
		UserDao userDao=new UserDao();
		User user=userDao.getUser_string(uname);
		if(pwd.equals(user.getPwd())) {
			System.out.println("okkkkkkkkkkkkk");
		}
		else {
			System.out.println("ssssssssssssssssssssss");
			System.out.println(userDao.getUser_string(uname).getUname());
			System.out.println(userDao.getUser_string(uname).getPwd());
		}
	}

}
