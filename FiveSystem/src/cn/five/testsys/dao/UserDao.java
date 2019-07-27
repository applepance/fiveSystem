package cn.five.testsys.dao;

import java.io.IOException;
import java.util.List;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.five.testsys.mapper.UserMapper;
import cn.five.testsys.entity.User;

public class UserDao {
	private UserMapper um ;
	{
        try {
            // 这个对应使用 一个工厂的创建器
            SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder() ;
            // 此时的路径表示一个 配置文件
            String  configs = "mybatis.xml";
            // 创建  build 参数中的流，用途： 读取配置文件
            InputStream inputStream = Resources.getResourceAsStream(configs) ;
            // 创建 sqlSessionFactory对象 目的 ： 为了创建 session
            SqlSessionFactory sqlSessionFactory =sqlSessionFactoryBuilder.build( inputStream ) ;
            // 创建 session  , 用于 操作 数据了
            SqlSession session = sqlSessionFactory.openSession(true) ;
            um = session.getMapper(UserMapper.class ) ;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	public User getUser_int(int uid){return um.getUser_int(uid);}
	
	public User getUser_string(String uname){return um.getUser_string(uname);}
	
	public int update_pwd(User user){return um.update_pwd(user);}
	
	public int save(User user){return um.save(user);}
	
	public List<User> getUser_power(String power){return um.getUser_power(power);}
	
}
