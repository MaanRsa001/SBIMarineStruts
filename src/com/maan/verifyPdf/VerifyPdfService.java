package com.maan.verifyPdf;

import java.util.List;
import java.util.Map;

public class VerifyPdfService {
	VerifyApiCaller api = new VerifyApiCaller();
	
	
	public List<Map<String, Object>> getQuotelist(VerifyPdfBean bean) {
		return api.getQuoteList(bean);
	}

}
