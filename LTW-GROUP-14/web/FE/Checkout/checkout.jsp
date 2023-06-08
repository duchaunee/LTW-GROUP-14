<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Check out</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Checkout/checkout.css">
</head>

<body>
  <div class="checkout_wrapper">
    <div class="checkout_main">
      <div class="checkout_body">
          <div class="voucher">
                <div class="title">
                  <i class="fas fa-tags"></i>
                  <p class=''>Phiếu ưu đãi</p>
                </div>
                <form action="CheckoutController" method="post">
                  <input class="voucher-input" placeholder="Mã ưu đãi" type="text" name="voucherCode" id="voucherCode" />
                  <button class="voucher-apply-btn" type="submit">Áp dụng</button>
                </form>
              </div>
          <form action="CheckoutSuccessController" method="post">
        <div class="checkout">
     
          <div class='checkout-child'>
            <!-- left  -->
            <div class="checkout-left">
              <h1 class='title '>Thông tin thanh toán</h1>
              <div class="info">
                <p class="name">
                  <label for="account_display_name">Tên hiển thị *</label>
                    <input placeholder=${name} name="name" class='' id='account_display_name' type="text" />

                  <span class=''>Để thay đổi tên, hãy vào "Thông tin tài khoản"</span>
                </p>

                <p class="email">
                  <label class=''>Địa chỉ email *</label>
                  <!-- Đổi placeholder bằng email ng dùng ở đây -->
                  <input name="email" autoComplete="off" placeholder=${email} class=''
                    type="text" />
                  <span class=''>Bạn không thể thay đổi email </span>
                </p>

                <p class="city">
                  <label class=''>Tỉnh / Thành phố *</label>
                  <input name="city" autoComplete="off" required
                    placeholder="Nhập vào tỉnh/ thành phố" class='' type="text" />
                </p>

                <p class="district">
                  <label class=''>Quận / Huyện *</label>
                  <input name="district" autoComplete="off" required
                    placeholder="Nhập vào quận/ huyện" class='' type="text" />
                </p>

                <p class="wards">
                  <label class=''>Phường / Xã *</label>
                  <input name="wards" autoComplete="off" required placeholder="Nhập vào phường/ xã"
                    class='' type="text" />
                </p>

                <p class="address">
                  <label class=''>Địa chỉ cụ thể *</label>
                  <input name="address" autoComplete="off" required
                    placeholder="Nhập vào địa chỉ nhà cụ thể" class='' type="text" />
                </p>

                <p class="phone">
                  <label class=''>Số điện thoại *</label>
                  <input name="phoneNumber" autoComplete="off" required
                    placeholder="Nhập vào số điện thoại liên hệ" class='' type="number" />
                </p>

                <p class="note">
                  <label class=''>Ghi chú đơn hàng (tùy chọn)</label>
                  <textarea name="note" autoComplete="off" cols='30' rows='5'
                    placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."
                    class='' type="text"></textarea>
                </p>
              </div>
            </div>
            <!-- right  -->
            <div class="checkout-right">
              <div class="title ">
                <h1 class=''>Đơn hàng của bạn</h1>
                <div class="">
                  <h2 class=''>Sản phẩm</h2>
                  <h2 class=''>Tổng</h2>
                </div>
              </div>

              <!-- Mỗi 1 thẻ div class="product" là 1 sản phẩm hiển thị -->
              <c:forEach items="${items}" var="p">
                <div class="product">
                  <h2 class='name'>${p.getProduct().getName()}
                    <strong class='quantity'>× ${p.getQuantity()}</strong>
                  </h2>
                  <span class='price'>${String.format("%,d",Integer.parseInt(p.getProduct().getPrice().replace('.','')) * p.getQuantity())} ₫</span>
                </div>
              </c:forEach>

              <div class='total'>
                  <c:set var="sum" value="0" />
                <c:forEach items="${items}" var="p">
                  <c:set var="price" value="${p.getProduct().getPrice().replace('.','')}"/>
                  <c:set var="quantity" value="${p.getQuantity()}"/>
                  <c:set var="total" value="${price * quantity}"/>
                  <c:set var="sum" value="${sum + total}"/>
                </c:forEach>
                <h2 class=''>Tổng phụ</h2>
                <span class=''>${String.format("%,d",sum)} ₫</span>
              </div>

              <div class='delivery '>
                <h2 class=''>Giao hàng</h2>
                <div class="">
                  <p class=''>
                    Phí giao hàng toàn quốc: <span class=''>30,000 ₫</span>
                  </p>
                </div>
              </div>

              <div class='discount'>
                <h2 class=''>Giảm giá từ shop:</h2>
                <span class=''>${String.format("%,d",discount)} ₫</span>
              </div>

              <div class='totalPayment'>
                <h2 class=''>Tổng thanh toán</h2>
                <span class=''>
                  <!-- totalPayment + deliveryFee - discount -->
                  ${String.format("%,d",Math.max(sum+30000-discount,0))}₫ ₫
                </span>
              </div>
             <input type="hidden" name="cartId" value="${id}" />
             <input type="hidden" name="discount" value="${discount}" />
             <input type="hidden" name="total" value="${Math.max(sum+30000-discount,0)}" />
              
              <div class='method'>
                <div class="">
                  <div class="cash ">
                    <input value="cash" type="radio" name="paymentMethod" id="checkbox-1" checked />
                    <label for='checkbox-1' class=''>Trả tiền mặt khi nhận hàng</label>
                  </div>
                  <div class="bank ">
                    <input value='bank' type="radio" name="paymentMethod" id="checkbox-2" />
                    <label for='checkbox-2' class=''>Chuyển khoản ngân hàng</label>
                  </div>
                </div>
                <button class=''>Đặt hàng</button>
              </div>
            </div>
            
          </div>
            
        </div>
         </form>
      </div>
    </div>
  </div>
</body>

</html>
