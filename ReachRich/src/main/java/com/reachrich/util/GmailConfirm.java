package com.reachrich.util;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
public class GmailConfirm {
	private GmailConfirm() {}	
	private static GmailConfirm instance = new GmailConfirm();
	public static GmailConfirm getInstance() {
		return instance;
	}

	public String connectEmail(String email){
		String to1=email; // 인증위해 사용자가 입력한 이메일주소
		String host="smtp.googlemail.com"; // smtp 서버
		String subject="인증번호 전달"; // 보내는 제목 설정
		String fromName="관리자"; // 보내는 이름 설정
		String from="Admin"; // 보내는 사람(구글계정)
		String authNum=GmailConfirm.authNum(); // 인증번호 위한 난수 발생부분
		String content="인증번호 ["+authNum+"]"; // 이메일 내용 설정
		
        // SMTP 이용하기 위해 설정해주는 설정값들
		try{
			Properties props=new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
			props.put("mail.smtp.ssl.enable", "true");  // 추가된 코드
			Session mailSession 
				= Session.getInstance(props,new javax.mail.Authenticator(){
			    protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				    return new javax.mail.PasswordAuthentication("x3000hjh@gmail.com","mlbxpqfbykweeigd"); // gmail계정, 앱비밀번호
			    }
			});
		
			Message msg = new MimeMessage(mailSession);
			InternetAddress []address1 = {new InternetAddress(to1)};
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"utf-8","B")));
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date()); // 보내는 날짜 설정
			msg.setContent(content,"text/html; charset=utf-8"); // 내용설정
		
			Transport.send(msg); // 메일보내기
		}catch(MessagingException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return authNum;
	}
	
	//UUID 생성(임시비밀번호 8 ~ 10자리)
	public static String authNum() {
		String uuid = UUID.randomUUID().toString(); //문자열로 변환
		return uuid.substring(0,8);// 앞 8자만 추출
	}

}
