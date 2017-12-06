package com.pknu.pass.login.common;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {
	private final JavaMailSender javaMailSender;

	@Autowired
	public MailUtil(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void sendMail(String certKey, String email) {
		String linkhead="<a href=\"";
		String url = "http://localhost:80/member/checkJoin?certKey=";
		String linkend="\">인증링크</a>";
		String subject = "회원 가입 인증 관련 메일입니다";
		StringBuilder sb = new StringBuilder();
		sb.append(linkhead).append(url).append(certKey).append(linkend);
		send(subject, sb.toString(), "su3468@gmail.com", email);
		System.out.println("*************************************************");
	}
	
	public void sendPass(String pass,String email) {
		String subject="비밀번호 찾기 관련 메일입니다.";
		StringBuffer sb=new StringBuffer();
		sb.append(pass);		
		send(subject, sb.toString(),"su3468@gmail.com", email);
	}
	
	public boolean send(final String subject, final String text, final String from, final String to) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
				mimeMessage.setFrom(new InternetAddress(from));
				mimeMessage.setSubject(subject);
				mimeMessage.setText(text,"utf-8","html");
			}
		};
		
		try {
			javaMailSender.send(preparator);
			return true;
		} catch (MailException e) {
			return false;
		}
	}
}
