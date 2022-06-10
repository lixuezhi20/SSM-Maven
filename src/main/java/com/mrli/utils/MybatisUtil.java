package com.mrli.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtil {
    SqlSession sqlSession = null;
    private static SqlSessionFactory sqlSessionFactory;

    //1.只需要创建一次会话工厂 ===> 选择static静态代码
    static{
        System.out.println("static Factory ===>");
        try {
            //1.读取mybatis的配置文件 IO流 得到输入流
            InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
            //2.创建sql会话工厂 (处理sql的工厂)
            SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
            sqlSessionFactory = sqlSessionFactoryBuilder.build(is);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("构建会话工厂sqlSessionFactor错误...");
        }
    }

    // 2.会话需要频繁的创建和关闭
    public static SqlSession createSqlSession(){
        //通过方法的返回值,得到会话对象
        //()中有两个值:true默认值,代表着自动提交事务处理;false代表手动进行事务处理
        return sqlSessionFactory.openSession(false);
    }

    //3.需要关闭的会话对象
    public static void closeSession(SqlSession sqlSession){
        //判断sqlSession不为空,关闭sqlSession对象
        if (sqlSession!=null){
            sqlSession.close();
        }
    }
}
