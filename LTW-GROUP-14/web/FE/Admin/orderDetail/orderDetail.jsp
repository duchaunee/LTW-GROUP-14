<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Order</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Admin/orderDetail/orderDetail.css">
</head>

<body>
    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />

  <div class='admin_wrapper'>
    <div class="admin_main">
      <!-- /////////////////////////////////// TAB LEFT /////////////////////////////////////// -->
      <div class="admin_left">
        <div class="admin_leftInfo">
          <img class='' src="https://source.unsplash.com/random" alt="" />
          <span class=''>${global} </span>
        </div>
        <ul class='admin_leftTab'>

            <a href="/HomeMainController" style="text-decoration: none; color: black;" class='admin_leftItem'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-home"></i>
              <span class=''>Trở về trang chủ</span>
            </div>
          </a>

          <a class='admin_leftItem '>
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

          <a class='admin_leftItem '>
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
      <!-- TẤT CẢ CHỈ KHÁC NHAU CÁI RIGHT THÔI NHÉ -->
      <div class="admin_right">
        <div class='order-detail_wrapper'>
          <!-- top  -->
          <div class="order-detail_top">
            <!-- chi tiet don hang -->
            <div class="order-detail_orderDetail">
              <h1 class='title'>
                Chi tiết đơn hàng
                <div class="">
                  <p class="">${orderItem.orderStatus}</p>
                </div>
              </h1>
              <div class="line"></div>
              <div class="order-detail_product">
                <div class="title">
                  <h2 class=''>Sản phẩm</h2>
                  <h2 class=''>Tổng</h2>
                </div>
                <div class="info-product">
                  <div class="">
                    <a class='img'>
                      <img class="h-[80px] object-cover" src="/productImage?imgId=${orderItem.product.image_id}&number=0"
                        alt="" />
                    </a>
                    <div class="info">
                      <div class="name">
                        <a class=''>
                          ${orderItem.product.name}
                        </a>
                        <p class=''> ×${orderItem.quantity}</p>
                      </div>
                      <div class="category ">
                        <p class="">Phân loại hàng:</p>
                        ${orderItem.product.category} | ${orderItem.product.brand}
                        <!-- Category | Brand -->
                      </div>
                      <div class="date">
                        7 ngày trả hàng
                      </div>
                    </div>
                  </div>
                </div>
                <div class="info-date ">
                  <h2 class=''>Thời gian đặt hàng</h2>
                  <h2 class="">
                    ${orderItem.order.displayOrderTime()}
                    <!-- date | time -->
                  </h2>
                </div>
                <div class="info-price ">
                  <h2 class=''>Tổng phụ</h2>
                  <h2 class="">
                    ${orderItem.displayAmount()}
                  </h2>
                </div>
                <div class="info-deliveryFee ">
                  <h2 class=''>Giao hàng</h2>
                  <h2 class=''>
                    ${orderItem.order.displayDeliveryfee()}
                  </h2>
                </div>
                <div class="info-discount ">
                  <h2 class=''>Giảm giá từ shop</h2>
                  <h2 class=''>
                    ${orderItem.displayDiscount()}
                  </h2>
                </div>
                <div class="info-method ">
                  <h2 class=''>Phương thức thanh toán</h2>
                  <h2 class=''>
                    <c:if test="${orderItem.order.orderAddress.paymentMethod.equals('cash')}">
                        Trả tiền mặt khi nhận hàng
                    </c:if>
                    <c:if test="${orderItem.order.orderAddress.paymentMethod.equals('bank')}">
                        Chuyển khoản ngân hàng
                    </c:if>
                  </h2>
                </div>
                <div class="info-total ">
                  <h2 class=''>Tổng cộng</h2>
                  <h2 class=''>
                    <!-- price + deliveryFee - discount -->
                    ${orderItem.displayTotal()}
                  </h2>
                </div>
              </div>
            </div>
            <!-- thong tin khach hang -->
            <div class="order-detail_userDetail">
              <h1 class=''>Thông tin khách
                hàng</h1>
              <div class="line"></div>
              <div class="title">
                <h2 class=''>Thông tin</h2>
                <h2 class=''>Cụ thể</h2>
              </div>
              <div class="order-detail_user">
                <div class="info-user">
                  <div class="">
                    <a class='img'>
                      <img class="" src="https://source.unsplash.com/random" alt="" />
                    </a>
                    <div class="info">
                      <div class="">
                        <div class='name '>
                          <p class="">Họ tên:</p>${orderItem.order.user.name}
                        </div>
                        <p class="email">Email:</p>
                        <p class='email-value'>${orderItem.order.user.email}</p>
                      </div>
                      <div class="member">
                        Thành viên của ShoesPlus
                      </div>
                    </div>
                  </div>
                </div>
                <!-- <div
                    class="flex justify-between text-[14px] py-2 border border-transparent border-b-[#ddd]">
                    <h2 class=''>Thời gian đặt hàng</h2>
                      <h2 class={`${loading && 'w-[100px]' } font-bold inline-block
                        text-[14px]`}>
                        {(order && `${order.orderDate} | ${order.orderTime}`) || '25 tháng 4
                        năm 2002'}
                      </h2>
                  </div> -->
                <div class="info-city">
                  <h2 class=''>Tỉnh / Thành phố</h2>
                  <h2 class=' '>${orderItem.order.orderAddress.city}</h2>
                </div>
                <div class="info-district">
                  <h2 class=''>Quận / Huyện </h2>
                  <h2 class=''>${orderItem.order.orderAddress.district}</ </h2>
                </div>
                <div class="info-wards">
                  <h2 class=''>Phường / Xã</h2>
                  <h2 class=''>${orderItem.order.orderAddress.ward}</</h2>
                </div>
                <div class="info-address">
                  <h2 class=''>Địa chỉ cụ thể </h2>
                  <h2 class=' '>${orderItem.order.orderAddress.address}</ </h2>
                </div>
                <div class="info-phone">
                  <h2 class=''>Số điện thoại </h2>
                  <h2 class=' '>${orderItem.order.orderAddress.phoneNumber}</ </h2>
                </div>
                <div class="info-note">
                  <h2 class=''>Ghi chú </h2>
                  <h2 class=' '>
                    ${orderItem.order.orderAddress.note}
                    <!-- Khi không có ghi chú (kiểm tra điều kiện) thì hiện lên thẻ p bên dưới -->
                    <!-- <p class={`${loading || 'italic' }`}>Không có ghi chú</p>} -->
                  </h2>
                </div>
              </div>
            </div>
          </div>

          <!-- đây là thanh line loot từ shopee :v -->
          <div style="height: .1875rem;
                  width: 100%;
                  background-position-x: -1.875rem;
                  background-size: 7.25rem .1875rem;
                  background-image: repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px);
                  margin: 16px 0;">
          </div>

          <!-- bottom -->
          <div class="">
            <form action="/view-orderdetail" class="order-detail_bottom" method="post">
              <!-- Nếu đơn hàng 'Hoàn thành' || 'Đã hủy'  thì không được phép ấn vào các butotn -->
              <!-- onClick={(e)=> {
              e.preventDefault()
              if (order.orderStatus === 'Hoàn thành') {
              toast.error('Đơn hàng đã hoàn thành, không thể cập nhật', {
              autoClose: 1200
              })
              }
              else if (order.orderStatus === 'Đã hủy') {
              toast.error('Đơn hàng đã bị hủy, không thể cập nhật', {
              autoClose: 1200
              })
              }
              else setActiveStatus(item)
              }} -->

              <div class="button-status_wrapper">
                <input type="hidden" name="id" value="${orderItem.id}">
                <input type="hidden" value="${orderItem.orderStatus}" name="statusActive"/>
                <c:forEach var="status" items="${statusList}">
                    <c:if test="${orderItem.orderStatus.equals(status)}">
                        <button type="button" class="status active">${status}</button>
                    </c:if>
                    <c:if test="${!orderItem.orderStatus.equals(status)}">
                        <button type="button" class="status">${status}</button>
                    </c:if>
                </c:forEach>
                <!-- lí do có thêm button "trống" này để chừa chỗ có button cuối "Cập nhật trình trạng" -->
                <button type="button" value="" class=""></button>
              </div>

              <!-- Cái butotn cuối này phải xử lý Nếu đơn hàng 'Hoàn thành' || 'Đã hủy'  thì không được phép cập nhật đơn hàng-->
              <!-- onClick={(e)=> {
                        e.preventDefault()
                        console.log(activeStatus);
                        if (order.orderStatus === 'Hoàn thành') {
                        toast.error('Đơn hàng đã hoàn thành, không thể cập nhật', {
                        autoClose: 1200
                        })
                        }
                        else if (order.orderStatus === 'Đã hủy') {
                        toast.error('Đơn hàng đã bị hủy, không thể cập nhật', {
                        autoClose: 1200
                        })
                        }
                        else confirmUpdateStatus(e)
                        }} -->
              <button type="submit" class='button-changeStatus'>
                <span class=''>Cập nhật tình trạng</span>
              </button>
            </form>
          </div>
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
                  
    <!--<div style="width: 100%; height: 200px; background-color: red"></div>-->
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />


  <!-- <script src="./addProduct.js"></script> -->
  <script>
    const currentPosition = localStorage.getItem('prevLocation');
    if (currentPosition) window.scrollTo(0, currentPosition);

    document.addEventListener('scroll', () => {
      localStorage.setItem('prevLocation', window.scrollY);
    });
    const btnStatus = document.querySelectorAll('.button-status_wrapper .status');
    const inputStatus = document.querySelector('.button-status_wrapper input[name="statusActive"]');
    btnStatus.forEach(status => {
        status.addEventListener('click', () => {
            btnStatus.forEach(_status => _status.classList.remove('active'));
            status.classList.add('active');
            inputStatus.value = status.innerText;
            console.log(status.innerText)
        })
    })
    
  </script>
  
  
</body>

</html>