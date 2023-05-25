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
    <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Admin/viewOrder/viewOrder.css">
</head>

<body>
  <div class='admin_wrapper'>
    <div class="admin_main">
      <!-- /////////////////////////////////// TAB LEFT /////////////////////////////////////// -->
      <div class="admin_left">
        <div class="admin_leftInfo">
          <img class='' src="https://source.unsplash.com/random" alt="" />
          <span class=''>Your name here </span>
        </div>
        <ul class='admin_leftTab'>

          <a class='admin_leftItem'>
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

          <a class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-users"></i>
              <span class=''>Quản lý người dùng</span>
            </div>
          </a>

          <a class='admin_leftItem '>
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

          <a class='admin_leftItem active'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-folder"></i>
              <span class=''>Xem đơn đặt hàng</span>
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
        <div class="">
          <div class="view-order_wrapper">
            <div class="view-order_top">
              <div class='view-order_quantity'>
                <p class=''>Số lượng</p>
                : ${size} orders
              </div>
              <div class="">
                    <select class="view-order_status" name="sort" onchange="javascript:document.form1.submit();">
                        <option key="0" value="default">Lọc đơn hàng theo</option>
                        <option key="1" value="all">Tất cả</option>
                        <option key="2" value="Đang xử lý">Đang xử lý</option>
                        <option key="3" value="Vận chuyển">Vận chuyển</option>
                        <option key="4" value="Đang giao">Đang giao</option>
                        <option key="5" value="Hoàn thành">Hoàn thành</option>
                        <option key="6" value="Đã hủy">Đã hủy</option>
                    </select>
                </div>

                <div class="">
                    <select class="view-order_date" name="sort-by" onchange="javascript:document.form1.submit();">
                        <option key="0" value="default">Sắp xếp đơn hàng theo</option>
                        <option key="1" value="latest">Mới nhất</option>
                        <option key="2" value="oldest">Cũ nhất</option>
                    </select>
                </div>
            </div>
            <div class="view-order_bottom">
              <table class=''>
                <thead>
                  <tr class="">
                    <td class='name'>Họ tên</td>
                    <td class='address'>Địa chỉ</td>
                    <td class='phone'>SĐT</td>
                    <td class='date'>Ngày đặt</td>
                    <td class='status'>Tình trạng</td>
                    <td class='action'>Hành động</td>
                  </tr>
                </thead>
                <!-- style={{ height: `${loading ? '0' : itemsPerPage * 70 + 20}px` }} -->
                <tbody>
                  <c:forEach items="${orderList}" var="p">
                <tr class='view-order_item'>
                  <td class='name'>
                    <span class=''>${p.getOrder().getUser().getName()}</span>
                  </td>
                  <td class='address'>
                    <span class=''>${p.getOrder().getOrderAddress().getAddress()}</span>
                  </td>
                  <td class='phone'>
                    <span class=''>${p.getOrder().getOrderAddress().getPhoneNumber()}</span>
                  </td>
                  <td class='date'>
                    <span class=''>${p.getOrder().getOrderTime()}</span>
                  </td>
                  <td class='status'>
                    <span class=''>${p.orderStatus}</span>
                  </td>
                  <td class='detail'>
                    <button class=''>
                        <span class=''>Xem chi tiết</span>
                      </button>
                  </td>
                </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- {loading && (
            <div class="w-full h-[350px]">
              <Spinning color='#1f2028' size='30px' />
            </div>
            )} -->
          </div>
          <ul class="pagination">
                <c:forEach begin="1" end="${page}" var="i">
                  <li>
                    <a href="admin-vieworder?index=${i}">${i}</a>
                  </li>
                </c:forEach>
          </ul>


          <!-- Pagination -->
          <!-- {!loading && allOrders.length !== 0 && (
            <div class="">
              <Pagination
                products={allOrdersSort}
                currentPage={currentPage}
                setCurrentPage={setCurrentPage}
                itemsPerPage={itemsPerPage}
                quantity={quantity}
                setPageProducts={setPageProducts} />
            </div>
          )} -->
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
  <script>
    const currentPosition = localStorage.getItem('prevLocation');
    if (currentPosition) window.scrollTo(0, currentPosition);

    document.addEventListener('scroll', () => {
      localStorage.setItem('prevLocation', window.scrollY);
    })
  </script>
</body>

</html>
