package cn.five.testsys.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.five.testsys.entity.Good;
import cn.five.testsys.mapper.GoodMapper;

public class GoodDao {
	private GoodMapper gm ;
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
            gm = session.getMapper(GoodMapper.class ) ;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	public Good getGood_gname_use(String gname){return gm.getGood_gname_use(gname);}
	public Good getGood_gname(String gname){return gm.getGood_gname(gname);}
	public Good getGood_gid(int gid){return gm.getGood_gid(gid);}
	public List<Good> getGood_allwait(String gstatus) {return gm.getGood_allwait(gstatus);}
	public List<Good> getGood_allgtype(String gtype) {return gm.getGood_allgtype(gtype);}
	public int update_gnum(Good good){return gm.update_gnum(good);}
	
	public int save(Good good){return gm.save(good);}

}
