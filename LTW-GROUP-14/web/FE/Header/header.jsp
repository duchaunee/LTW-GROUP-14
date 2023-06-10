<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Header/header.css">
  </head>
  
  <style>
  .header__logo--icon {
    background-image: url("${pageContext.request.contextPath}/resources/imgPublic/logo.png");
  }
</style>


  <body>
    <div class="header">
      <div class='header__inner'></div>
      <header class='header__wrapper'>
        <div class="header__main--1">
          <div class="header__main--2">
            <div class='header__left'>
                <c:if test="${user == null}">
                    <a href="/login" class='header__left--text'>
                      Đăng nhập / Đăng ký
                    </a>
                </c:if>
                <c:if test="${user != null}">
                    <a href="/profile" class='header__left--text'>
                        Tài khoản: ${user.name}
                    </a>
                </c:if>
            </div>

            <a href="#" class="header__logo">
              <div class="header__logo--icon"></div>
            </a>

            <div class="header__right">
                <div class="header__right--search">
                    <i class="fas fa-search"></i>
                </div>
                <div class="header__right--text">
                    <c:if test="${!user.role.equals('ADMIN')}">
                        <a href="/cart" class="header__right--text">
                        Giỏ hàng / Thanh toán
                        </a>
                        <span class="header__right--cart">
                            <i class="fas fa-shopping-cart"></i>
                        </span>
                    </c:if>
                        <c:if test="${user.role.equals('ADMIN')}">
                        <a href="/admin-vieworder" class="header__right--text">
                            Quản lý
                        </a>
                    </c:if>
                </div>
            </div>
          </div>
        </div>
        <div class="header__nav--wrapper">
          <div class="header__nav--main">
            <ul class="header__nav--list">

<!--               <a class='header__nav--item'>
                <div class=''>
                  Giày nam
                </div>
              </a> -->
<!--              {navData.map((nav) => (
              <Nav key={nav.name} name={nav.name} to={nav.to} />
              ))} -->
            </ul>
          </div>
        </div>
      </header>
    </div>

    <!--  <div class="header">
      </div>-->

  <script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
  </body>

</html>
