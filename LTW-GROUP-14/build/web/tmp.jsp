<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <tr >
                <td>Tên</td>
                <td>Giá</td>
                <td>Ảnh</td>
            </tr>
  
            <c:forEach items="${listShoes}" var="s">
                <tr>
                    <td>
                       ${s.name}
                    </td>
                    <td>${s.price}</td>
                    <td><img src="${s.image}" alt="alt"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
