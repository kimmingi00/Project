package util;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class PassConfirm {
   public String connectEmail(String email){
      String to1=email; // 인증위해 사용자가 입력한 이메일주소
      String host="smtp.gmail.com"; // smtp 서버
      String subject="임시 비밀번호 전달"; // 보내는 제목 설정
      String fromName="관리자"; // 보내는 이름 설정
      String from="alsrldkrk00"; // 보내는 사람(구글계정)
      String passNum=PassConfirm.passNum();  // 인증번호 위한 난수 발생부분
      String content="임시 비밀번호 ["+passNum+"]"; // 이메일 내용 설정
   
      
        // SMTP 이용하기 위해 설정해주는 설정값들
      try{
         Properties props=new Properties();
         props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.transport.protocol", "smtp");
         props.put("mail.smtp.host", host);
         props.setProperty
                       ("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
         props.put("mail.smtp.port","465");
         props.put("mail.smtp.user",from);
         props.put("mail.smtp.auth","true");
      
         Session mailSession 
            = Session.getInstance(props,new javax.mail.Authenticator(){
             protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication
                                        ("alsrldkrk00","kmg920906@"); // gmail계정
             }
         });
      
         Message msg = new MimeMessage(mailSession);
         InternetAddress []address1 = {new InternetAddress(to1)};
         msg.setFrom(new InternetAddress
                      (from, MimeUtility.encodeText(fromName,"utf-8","B")));
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
      return passNum;
   }

    // 난수발생 function
   public static String authNum(){
      StringBuffer buffer=new StringBuffer();
      for(int i=0;i<=4;i++){
         int num=(int)(Math.random()*9+1);
         buffer.append(num);
      }
      return buffer.toString();
   }
   
   // 임시 비밀번호 생성 (8~10)
   
   public static String passNum() {
	 String uuid=UUID.randomUUID().toString().substring(0,8);
	 
	 return uuid;
   }
   
   
}