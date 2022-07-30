package com.maan.common;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;

public class ConvertService {
	
	public static String dateFormatConversion(String dateString, String dateFormatFrom, String dateFormatTo) {
		try {
			if(StringUtils.isNotBlank(dateString)) {
				DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern(dateFormatFrom, Locale.ENGLISH);
				DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern(dateFormatTo);
				LocalDate date = LocalDate.parse(dateString, formatter1);
				return date.format(formatter2);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dateString;
	}

}
