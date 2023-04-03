package com.reachrich.demo.util;

import java.security.MessageDigest;

public class UserSHA256 { //비밀번호 암호화 과정 128bit 버전
	public static String getSHA256(String str){
        StringBuffer sbuf = new StringBuffer();
        MessageDigest mDigest = null;
        try {
             mDigest = MessageDigest.getInstance("SHA-256");//객체 생성
        }catch(Exception e) {
             e.printStackTrace();
        }
        mDigest.update(str.getBytes()); //해시데이터
        byte[] msgStr = mDigest.digest() ;//바이트 배열의 바이너리 로 변환
        // 16진수 문자열 변환
        for(int i=0; i < msgStr.length; i++){
             byte tmpStrByte = msgStr[i];
             String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
             sbuf.append(tmpEncTxt) ;
        }
        return sbuf.toString();
    }
}
