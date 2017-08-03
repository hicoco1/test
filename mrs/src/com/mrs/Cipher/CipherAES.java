package com.mrs.Cipher;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
 

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
 

import org.apache.commons.codec.binary.Base64;
 
public class CipherAES {
    private static String iv;
    private static Key keySpec;
 
    public CipherAES() throws UnsupportedEncodingException { 
    //public CipherAES(String key) throws UnsupportedEncodingException { saltkey를 파라미터로 받아서 처리할 경우
    	String key ="mrs_delivery!@#$";
        CipherAES.iv = key.substring(0, 16);
 
        byte[] keyBytes = new byte[16];
        byte[] b = key.getBytes("UTF-8");
        int len = b.length;
        if(len > keyBytes.length)
            len = keyBytes.length;
        System.arraycopy(b, 0, keyBytes, 0, len);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
 
        CipherAES.keySpec = keySpec;
    }
 
    // 암호화
    public static String aesEncode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, 
                                                     NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, 
                                                     IllegalBlockSizeException, BadPaddingException{
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
 
        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
        String enStr = new String(Base64.encodeBase64(encrypted));
 
        return enStr;
    }
 
    //복호화
    public static String aesDecode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, 
                                                     NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, 
                                                     IllegalBlockSizeException, BadPaddingException {
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
 
        byte[] byteStr = Base64.decodeBase64(str.getBytes());
 
        return new String(c.doFinal(byteStr),"UTF-8");
    }
    
    /*
    public static void main(String[] args) throws Exception {
        String key = "mrs_delivery!@#$";       // key는 16자 이상 
        CipherAES aes256 = new CipherAES(key);
         
        String text = "암호화되지 않은 문자입니다.";
        String encText = aes256.aesEncode(text);
        String decText = aes256.aesDecode(encText);
         
        System.out.println("암호화할 문자 : " + text);
        System.out.println("암호화된 문자 : " + encText);
        System.out.println("복호화된 문자 : " + decText);
    }
    */
}
