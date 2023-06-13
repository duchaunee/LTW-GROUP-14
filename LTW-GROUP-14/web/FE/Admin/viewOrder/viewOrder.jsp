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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Admin/viewOrder/viewOrder.css">
</head>

<body>
    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />

  <div class='admin_wrapper'>
    <div class="admin_main">
      <!-- /////////////////////////////////// TAB LEFT /////////////////////////////////////// -->
      <div class="admin_left">
        <div class="admin_leftInfo">
          <img class='' src="https://source.unsplash.com/random" alt="" />
          <span class=''>${user.name} </span>
        </div>
        <ul class='admin_leftTab'>

            <a href="/home" class='admin_leftItem'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-home"></i>
              <span class=''>Trở về trang chủ</span>
            </div>
          </a>

          <a href="/admin-statistics" class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-external-link-alt"></i>
              <span class=''>Thống kê cửa hàng</span>
            </div>
          </a>

          <a href="/manage-account"  class='admin_leftItem '>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-users"></i>
              <span class=''>Quản lý người dùng</span>
            </div>
          </a>

          <a href="/admin-viewproduct"  class='admin_leftItem '>
            <div class=''>
              <i class="fas fa-mountain"></i>
              <span class=''>Xem sản phẩm</span>
            </div>
          </a>
          <a href="/admin-addproduct"  class='admin_leftItem '>
            <div class=''>
              <i class="fas fa-plus"></i>
                <span class=''>Thêm sản phẩm</span>
            </div>
          </a>
          <a href="/admin-vieworder" class='admin_leftItem active'>
            <div class=''>
              <i class="fas fa-folder"></i>
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
        <div class="">
          <div class="view-order_wrapper">
            <div class="view-order_top">
                <div class='view-order_quantity'>
                  <p class=''>Tổng số lượng</p>
                  : ${totalProduct} đơn hàng
                </div>
                <form action="/admin-vieworder" method="POST" class="filterForm">
                    <input type='hidden' name='page' value='1'/>
                    <div class="">
                      <select class='view-order_status' name="filterBy" id="" onchange="submitForm('filterForm')">
                        <option key='0' value="" ${filterBy != null ? 'disabled' : ''}
                                  >Lọc đơn hàng theo</option>
                        <option key='1' value="Tất cả" 
                                ${filterBy.equals('Tất cả') ? 'selected' : ''}>Tất cả</option>
                        <option key='2' value="Đang xử lý"
                                ${filterBy.equals('Đang xử lý') ? 'selected' : ''}>Đang xử lý</option>
                        <option key='3' value="Vận chuyển"
                                ${filterBy.equals('Vận chuyển') ? 'selected' : ''}>Vận chuyển</option>
                        <option key='4' value="Đang giao"
                                ${filterBy.equals('Đang giao') ? 'selected' : ''}>Đang giao</option>
                        <option key='5' value="Hoàn thành"
                                ${filterBy.equals('Hoàn thành') ? 'selected' : ''}>Hoàn thành</option>
                        <option key='6' value="Đã hủy"
                                ${filterBy.equals('Đã hủy') ? 'selected' : ''}>Đã hủy</option>
                      </select>
                    </div>
                </form>
            <form action="/admin-vieworder" method="POST" class="sortForm">
                <input type='hidden' name='page' value='1'/>
              <div class="">
                <select class='view-order_date' name="sortBy" id="" onchange="submitForm('sortForm')">
                  <option key='0' value=""
                          ${sortBy != null  ? 'disabled' : ''}>Sắp xếp đơn hàng theo</option>
                  <option key='1' value="Mới nhất"
                          ${sortBy.equals('Mới nhất') ? 'selected' : ''}>Mới nhất</option>
                  <option key='2' value="Cũ nhất"
                          ${sortBy.equals('Cũ nhất') ? 'selected' : ''}>Cũ nhất</option>
                </select>
              </div>
            </form>
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
                  <!-- Mỗi 1 thẻ tr là 1 hàng -->
                  <c:forEach var="orderItem" items="${orderItemList}">
                  <tr class='view-order_item'>
                    <td class='name '>
                      <p class="">${orderItem.order.user.name}</p>
                    </td>
                    <td class='address'>
                      <span class='text-[16px] line-clamp-2'>${orderItem.order.orderAddress.address}</span>
                    </td>
                    <td class='phone'>
                      <p class="">${orderItem.order.orderAddress.phoneNumber}</p>
                    </td>
                    <td class='date'>
                      <p class="">${orderItem.order.displayOrderDate()}</p>
                    </td>
                    <td class='status'>
                      <!-- Nếu status là Đã hủy thì phải đổi color thành text-primary -->
                        <c:if test="${!orderItem.order.equals('Đã hủy')}">
                            <p>${orderItem.orderStatus}</p>
                        </c:if>
                        <c:if test="${orderItem.order.equals('Đã hủy')}">
                            <p style="color: var(--text-primary)">${orderItem.orderStatus}</p>
                        </c:if>
                    </td>
                    <td class='detail'>
                      <button class=''>
                          <a href="/view-orderdetail?id=${orderItem.id}" style="text-decoration: none; color: #fff">
                              Xem chi tiết</a>
                      </button>
                    </td>
                  </tr>
                  </c:forEach>

                </tbody>
              </table>
            </div>
          </div>
        </div>
        <ul class="pagination">
            <c:forEach begin="1" end="${totalPage}" var="i">
                <li style="color: var(--text-bgPrimary)">
                    <a href="admin-vieworder?page=${i}">${i}</a>
                </li>
            </c:forEach>
        </ul>
      </div>
    </div>
  </div>
    <script src="${pageContext.request.contextPath}/FE/Admin/viewOrder/viewOrder.js"></script> 
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />
</body>

</html>