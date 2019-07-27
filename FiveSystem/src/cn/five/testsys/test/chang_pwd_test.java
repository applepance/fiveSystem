package cn.five.testsys.test;

import cn.five.testsys.dao.UserDao;
import cn.five.testsys.function.Login_Func;

public class chang_pwd_test {
	public static void main(String[] args) {
		Login_Func login_Func=new Login_Func();
		login_Func.chang_pwd("二般孤儿","123456w");
		System.out.println(login_Func.logining_jump("二般孤儿", "123456w"));
	}
}
