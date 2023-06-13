<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Statistics</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Admin/statistics/statistics.css">
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

          <a href="/admin-statistics" class='admin_leftItem active'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-external-link-alt"></i>
              <span class=''>Thống kê cửa hàng</span>
            </div>
          </a>

          <a href="/manage-account" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-users"></i>
              <span class=''>Quản lý người dùng</span>
            </div>
          </a>

            <a href="/admin-viewproduct" class='admin_leftItem '>
            <div class=''>
              <i class="fas fa-mountain"></i>
              <span class=''>Xem sản phẩm</span>
            </div>
          </a>

          <a href="/admin-addproduct" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-plus"></i>
              <span class=''>Thêm sản phẩm</span>
            </div>
          </a>

          <a href="/admin-vieworder" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-folder"></i>
              <span class=''>Xem đơn đặt hàng</span>
            </div>
          </a>
          <a href="/admin-viewpreview" style="text-decoration: none; color: black;" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-folder"></i>
              <span class=''>Xem đánh giá</span>
            </div>
          </a>
          <!-- <NavActive to='home' icon={faHome} text='Thống kê' />
          <NavActive to='view-users' icon={faUsers} iconSize='text-[18px]' text='Quản lý khách hàng' />
          <NavActive to='view-products' icon={faMountain} iconSize='text-[22px]' text='Xem sản phẩm' />
          <NavActive to='add-product/add' icon={faPlus} text='Thêm sản phẩm' />
          <NavActive to='view-orders/view' icon={faFolder} text='Xem đơn đặt hàng' /> -->
        </ul>

      </div>
      <!-- ///////////////////////////////////// RIGHT ///////////////////////////////////////// -->
      <div class="admin_right">
        <div class="add-product_right1">
          <div class="add-product_right2">
            <!-- item -->
            <div style="border-bottom-color: #f25a7f;" class="add-product_rightItem">
              <div style="background-color: #f25a7f" class="add-product_rightIcon">
                <i class="fas fa-user-plus"></i>
              </div>
              <div class="add-product_rightTxt">
                <p class="">23</p>
                <span class="">Khách hàng</span>
              </div>
            </div>

            <!-- item -->
            <div style="border-bottom-color: #5183cb;" class="add-product_rightItem ">
              <div style="background-color: #5183cb" class="add-product_rightIcon">
                <i class="fas fa-shopping-cart"></i>
              </div>
              <div class="add-product_rightTxt">
                <p class="">40</p>
                <span class=""> Tổng sản phẩm</span>
              </div>
            </div>

            <!-- item -->
            <div style="border-bottom-color: #fb963a;" class="add-product_rightItem">
              <div style="background-color: #fb963a" class="add-product_rightIcon ">
                <i class="fas fa-truck"></i>
              </div>
              <div class="add-product_rightTxt">
                <p class="">123</p>
                <span class="">Đơn đặt hàng</span>
              </div>
            </div>

            <!-- item -->
            <div style="border-bottom-color: #fe5c3a;" class="add-product_rightItem">
              <div style="background-color: #fe5c3a" class="add-product_rightIcon">
                <i class="fas fa-dollar-sign"></i>
              </div>
              <div class="add-product_rightTxt">
                <p class="">3.432.232</p>
                <span class="">Tổng doanh thu (VNĐ)</span>
              </div>
            </div>
          </div>
          <div class="w-full bg-red-600 flex-1 rounded-[12px]"></div>
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
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />

  <!-- <script src="./addProduct.js"></script> -->
</body>

</html>
