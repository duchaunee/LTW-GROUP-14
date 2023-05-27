<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoes Plus</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Footer/footer.css">
  </head>

  <body>

    <div class="footer">
      <div class="footer__wrapper">
        <div class="footer__wrapper--main">
          <div class="footer__item">
            <h3 class=''>Giới thiệu</h3>
            <div class=""></div>
            <ul class=''>
              Chào mừng bạn đến với ShoesPlus! Tại đây, mỗi một dòng chữ, mỗi chi tiết và hình
              ảnh đều là những bằng chứng mang dấu ấn lịch sử Converse 100 năm, và đang không ngừng
              phát triển lớn mạnh.
            </ul>
          </div>

          <div class="footer__item">
            <h3 class=''>Địa chỉ</h3>
            <div class=""></div>
            <ul class=''>
              <li class='footer__item--2'>
                <i class="fas fa-map-marker-alt"></i>
                <p>Km10, Đường Nguyễn Trãi, Hà Đông, Hà Nội</p>
              </li>
              <li class='footer__item--2'>
                <i class="fas fa-phone"></i>
                <p><a class='' href="tel:0912316304">0912316304</a>
                </p>
              </li>
              <li class='footer__item--2'>
                <i class="fas fa-envelope"></i>
                <p><a class='' href="mailto:ShoesPlus@gmail.com">ShoesPlus@gmail.com</a></p>
              </li>
              <li class='footer__item--2'>
                <i class="fab fa-twitter"></i>
                <p><a class='' href="skype:ShoesPlus?chat">ShoesPlus</a></p>
              </li>
            </ul>
          </div>

          <div class="footer__item">
            <h3 class=''>Menu</h3>
            <div class=""></div>
            <ul class="footer__item--grid">
              <!--            <li class="footer__item--3"> 
                          
                          </li>-->
            </ul>
          </div>

          <div class="footer__item">
            <h3 class=''>Mạng xã hội</h3>
            <div class=""></div>
            <ul class='footer__item-4'>
              <a href="https://fb.com/duchaudeyy" target="_blank" class=''
                 style='background-color: #3a589d'>
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="https://fb.com/duchaudeyy" target="_blank" class=''
                 style='background-color: #3b6995'>
                <i class="fab fa-instagram"></i>
              </a>
              <a href="https://fb.com/duchaudeyy" target="_blank" class=''
                 style='background-color: #2478ba'>
                <i class="fab fa-twitter"></i>
              </a>
              <a href="https://fb.com/duchaudeyy" target="_blank" class=''
                 style='background-color: #ff0303'>
                <i class="fab fa-youtube"></i>
              </a>
            </ul>
          </div>

        </div>
      </div>
      <div class="footer__cre">
        <p class=''>
          © Bản quyền thuộc về <a class='' href="https://fb.com/duchaudeyy">
            ShoesPlus</a>
        </p>
      </div>
    </div>
    <!--  <div class="footer">
      </div>-->

    <script src="${pageContext.request.contextPath}/FE/Footer/footer.js"></script>
  </body>

</html>
