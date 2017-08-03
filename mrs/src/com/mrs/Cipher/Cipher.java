package com.mrs.Cipher;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Cipher {

	private static final int    ITERATION_CNT = 10;
	private static final String SALT          = "saltkey";
	
	public static byte[] getSalt() {
		return SALT.getBytes();
	}
	
	public static byte[] encrypt(byte[] data, byte[] salt, String algorithm) throws NoSuchAlgorithmException {
		
		MessageDigest digest = MessageDigest.getInstance(algorithm);
		digest.reset();
		
		if( salt == null ) {
			digest.update(getSalt());
		} else {
			digest.update(salt);
		}		
		for( int i = 0; i < ITERATION_CNT; i++ ) {
			data = digest.digest(data);
		}		
		return data;
	}
	
	public static String encryptSHA256(String data, String salt) {
		try {
			
			
			byte[] bSalt = null;
			if( salt != null ) {
				bSalt = salt.getBytes();
			}
			
			byte[] encrypt = Cipher.encrypt(data.getBytes(), bSalt, "SHA-256");
			
			StringBuffer buff = new StringBuffer();
			for( int i = 0; i < encrypt.length; i++ ) {
				String hex = Integer.toHexString( encrypt[i] & 0xFF ).toUpperCase();
				if( hex.length() == 1 ) {
					buff.append("0");
				}
				buff.append(hex);
			}
			return buff.toString();
			
		} catch(NoSuchAlgorithmException e) {
			System.out.println("Cipher ERROR : " + e);
			return null;
		}
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println( Cipher.encryptSHA256("mrsdelivery", "saltkey") );   

	}

}
