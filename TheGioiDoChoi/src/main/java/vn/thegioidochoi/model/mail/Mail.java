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
//        String context = "<!DOCTYPE html>\n" +
//                "<html lang=\"en\">\n" +
//                "<head>\n" +
//                "    <meta charset=\"UTF-8\">\n" +
//                "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
//                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
//                "    <title>Document</title>\n" +
//                "</head>\n" +
//                "<body>\n" +
//                "    <h1 style=\"color: red\">Hi</h1>\n" +
//                "    <p style=\"color: blue\">Tôi là trịnh quang tiến</p>\n" +
//                "\n" +
//                "</body>\n" +
//                "</html>";
        String context = "<!DOCTYPE html>\n" +
                "<html>\n" +
                "\t<head>\n" +
                "\t\t<meta charset=\"utf-8\" />\n" +
                "\t\t<title>A simple, clean, and responsive HTML invoice template</title>\n" +
                "\n" +
                "\t\t<style>\n" +
                "\t\t\t.invoice-box {\n" +
                "\t\t\t\tmax-width: 800px;\n" +
                "\t\t\t\tmargin: auto;\n" +
                "\t\t\t\tpadding: 30px;\n" +
                "\t\t\t\tborder: 1px solid #eee;\n" +
                "\t\t\t\tbox-shadow: 0 0 10px rgba(0, 0, 0, 0.15);\n" +
                "\t\t\t\tfont-size: 16px;\n" +
                "\t\t\t\tline-height: 24px;\n" +
                "\t\t\t\tfont-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\n" +
                "\t\t\t\tcolor: #555;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table {\n" +
                "\t\t\t\twidth: 100%;\n" +
                "\t\t\t\tline-height: inherit;\n" +
                "\t\t\t\ttext-align: left;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table td {\n" +
                "\t\t\t\tpadding: 5px;\n" +
                "\t\t\t\tvertical-align: top;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr td:nth-child(2) {\n" +
                "\t\t\t\ttext-align: right;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.top table td {\n" +
                "\t\t\t\tpadding-bottom: 20px;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.top table td.title {\n" +
                "\t\t\t\tfont-size: 45px;\n" +
                "\t\t\t\tline-height: 45px;\n" +
                "\t\t\t\tcolor: #333;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.information table td {\n" +
                "\t\t\t\tpadding-bottom: 40px;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.heading td {\n" +
                "\t\t\t\tbackground: #eee;\n" +
                "\t\t\t\tborder-bottom: 1px solid #ddd;\n" +
                "\t\t\t\tfont-weight: bold;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.details td {\n" +
                "\t\t\t\tpadding-bottom: 20px;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.item td {\n" +
                "\t\t\t\tborder-bottom: 1px solid #eee;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.item.last td {\n" +
                "\t\t\t\tborder-bottom: none;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box table tr.total td:nth-child(2) {\n" +
                "\t\t\t\tborder-top: 2px solid #eee;\n" +
                "\t\t\t\tfont-weight: bold;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t@media only screen and (max-width: 600px) {\n" +
                "\t\t\t\t.invoice-box table tr.top table td {\n" +
                "\t\t\t\t\twidth: 100%;\n" +
                "\t\t\t\t\tdisplay: block;\n" +
                "\t\t\t\t\ttext-align: center;\n" +
                "\t\t\t\t}\n" +
                "\n" +
                "\t\t\t\t.invoice-box table tr.information table td {\n" +
                "\t\t\t\t\twidth: 100%;\n" +
                "\t\t\t\t\tdisplay: block;\n" +
                "\t\t\t\t\ttext-align: center;\n" +
                "\t\t\t\t}\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t/** RTL **/\n" +
                "\t\t\t.invoice-box.rtl {\n" +
                "\t\t\t\tdirection: rtl;\n" +
                "\t\t\t\tfont-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box.rtl table {\n" +
                "\t\t\t\ttext-align: right;\n" +
                "\t\t\t}\n" +
                "\n" +
                "\t\t\t.invoice-box.rtl table tr td:nth-child(2) {\n" +
                "\t\t\t\ttext-align: left;\n" +
                "\t\t\t}\n" +
                "\t\t</style>\n" +
                "\t</head>\n" +
                "\n" +
                "\t<body>\n" +
                "\t\t<div class=\"invoice-box\">\n" +
                "\t\t\t<table cellpadding=\"0\" cellspacing=\"0\">\n" +
                "\t\t\t\t<tr class=\"top\">\n" +
                "\t\t\t\t\t<td colspan=\"2\">\n" +
                "\t\t\t\t\t\t<table>\n" +
                "\t\t\t\t\t\t\t<tr>\n" +
                "\t\t\t\t\t\t\t\t<td class=\"title\">\n" +
                "\t\t\t\t\t\t\t\t\t<img src=\"http://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-4_044127014.jpg\" style=\"width: 100%; max-width: 300px\" />\n" +
                "\t\t\t\t\t\t\t\t</td>\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t<td>\n" +
                "\t\t\t\t\t\t\t\t\tInvoice #: 123<br />\n" +
                "\t\t\t\t\t\t\t\t\tCreated: January 1, 2015<br />\n" +
                "\t\t\t\t\t\t\t\t\tDue: February 1, 2015\n" +
                "\t\t\t\t\t\t\t\t</td>\n" +
                "\t\t\t\t\t\t\t</tr>\n" +
                "\t\t\t\t\t\t</table>\n" +
                "\t\t\t\t\t</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"information\">\n" +
                "\t\t\t\t\t<td colspan=\"2\">\n" +
                "\t\t\t\t\t\t<table>\n" +
                "\t\t\t\t\t\t\t<tr>\n" +
                "\t\t\t\t\t\t\t\t<td>\n" +
                "\t\t\t\t\t\t\t\t\tSparksuite, Inc.<br />\n" +
                "\t\t\t\t\t\t\t\t\t12345 Sunny Road<br />\n" +
                "\t\t\t\t\t\t\t\t\tSunnyville, CA 12345\n" +
                "\t\t\t\t\t\t\t\t</td>\n" +
                "\n" +
                "\t\t\t\t\t\t\t\t<td>\n" +
                "\t\t\t\t\t\t\t\t\tAcme Corp.<br />\n" +
                "\t\t\t\t\t\t\t\t\tJohn Doe<br />\n" +
                "\t\t\t\t\t\t\t\t\tjohn@example.com\n" +
                "\t\t\t\t\t\t\t\t</td>\n" +
                "\t\t\t\t\t\t\t</tr>\n" +
                "\t\t\t\t\t\t</table>\n" +
                "\t\t\t\t\t</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"heading\">\n" +
                "\t\t\t\t\t<td>Phương thức thanh toán</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>Check #</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"details\">\n" +
                "\t\t\t\t\t<td>Check</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>1000</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"heading\">\n" +
                "\t\t\t\t\t<td>Item</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>Price</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"item\">\n" +
                "\t\t\t\t\t<td>Website design</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>$300.00</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"item\">\n" +
                "\t\t\t\t\t<td>Hosting (3 months)</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>$75.00</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"item last\">\n" +
                "\t\t\t\t\t<td>Domain name (1 year)</td>\n" +
                "\n" +
                "\t\t\t\t\t<td>$10.00</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\n" +
                "\t\t\t\t<tr class=\"total\">\n" +
                "\t\t\t\t\t<td></td>\n" +
                "\n" +
                "\t\t\t\t\t<td>Total: $385.00</td>\n" +
                "\t\t\t\t</tr>\n" +
                "\t\t\t</table>\n" +
                "\t\t</div>\n" +
                "\t</body>\n" +
                "</html>";

        System.out.println(sendMail(context,"day la subject", "trinhtien2212@gmail.com"));

    }
}

