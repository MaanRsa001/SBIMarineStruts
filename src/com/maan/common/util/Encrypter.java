package com.maan.common.util;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encrypter {
	private static final String ALGO = "AES";
	private static final String	UNICODE_FORMAT= "UTF-8";
	private static final String AES_KEY = "1234567812345675";
	public String encrypt(String Data) throws Exception {
		SecretKeySpec keySpec = new SecretKeySpec(AES_KEY.getBytes(UNICODE_FORMAT), ALGO);
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.ENCRYPT_MODE, keySpec);
		byte[] encVal = c.doFinal(Data.getBytes());
		String encryptedValue = Base64.getEncoder().encodeToString(encVal);
		return encryptedValue;
	}

	public String decrypt(String encryptedData) throws Exception {
		SecretKeySpec keySpec = new SecretKeySpec(AES_KEY.getBytes(UNICODE_FORMAT), ALGO);
		Cipher c = Cipher.getInstance(ALGO);
		c.init(Cipher.DECRYPT_MODE, keySpec);
		byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
		byte[] decValue = c.doFinal(decordedValue);
		String decryptedValue = new String(decValue);
		return decryptedValue;
	}

	public static void main(String[] args) {
		try {
			System.out.println(new Encrypter().encrypt("680665687b5e45128dc6bae9d9ceea0c80aee3c94d144894bdae3e6d4381d3431d6d86bfdeb54beab820a8fbcfb6f5ea4c6f09e4bac5462e9cd6f3b0a7f1f949a22b9d231c0d41f995799b1d03eb92c22e1248af195f4d7991ba0c23527b52c713d343919c6e45768489d95a7e2028d47bac96719d2548acbb973d3e2a603e4b"));
			//System.out.println(new Encrypter().decrypt("qBU1+CI2kVRszrb/C6Hcng=="));
		} catch(Exception exception) {
			//logger.debug(exception);
		}
	}
}
