package com.maan.common.util;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;

import org.apache.commons.lang3.StringUtils;

@SuppressWarnings("unchecked")
public class EscapeUtils {
	public static final HashMap m = new HashMap();
	static {
		m.put(34, "&quot;"); //  double quotes
		m.put(39, "&apos;"); // single quote
		m.put(60, "&lt;"); //  less-than
		m.put(62, "&gt;"); //  greater-than
		m.put(160, "&nbsp;"); // Non-breaking space
		m.put(38, "&amp;"); // Ampersand
		m.put(162, "&cent;"); // Cent
		m.put(163, "&pound;"); // Pound
		m.put(165, "&yen;"); // Yen
		m.put(8364, "&euro;"); // Euro
		m.put(167, "&sect;"); // Section
		m.put(169, "&copy;"); // Copyright
		m.put(174, "&reg;"); // Registered trademark
		m.put(8482, "&trade;"); // Trademark
		m.put(40, "&lpar;"); // left parenthesis
		m.put(41, "&rpar;"); // right parenthesis
		m.put(37, "&percnt;"); // percent sign
		m.put(42, "&ast;"); // Asterisk
		m.put(43, "&plus;"); // Plus
		m.put(44, "&comma;"); // Comma
		m.put(8208, "&hyphen;"); // hyphen
		m.put(8211, "&ndash;"); // hyphen
		m.put(8212, "&mdash;"); // hyphen
		m.put(8213, "&horbar;"); // hyphen
		m.put(47, "&sol;"); // slash
		m.put(59, "&semi;"); // semicolon
		m.put(61, "&equals;"); // equals
		m.put(94, "&Hat;"); // Hat
		m.put(124, "&verbar;"); // Vertical bar
		// User needs to map all html entities with their corresponding decimal
		// values.
		// Please refer to below table for mapping of entities and integer value
		// of a char
	}

	public static String escapeHtml(String str) {
		try {
			if(StringUtils.isNoneBlank(str)) {
			StringWriter writer = new StringWriter((int) (str.length() * 1.5));
			escape(writer, str);
			System.out.println("encoded string is " + writer.toString());
			return writer.toString();
			}else {
				return null;
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
			return null;
		}
	}

	public static void escape(Writer writer, String str) throws IOException {
		int len = str.length();
		for (int i = 0; i < len; i++) {
			char c = str.charAt(i);
			int ascii = (int) c;
			String entityName = (String) m.get(ascii);
			if (entityName == null) {
				if (c > 0x7F) {
					writer.write("&#");
					writer.write(Integer.toString(c, 10));
					writer.write(';');
				} else {
					writer.write(c);
				}
			} else {
				writer.write(entityName);
			}
		}
	}
}
