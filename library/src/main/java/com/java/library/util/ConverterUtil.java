package com.java.library.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ConverterUtil {
	public static String prettyJSON(String str) {
		ObjectMapper mapper = new ObjectMapper();
		String rstStr = "";
		try {
			rstStr =  mapper.writer().writeValueAsString(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return rstStr;
	}
}
