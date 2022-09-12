package com.maan.common;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import org.apache.logging.log4j.Logger;
import com.maan.common.LogUtil; 
public final class PasswordService {
	final static Logger logger = LogUtil.getLogger(PasswordService.class);
    private static PasswordService instance;

    public PasswordService() {
    }

    public synchronized String encrypt(String plaintext) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA"); //step 2
        } catch (NoSuchAlgorithmException e) {
            logger.error("SHA Algorithm Instance Exception => ", e);
        }

        try {
            md.update(plaintext.getBytes("UTF-8")); //step 3
        } catch (UnsupportedEncodingException e) {
            logger.error("Encription Exception => ", e);
        }

        byte raw[] = md.digest(); //step 4
        String hash = Base64.getEncoder().encodeToString(raw); //step 5
        return hash; //step 6
    }

    public static synchronized PasswordService getInstance() { //step 1
        if (instance == null) {
            instance = new PasswordService();
        }
        return instance;
    }
}
