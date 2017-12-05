package com.pknu.pass.login.common;

import java.security.MessageDigest;

public class SecurityUtil {

	public String encrypt(String passWord) {
		if (passWord == "") {
			return null;
		} else {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(passWord.getBytes());
				byte byteDate[] = md.digest();

				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteDate.length; i++) {
					sb.append(Integer.toString((byteDate[i] & 0xff) + 0x100, 16));
				}

				StringBuffer hexString = new StringBuffer();
				for (int i = 0; i < byteDate.length; i++) {
					String hex = Integer.toHexString(0xff & byteDate[i]);
					if (hex.length() == 1) {
						hexString.append('0');
					}
					hexString.append(hex);
				}
				return hexString.toString();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				throw new RuntimeException();
			}
		}

	}

}
