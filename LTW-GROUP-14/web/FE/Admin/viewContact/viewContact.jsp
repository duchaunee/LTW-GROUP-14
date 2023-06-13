<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Admin/viewContact/style.css">
    </head>
    <body>
        <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />
      <div class='admin_wrapper'>
    <div class="admin_main">
      <!-- /////////////////////////////////// TAB LEFT /////////////////////////////////////// -->
      <div class="admin_left">
        <div class="admin_leftInfo">
          <img class='' src="https://source.unsplash.com/random" alt="" />
          <span class=''>Your name here </span>
        </div>
        <ul class='admin_leftTab'>
            <a href="/home" style="text-decoration: none; color: black;" class='admin_leftItem'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-home"></i>
              <span class=''>Trở về trang chủ</span>
            </div>
          </a>
          <a href="/admin-statistics" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-external-link-alt"></i>
              <span class=''>Thống kê cửa hàng</span>
            </div>
          </a>
          <a href="/manage-account" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-users"></i>
              <span class=''>Quản lý người dùng</span>
            </div>
          </a>
          <a href="/admin-viewproduct" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i class="fas fa-mountain"></i>
              <span class=''>Xem sản phẩm</span>
            </div>
          </a>
          <a href="/admin-addproduct" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-plus"></i>
              <span class=''>Thêm sản phẩm</span>
            </div>
          </a>

          <a href="/admin-vieworder" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-folder"></i>
              <span class=''>Xem đơn đặt hàng</span>
            </div>
          </a>
           <a href="/admin-viewpreview" style="text-decoration: none; color: white;" class='admin_leftItem active'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-folder"></i>
              <span class=''>Xem đánh giá</span>
            </div>
          </a>
        </ul>
      </div>
      <!-- ///////////////////////////////////// RIGHT ///////////////////////////////////////// -->
      <!-- TẤT CẢ CHỈ KHÁC NHAU CÁI RIGHT THÔI NHÉ -->
      <div class="admin_right">
          <table style="display:flex;" border="1px solid black">
                <tr>                
                    <th style="width:18%; color: red;font-size: 20px ">HỌ VÀ TÊN</th>
                    <th style="width:18%; color: red;font-size: 20px ">EMAIL</th>
                    <th style="width:18%; color: red;font-size: 20px ">Số điện thoại</th>
                    <th style="width:18%; color: red;font-size: 20px ">Địa chỉ</th>
                    <th style="width:28%; color: red;font-size: 20px " >Đánh giá</th>
                </tr>
            <c:forEach items="${listS}" var="x">
                <tr>
                    <td style="width:18%; text-align: center;font-size: 15px ">${x.name}</td>
                    <td style="width:18%; text-align: center;font-size: 15px ">${x.email}</td>
                    <td style="width:18%; text-align: center;font-size: 15px ">${x.SDT}</td>
                    <td style="width:18%; text-align: center;font-size: 15px ">${x.adress}</td>
                    <td style="width:28%; text-align: center;font-size: 15px ">${x.cmt}</td> 
                </tr>
            </c:forEach>               
        </table>
        
      </div>
  </div>
                  </div>
       <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />
    </body>
</html>
