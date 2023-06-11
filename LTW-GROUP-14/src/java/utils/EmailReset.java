package utils;

public class EmailReset {
    public static String content = "<!DOCTYPE html>\n" +
                                    "<html lang=\"en\">\n" +
                                    "<body>\n" +
                                    "    <h>Bạn nhận được email này vì vừa có yêu cầu đặt lại mật khẩu</h>\n" +
                                    "    <form action=\"http://localhost:8080/confirm-reset-password\" method=\"post\">\n" +
                                    "        <input type=\"hidden\" name=\"email\" value=\"toEmail\">\n" +
                                    "        <input type=\"hidden\" name=\"password\" value=\"12345\">\n" +
                                    "        <h>Để xác nhận, vui lòng bấm vào đường dẫn sau </h  >\n" +
                                    "        <input type=\"submit\" value=\"Đặt lại mật khẩu mới\"/>\n" +
                                    "    </form>\n" +
                                    "    \n" +
                                    "</body>\n" +
                                    "</html>";
}