package cn.five.testsys.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.five.testsys.entity.ReqGood;
import cn.five.testsys.mapper.ReqGoodMapper;

public class ReqGoodDao {
	private ReqGoodMapper rgm ;
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
            rgm = session.getMapper(ReqGoodMapper.class ) ;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	public List<ReqGood> getReqGood_req_id(int req_id) {return rgm.getReqGood_req_id(req_id);}
	
	public int save(ReqGood reqGood){return rgm.save(reqGood);}

}
