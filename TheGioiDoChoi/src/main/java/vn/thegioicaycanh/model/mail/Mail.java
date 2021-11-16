package vn.thegioicaycanh.model.mail;
import vn.thegioicaycanh.model.notifications.Notifications;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.management.Notification;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class Mail {
    public static boolean sendMail(String context,String subject,String receivers){
        final String username = "trinhtien6236@gmail.com";
        final String password = "rgjwojzpmiowtvbr";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        prop.put("mail.smtp.connectiontimeout", "1000");
        prop.put("mail.smtp.timeout", "1000");

        Session session = Session.getDefaultInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        session.getProperties().put("mail.smtp.ssl.trust", "smtp.gmail.com");
        session.getProperties().put("mail.smtp.starttls.enable", "true");
//        session.setDebug(true);
        try {

            MimeMessage message = new MimeMessage(session);
            try {
                message.setFrom(new InternetAddress("trinhtien6236@gmail.com","TheGioiCayCanh"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(receivers)
            );
            message.setSubject(subject,"UTF-8");
//            message.setText("Chào Tiến!,"
//                    + "\n Đây là link lấy lại mật khẩu! Link có thời hạn 3 ngày kể từ ngày nhận. Bấm vào để xác nhận"
//                    +"\n http://localhost:8080/thegioicaycanh.vn");
            message.setText(context,"UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(sendMail("toi ten tien","day la subject", new Notifications().getListEmail()));

    }
}

