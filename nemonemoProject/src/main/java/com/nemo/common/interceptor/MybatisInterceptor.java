package com.nemo.common.interceptor;

import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import lombok.extern.slf4j.Slf4j;


@Intercepts(@Signature(
		type=Executor.class, 
		method="query", 
		args= {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}))
@Slf4j
public class MybatisInterceptor implements Interceptor  {
	
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		
        //QueryId
		String queryID = ((MappedStatement)invocation.getArgs()[0]).getId();
		log.info("Query ID : {}", queryID);
		
        //Query Parameter
		Object param = invocation.getArgs()[1];
		//Query String
        String queryString = ((MappedStatement)invocation.getArgs()[0]).getBoundSql(param).getSql();
		log.info("Query String : {}", queryString);
		
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
	}
	
	
}
