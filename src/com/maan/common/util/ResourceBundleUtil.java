package com.maan.common.util;

import java.text.MessageFormat;
import java.util.MissingResourceException;

import com.maan.common.DBConstants;
import com.maan.common.ResourceLocator;

public class ResourceBundleUtil {

	public static String findText(String productId, String key) {
		String value = key;
		try {
			if("65".equals(productId)) {
				value=ResourceLocator.getInstance().getMotorBundle().getString(key);
			} else if("30".equals(productId)) {
				value=ResourceLocator.getInstance().getHomeBundle().getString(key);
			} else if(DBConstants.USERMGT_PROPERTYID.equals(productId)) {
				value=ResourceLocator.getInstance().getUserMgtBundle().getString(key);
			} else if(DBConstants.APP_FIELD_NAMES_ID.equals(productId)) {
				value=ResourceLocator.getInstance().getAppFieldNamesBundle().getString(key);
			}else if(DBConstants.CLAIM_PROPERTY_FILE.equals(productId)) {
				value=ResourceLocator.getInstance().getClaimBundle().getString(key);
			}
		} catch(MissingResourceException mre) {
			try {
				value= findDefaultText(key);
			} catch(MissingResourceException mrex) {}
		}
		return value;
	}
	public static String findText(String productId, String key, Object... params) {
		return MessageFormat.format(findText(productId,key),params);
	}
	
	public static String findDefaultText(String key) {
		String value = key;
		try {
			value=ResourceLocator.getInstance().getAppConstantsBundle().getString(key);
		} catch(MissingResourceException mrex) {}
		return value;
	}
	
	public static String findTameeniText(String key) {
		String value = key;
		try {
			value=ResourceLocator.getInstance().getTameeniMotorBundle().getString(key);
		} catch(MissingResourceException mrex) {}
		return value;
	}
}
