package com.maan.common;

import java.sql.SQLException;
import java.text.MessageFormat;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
 
public class MarineJdbcTemplate {
	protected JdbcTemplate mytemplate;
	protected transient SimpleJdbcCall mySimpleJdbcCall;
	
	private final String source=ResourceLocator.getInstance().getSource(); // For Temporary (To Differentiate Oracle or SQLSERVER )
	public MarineJdbcTemplate() {
		try {
			mytemplate = MarineTemplateBridge.getInstance().gettemplate();
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
}
