<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" name="username"><br>
            <input type="password" name="password"><br>
            <button type="submid">Đăng nhập</button>
        </form>
        ${message}
    </body>
</html>
