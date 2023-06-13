<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout Success</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/checkoutSuccess/checkoutSuccess.css">
</head>

<body>
  <div class="checkoutSuccess_wrapper">
    <div class="checkoutSuccess_main">
      <div class="checkoutSuccess_body">
        <!-- solve late -->
        <div class="w-full flex">
          <form class='checkoutSuccess'>
            <!-- left -->
            <div class="checkoutSuccess-left ">
              <div class="detail">
                <h1 class='title'>Chi tiết đơn hàng</h1>
                <div class="">
                  <div class="title-sub">
                    <h2 class=''>Sản phẩm</h2>
                    <h2 class=''>Tổng</h2>
                  </div>

                  <!-- Mỗi class product dưới đây là 1 sản phẩm -->
                  <c:forEach items="${items}" var="p">
                  <div class="product ">
                    <a class='info'>
                      ${p.getProduct().getName()}
                      <div class="line"></div>
                      <p class=''> ${String.format("%,d",p.getProduct().getPrice())} </p>
                      <strong class=''>× ${p.getQuantity()}</strong>
                    </a>
                    <h2 class='price'>${String.format("%,d",p.getProduct().getPrice() * p.getQuantity())} ₫</h2>
                  </div>
                  </c:forEach>
                  <c:set var="sum" value="0" />
                <c:forEach items="${items}" var="p">
                  <c:set var="price" value="${p.getProduct().getPrice()}"/>
                  <c:set var="quantity" value="${p.getQuantity()}"/>
                  <c:set var="total" value="${price * quantity}"/>
                  <c:set var="sum" value="${sum + total}"/>
                </c:forEach>
                  <div class="total">
                    <h2 class=''>Tổng phụ</h2>
                    <span class=''>${String.format("%,d",sum)} ₫</span>
                  </div>
                  <div class="delivery">
                    <h2 class=''>Giao hàng</h2>
                    <span class=''> 30,000 ₫ </span>
                  </div>
                  <div class="discount">
                    <h2 class=''>Giảm giá từ shop</h2>
                    <span class=''> ${String.format("%,d",discount)} ₫ </span>
                  </div>
                  <div class="method">
                    <h2 class=''>Phương thức thanh toán</h2>
                    <span class=''>
                      ${payment}
                      </sp>
                  </div>
                  <div class="totalPayment">
                    <h2 class=''>Tổng cộng</h2>
                    <span class=''>
                      <!-- totalPayment + deliveryFee - discount -->
                      ${String.format("%,d",Math.max(sum+30000-discount,0))} ₫
                    </span>
                  </div>
                </div>
              </div>
              <div class="address">
                <h1 class='title'>Địa chỉ giao hàng</h1>

                <div class="">

                  <div class="city ">
                    <h2 class=''>Tỉnh / Thành phố</h2>
                    <span class=''> ${city}</span>
                  </div>

                  <div class="district ">
                    <h2 class=''>Quận / Huyện</h2>
                    <span class=''>${district}</span>
                  </div>

                  <div class="wards ">
                    <h2 class=''>Phường / Xã</h2>
                    <span class=''> ${ward} </span>
                  </div>

                  <div class="address ">
                    <h2 class=''>Địa chỉ cụ thể</h2>
                    <span class=''> ${address}</span>
                  </div>

                  <div class="phone ">
                    <h2 class=''>Số điện thoại</h2>
                    <span class=''> ${phone} </sp>
                  </div>

                  <div class="note ">
                    <h2 class=''>Ghi chú</h2>
                    <span class=''>
                      ${note}
                      <!-- Mếu không có ghi chú thì hiện ra cái dưới -->
                      <!-- <p class='italic'>Không có ghi chú</p> -->
                    </span>
                  </div>

                </div>
              </div>
            </div>

            <!-- right  -->
            <div class='checkoutSuccess-right'>
              <strong class='title'>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đã được nhận</strong>
              <ul class='info'>

                <li class='date '>
                  <p class=''>Thời gian đặt hàng:</p>
                  <strong>${time}</strong>
                </li>

                <li class='name '>
                  <p class=''>Tên hiển thị:</p>
                  <strong>${name}</strong>
                </li>

                <li class='email '>
                  <p class=''>Email:</p>
                  <strong>${email}</strong>
                </li>

                <li class='total '>
                  <p class=''>Tổng cộng:</p>
                  <strong>
                    <!-- totalPayment + deliveryFee - discount -->
                    ${String.format("%,d",Math.max(sum+30000-discount,0))} ₫
                  </strong>
                </li>

                <li class='method '>
                  <p class=''>Phương thức thanh toán:</p>
                  <strong>
                    ${payment}
                    <!-- Chuyển khoản ngân hàng -->
                  </strong>
                </li>               
              </ul>
              <a href="/home" style="text-decoration: none;color: black;font-weight: 700; " class='admin_leftItem'>
                <div class=''>
                  <i style="font-size: 18px;" class="fas fa-home"></i>
                  <span class=''>Trở về trang chủ</span>
                </div>
                </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
                    
</body>

</html>
