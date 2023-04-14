
<%@page import="java.util.List"%>
<%@page import="entity.Shoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
    </head>
    <body>
        <h1>Danh sách sản phẩm</h1>
        <div>
            <table border="1">
                <tr>
                    <td>Tên</td>
                    <td>Giá</td>
                    <td>Ảnh</td>
                </tr>
                <%
                    List<Shoes> listP = (List<Shoes>) request.getAttribute("listShoes");
                    for (Shoes p : listP) {
                %>
                <tr>
                    <td><%= p.getName()%></td>
                    <td><%= p.getPrice()%></td>
                    <td><img src="<%= p.getImage()%>" alt="Ảnh gi"/></td>
                </tr>
                <%

                    }
                %>

            </table>
        </div>
    </body>
</html>
