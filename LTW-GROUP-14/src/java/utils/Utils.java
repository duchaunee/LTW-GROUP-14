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
        return request.getSession().getAttribute("lastRequest").toString();
    }
    
    public static void removeLastRequest(HttpServletRequest request){
        request.getSession().removeAttribute("lastRequest");
    }
}
