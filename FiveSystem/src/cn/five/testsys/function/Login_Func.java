package cn.five.testsys.function;

import cn.five.testsys.dao.UserDao;
import cn.five.testsys.entity.User;

public class Login_Func {
	
	public String select_power(String uname,String pwd) {
		UserDao userDao=new UserDao();
		User user=userDao.getUser_string(uname);
		if(pwd.equals(user.getPwd())){
			if(user.getPower().equals("Non"))
				return "Non";
			if(user.getPower().equals("Queen"))
				return "Queen";
			if(user.getPower().equals("King"))
				return "King";
			if(user.getPower().equals("Knight"))
				return "Knight";
			return "login_failure";
		}
		else{
			return "login_failure";
		}
	}
	
	public String check_power(String power) {
		if(power.equals("Non"))
			return "index_Non.jsp";
		if(power.equals("Queen"))
			return "index_Queen.jsp";
		if(power.equals("King"))
			return "index_King.jsp";
		if(power.equals("Knight"))
			return "index_Knight.jsp";
		return "login.jsp";
	}
	
	public String logining_jump(String uname,String pwd) {
		String power=select_power(uname,pwd);
		if("Non".equals(power))
			return "index_Non.jsp";
		if("Queen".equals(power))
			return "index_Queen.jsp";
		if("King".equals(power))
			return "index_King.jsp";
		if("Knight".equals(power))
			return "index_Knight.jsp";
		return "login.jsp";
	}
	
	public void save(String uname,String pwd,String power) {
		UserDao userDao=new UserDao();
		User user=new User(uname,pwd,power);
		int temp=0;
		temp=userDao.save(user);
	}
	
	public void chang_pwd(String uname ,String pwd) {
		UserDao userDao=new UserDao();
		User user=userDao.getUser_string(uname);
		user.setPwd(pwd);
		int temp=0;
		temp=userDao.update_pwd(user);
	}

}
