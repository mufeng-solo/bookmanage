package com.java.entity;

import org.apache.commons.codec.digest.DigestUtils;

public class SecurityUtil {

	//md5º”√‹
	public static String md5Encode(byte[] input) {
		return DigestUtils.md5Hex(input);
	}
	
//	public static void main(String[] args) {
//		String str = "123456";
//		
//		str = md5Encode(str.getBytes());
//		System.out.println(str);
//	}
}
