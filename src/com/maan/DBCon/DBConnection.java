package com.maan.DBCon;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

public class DBConnection implements Serializable
{
	private transient JdbcTemplate template;
	private transient SimpleJdbcCall mySimpleJdbcCall;
	private static final long serialVersionUID = 1L;
	private static DBConnection ourInstance = new DBConnection(); 
	Context initContext = null;
	DataSource ds = null;
	
	public static DBConnection getInstance() 
	{ 
		if(null==ourInstance)
		{ 
			ourInstance= new DBConnection(); 
		} 
		return ourInstance; 
	} 

	private DBConnection() 
	{ 
		try
		{	
			initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:comp/env/MARINENEW");
			template = new JdbcTemplate(ds);
			mySimpleJdbcCall=new SimpleJdbcCall(ds);
		}
		catch(Exception e)
		{
			System.out.println("DBConnection object "+e);
			e.printStackTrace();
		}
	} 

	public Connection getDBConnection()
	{
		Connection connection = null;
		try
		{
		    connection = ds.getConnection();
		}
		catch(Exception exception)
		{
			System.out.println("getDBConnection ..."+exception);
		    exception.printStackTrace();
		}
		return connection;
	}

	public JdbcTemplate gettemplate() throws SQLException {
		return template;
	}
	public SimpleJdbcCall getSimpleJdbc(){
		return new SimpleJdbcCall(ds);
	}
	public DataSource getDataSource(){
		return ds;
	}
}
