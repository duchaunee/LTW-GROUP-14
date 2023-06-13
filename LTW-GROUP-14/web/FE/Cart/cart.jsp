<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cart</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Cart/cart.css">
</head>

<body>
  <div class="cart_wrapper">
    <div class="cart_main">
      <div class="cart_body">
        <div class="cart" >

          <!-- ============ KHI GIỎ HÀNG TRỐNG ============ -->
          <c:if test="${empty items}">
          <div style=" box-shadow: 5px 10px 18px #988f8f; text-align: center;border: 1px solid #ddd;margin: auto; width: 400px;display: block;" class="w-full h-[480px] flex flex-col gap-7 items-center justify-center">
<!--            <div style={{ backgroundImage: "${pageContext.request.contextPath}/FE/imgPublic/emptyCart.png" }}
              class="w-[520px] h-[500px] bg-contain bg-no-repeat bg-center"></div>-->
              <img style="width:70%; margin: auto;" src="${pageContext.request.contextPath}/FE/imgPublic/emptyCart.png" alt="alt"/>
            <div style="color: red;font-size: 20px;font-weight: 500;margin-bottom: 10px"
              class='text-center text-[28px] font-bold text-bgPrimary font-mono leading-[32px] uppercase'>
              Giỏ hàng của bạn hiện đang trống
            </div>
            <NavLink to='/'
              class='bg-primary text-white px-4 py-3 hover:bg-[#a40206] transition-all ease-linear duration-[120ms]'>
              <FontAwesomeIcon class='mr-[6px]' icon={faLongArrowAltLeft} />
              <a href="/home" style="text-decoration: none; color: black; font-weight: 700;font-size: 20px" class='admin_leftItem'>
            <div class=''>
              <i style="font-size: 18px;" class="fas fa-home"></i>
              <span class=''>Trở về trang chủ</span>
            </div>
            </a>
            </NavLink>
          </div> 
          </c:if>  
          <c:if test="${!empty items}">
          <!-- LEFT-->
          <div class="cart-left">
            <table class=''>
              <thead>
                <tr class=''>
                  <td class='product'>Sản phẩm</td>
                  <td class='price'>Giá</td>
                  <td class='quantity'>Số lượng</td>
                  <td class='total'>Tổng</td>
                </tr>
              </thead>
              <tbody>
                <!-- Mỗi thẻ tr là 1 cart item -->
                <!-- Nhớ làm 1 cái hàm chuyển price dạng string 2800000 về dạng 2.800.000 rồi mới hiển thị ra giao diện nhé -->
                <c:forEach items="${items}" var="p" varStatus="status">
                  <tr class=''>
                    <td class='product'>
                      <form action="cart-deleteitem" method="post">
                        <button type="submit" class="delete" name="index" value="${p.getId()}">
                          <i class="fas fa-times"></i>
                        </button>
                      </form>
                      <img class='' src="/productImage?imgId=${p.getProduct().image_id}&number=0" alt="" />
                      <div class="info">
                        <span class=''>${p.getProduct().getName()}</span>
                        <span class=''>${p.getProduct().getBrand()}</span>
                      </div>
                    </td>
                    <td class='price'>
                      <span class='' id="price${status.index+1}">${String.format("%,d", p.getProduct().getPrice())}</span>
                      <p class=''>₫</p>
                    </td>
                    <td class='quantity'>
                        <form action="cart-decreasing" method="post">
                        <button type='submit' class='minus' name="index1" value="${p.getId()}">
                          <i class="fas fa-minus"></i>
                        </button>
                        </form>
                      <div class='number' id="product${status.index+1}">${p.getQuantity()} </div>
                      <form action="cart-increasing" method="post">
                        <button type="submit" class="plus" name="index2" value="${p.getId()}">
                          <i class="fas fa-plus"></i>
                        </button>
                      </form>
                    </td>
                    <td class='total'>
                      <p class='' id="total${status.index+1}">${String.format("%,d", p.getProduct().getPrice() * p.getQuantity())}</p>
                      <span class=''>₫</span>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <div class="action">
              <a href='/home' class='continue'>
                <i class="fas fa-long-arrow-alt-left"></i>
                <span class=''>Tiếp tục xem sản phẩm</span>
              </a>
              <form action="cart-delete" method="post">
                <button type="submit" class="update" name="id" value="${id}">
                  <span>Xóa giỏ hàng</span>
                </button>
              </form>
            </div>
          </div>
           
          <!-- RIGHT -->
          <div class="cart-right">
             <c:set var="sum" value="0" />
                <c:forEach items="${items}" var="p">
                  <c:set var="price" value="${p.getProduct().getPrice()}"/>
                  <c:set var="quantity" value="${p.getQuantity()}"/>
                  <c:set var="total" value="${price * quantity}"/>
                  <c:set var="sum" value="${sum + total}"/>
                </c:forEach>
            <div class="title">
              <h1 class=''>Tổng thanh toán</h1>
            </div>
            <div class='price'>
              <h2 class=''>Tổng phụ</h2>
              <h2 class='font-bold'>
                ${String.format("%,d",sum)}₫</h2>
            </div>
            <div class='deliveryFee'>
              <h2 class=''>Giao hàng</h2>
              <div class="">
                <!--  lấy 1% giá trị hàng  -->
                <p>Phí giao hàng toàn quốc:
                  <span class='delivery-value'>30,000₫</span>
                </p>
                <p class=''>Nhận hàng vào: <span class='date'>từ ${now} đến ${deli}</span></p>
              </div>
            </div>
            <div class='discount'>
              <h2 class=''>Giảm giá từ shop:</h2>
              <span class=''>0₫</span>
            </div>
            <div class='total '>
              <span class=''>Tổng thanh toán</span>
              <h2 class='font-bold'>
                <!-- totalPayment + deliveryFee - discount -->
                ${String.format("%,d",Math.max(sum+30000,0))}₫
              </h2>
            </div>
            <div class='btn-checkout'>
                <form action="checkout" method="post">
                  <button class='hover:brightness-90' type="submit">Tiến hành thanh toán</button>
                </form>
              </div>

          </div>
         </c:if>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/FE/Cart/cart.js"></script>
</body>

</html>
