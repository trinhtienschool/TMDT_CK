package vn.thegioidochoi.model.mail;
import vn.thegioidochoi.model.notifications.Notifications;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class Mail {
    public static boolean sendMail(String context,String subject,String receivers){
        final String username = "trinhtien6236@gmail.com";
        final String password = "ftnobneiwiizgjwh";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        session.getProperties().put("mail.smtp.ssl.trust", "smtp.gmail.com");
        session.getProperties().put("mail.smtp.starttls.enable", "true");
        session.setDebug(true);
        try {

            MimeMessage message = new MimeMessage(session);
            try {
                message.setFrom(new InternetAddress("trinhtien6236@gmail.com","thegioidochoi"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(receivers)
            );
            message.setSubject(subject,"UTF-8");
            message.setText(context,"UTF-8","html");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        String context = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Document</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <h1 style=\"color: red\">Hi</h1>\n" +
                "    <p style=\"color: blue\">Tôi là trịnh quang tiến</p>\n" +
                "\n" +
                "</body>\n" +
                "</html>";
        System.out.println(sendMail(context,"day la subject", "trinhtien6236@gmail.com"));

    }
}

