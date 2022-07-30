package com.maan.common;

import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.maan.DBCon.DBConnection;

public class MarineTemplateBridge {
	private transient JdbcTemplate template;
	//private transient SimpleJdbcCall mySimpleJdbcCall;
	private static MarineTemplateBridge ourInstance=new MarineTemplateBridge();
	private MarineTemplateBridge(){
		this.template=new JdbcTemplate(DBConnection.getInstance().getDataSource());	 
	}
	
	public static MarineTemplateBridge getInstance() 
	{ 
		if(null==ourInstance)
		{ 
			ourInstance= new MarineTemplateBridge(); 
		} 
		return ourInstance; 
	} 

	
	public JdbcTemplate gettemplate() throws SQLException {
		return this.template;
	}
	public SimpleJdbcCall getSimpleJdbc(){
		return new SimpleJdbcCall(DBConnection.getInstance().getDataSource());
	}
}

