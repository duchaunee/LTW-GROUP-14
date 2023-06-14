<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Info Account</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/infoAccount/infoAccount.css">
</head>

<body>
            <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" /> 

  <div class="infoAccount_wrapper">
    <div class="infoAccount_main">
      <div class="info-voucher">
        <span class='title'>Thông tin mã giảm giá</span>
        <button class='toggle-voucher'> Xem mã giảm giá hiện có</button>
        <div class="value-voucher">
          <table class=''>
            <thead class=''>
              <tr class=''>
                <td class="">Mã giảm giá</td>
                <td class="">Giá trị (VNĐ)</td>
              </tr>
            </thead>
            <tbody class=''>
              <!-- Mỗi 1 thẻ tr này là 1 hàng voucher -->
              <c:forEach items="${items}" var="p" varStatus="status">
                  <tr class="">
                    <td class="">${p.getName()}:</td>
                    <td class="">${String.format("%,d",p.getValue())}₫</td>
                  </tr>
              </c:forEach>

            </tbody>
          </table>
        </div>
      </div>
      <div style="height: .1875rem;
                  width: 100%;
                  background-position-x: -1.875rem;
                  background-size: 7.25rem .1875rem;
                  background-image: repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px);
                  margin: 32px 0;">
      </div>

      <form action="profile" method="post">
        <div class="info-account">
          <span class='info'>Thông tin tài khoản</span>

          <div class='avatar'>
            <p class='mb-2 font-bold block'>Ảnh hiển thị</p>
            <div class="image">
              <label class='' for="upload-avatar">
                <i class="fas fa-cloud-upload-alt"></i>
                <span class=''>Tải lên ảnh hiển thị</span>

                <!-- Khi src ảnh tải lên thì phải hiển thị ở đây và ẩn thẻ i + span bên trên đi -->
                <!-- <img class='' src="https://source.unsplash.com/random" alt="" /> -->
              </label>
              <input type="file" name=imgAvatar id=upload-avatar hidden />
            </div>
            <span class='title-sub '>Ảnh sẽ được tự động cắt theo hình tròn khi tải lên</span>
          </div>

          <p class="name">
            <label class='title' htmlFor="account_display_name">Tên hiển thị *</label>
            <input value='put your name here' name="name" class='' id='account_display_name'
              type="text" />
            <span class=''>Đây sẽ là cách mà tên của bạn sẽ
              được hiển thị trong phần tài khoản và trong phần đánh giá</span>
          </p>

          <p class="email">
            <label class='title'>Địa chỉ email *</label>
            <input name="email" autocomplete="off" placeholder="${user.getEmail()}" class=''
              type="text" />
            <span class=''>Bạn không thể thay đổi email</span>
          </p>
        </div>

        <!-- NẾU PROVIDER CỦA USER LÀ GOOGLE THÌ HIỂN THỊ CÁI NÀY RA, KHÔNG CHO PHÉP ĐỔI MẬT KHẨU -->
        <c:if test="${provider == 'google'}">
           <div class="changePass-google">
          <p class=''>Thay đổi mật khẩu</p>
          <span class=''>Bạn không thể thay đổi mật khẩu do đang đăng nhập bằng tài khoản
            Google</span>
          </div> 
        </c:if>
        <c:if test="${provider == 'email'}">
        <!-- CÒN NẾU PROVIDER CỦA USER LÀ EMAIL THÌ HIỂN THỊ CÁI NÀY RA => ĐƯỢC PHÉP ĐỔI MẬT KHẨU -->
        <div class="changePass-email">
          <span class='title'>Thay đổi mật khẩu</span>

          <p class="current-password">
            <label class='' for="current-password">Mật khẩu hiện
              tại</label>
            <input autocomplete="off" name="password" placeholder='Bỏ trống nếu không đổi' class=''
              id='current-password' type="password" />
          </p>

          <p class="new-password">
            <label class='' for="new-password">Mật khẩu mới</label>
            <input autocomplete="off" name="newPassword" placeholder='Bỏ trống nếu không đổi'
              class='' id='new-password' type="password" />
          </p>

          <p class="confirm-new-password">
            <label class='' for="confirm-new-password">Xác nhận mật khẩu mới</label>
            <input autocomplete="off" name="newPassword2" class='' id='confirm-new-password'
              type="password" />
          </p>
        </div>
        </c:if>
        <button type="submit" class='save-info'> Lưu thay đổi</button>
      </form>
    </div>
  </div>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />

  <script src="${pageContext.request.contextPath}/FE/infoAccount/infoAccount.js"></script>
</body>

</html>
