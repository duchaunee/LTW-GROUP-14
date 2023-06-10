package utils;

import entity.User;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.xml.bind.DatatypeConverter;

public class Utils {
    
    public static List<InputStream> processImage(HttpServletRequest request){
        List<InputStream> image = new ArrayList<>();
        try {
            for (Part part : request.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && fileName.length() > 0) {
                    image.add(part.getInputStream());
                }
            }
        }
        catch(IOException | ServletException e){
            System.out.println(e);
        }
        return image;
    }
    
    private static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
    
    public static String formatDate(LocalDateTime dateTime){
        return dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
    
    public static String formatDateTime(LocalDateTime dateTime){
        return dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy | HH:mm:ss"));
    }
    
    public static String formatCurrency(Long money){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(money);
    }
    
    public static String encodeMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
            return myHash;
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static User getUserInSession(HttpServletRequest request){
        return (User)request.getSession().getAttribute("user");
    }
    
    public static void setLastRequest(HttpServletRequest request, String lastRequest){
        request.getSession().setAttribute("lastRequest", lastRequest);
    }
    
    public static String getLastRequest(HttpServletRequest request){
        Object object = request.getSession().getAttribute("lastRequest");
        if(object == null) return null;
        return object.toString();
    }
    
    public static void removeLastRequest(HttpServletRequest request){
        request.getSession().removeAttribute("lastRequest");
    }
    
    private static void send(String emailAddress, String subject, String msg, String user, String password){
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(user, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress));
            message.setSubject(subject);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            System.out.println(e);
        }
    }
    
    public static void sendEmail(String toEmail, String newPassword) {
        String subject = "Subject test";
        String message = "New password is " + newPassword;
        Utils.send(toEmail, subject, message, "Phanvanthi315.1@gmail.com", "jfdrbyucuiwguela");
    }
}
