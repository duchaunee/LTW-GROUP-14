<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Client Management</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Admin/clientManagement/clientManagement.css">
  
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

          <a href="/manage-account" style="text-decoration: none; color: white" class='admin_leftItem active' >
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
        </ul>

      </div>
      <!-- ///////////////////////////////////// RIGHT ///////////////////////////////////////// -->
      <!-- TẤT CẢ CHỈ KHÁC NHAU CÁI RIGHT THÔI NHÉ -->
      <div class="admin_right">
        <div class="">
          <div class="admin_right-main">
            <div class="">
              <table class='user-info'>

              </table>
            </div>
            <!-- {loading && (
            <div class="w-full h-[350px]">
              <Spinning color='#1f2028' size='30px' />
            </div>
            )} -->
          </div>
          <!-- pagination -->
          <ol class="pagination">
            
            <div class="pagination-center">
                <c:forEach begin="1" end="${totalPage}" var="i">
                    <li>
                        <a href="manage-account?page=${i}" style="text-decoration: none">
                            <button class=''>${i}</button></a>
                    </li>
                </c:forEach>
            </div>
          </ol>
        </div>
        <!-- <Routes>
          <Route path='' element={<HomeAdmin />} />
          <Route path='home' element={<HomeAdmin />} />
          <Route path='view-users' element={<ViewUsers />} />
          <Route path='view-products' element={<ViewProducts />} />
          <Route path='add-product/:id' element={<AddProduct />} />
          <Route path='view-orders/:id' element={<ViewOrders />} />
        </Routes> -->
      </div>
    </div>
  </div>

  <!-- <script src="./addProduct.js"></script> -->
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />
    <script src="${pageContext.request.contextPath}/FE/Admin/clientManagement/clientManagement.js"></script>

</body>

</html>
