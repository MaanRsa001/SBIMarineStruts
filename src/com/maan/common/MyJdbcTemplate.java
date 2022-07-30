/*
 * Created on Jan 16, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.maan.common;

import java.sql.SQLException;
import java.text.MessageFormat;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.maan.DBCon.*;

/**
 * Abstract class from which every entity/usecase-specific DAO should extend.
 * Offers a variety of database related functions like getting a connection,
 * query execution, query execution embedded with paging logic, updation etc.
 */
 
public class MyJdbcTemplate {
	protected JdbcTemplate mytemplate;
	protected transient SimpleJdbcCall mySimpleJdbcCall;
	private final String source=ResourceLocator.getInstance().getSource(); // For Temporary (To Differentiate Oracle or SQLSERVER )
	public MyJdbcTemplate() {
		try {
			mytemplate = DBConnection.getInstance().gettemplate();
			mySimpleJdbcCall = new SimpleJdbcCall(mytemplate.getDataSource());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public JdbcTemplate getMytemplate() {
		return mytemplate;
	}

	public void setMytemplate(final JdbcTemplate mytemplate) {
		this.mytemplate = mytemplate;
	}
	protected String getQuery(String key){
		String query;
		query=ResourceLocator.getInstance().getBundle().getString(key);
		return query;
	}
	
	protected String getQuery(String key, Object... params) {
		return MessageFormat.format(getQuery(key),params);
	}
	
	protected void removeNull(Object []args) {
		for(int i=0;i<args.length;i++) {
			if(args[i]==null)
				args[i]=null;
		}
	}
	
	public String getSource(){
		return source;
	}
	public String queryFrammer(String query ,Object[] args){
		try{
			if(args != null){
				for(int i=0;i<args.length;i++){
					query = query.substring(0, query.indexOf("?")) +"'"+args[i]+"'"+ query.substring(query.indexOf("?") + 1);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return query;
	}
}