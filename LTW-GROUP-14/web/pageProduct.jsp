<%@page import="entity.Product"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoes Plus</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/imgPublic/logoTitle.png">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/FE/CSS/reset.css" />

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/FE/CSS/lineClamp.css" />

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/spinning/spinning.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/skeleton/skeleton.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/toast/toast.css" />

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/pageProduct.css" />
  </head>

  <style>
    .girlShoes__bot--right .pagination .pagination--left {
      display: flex;
      align-items: center;
      justify-content: center;
    }
  </style>

  <body>
    <div id="toasts" class="success">
      <input class="message top-left" value="Thêm sản phẩm thành công" hidden>
    </div>

    <% List<Product> list = (List<Product>) request.getAttribute("list"); %>
    <%--<% int totalPage = (int) request.getAttribute("totalPage"); %>--%>
    <% int currentPage = (int) request.getAttribute("currentPage");%>

    <%--<c:set var="list" value="${requestScope.list}"/>--%>
    <% int size = (int) request.getAttribute("size");%>
    <c:set var="totalPage" value="${requestScope.totalPage}"/>

    <!-- ================== pagination ==================-->
    <c:set var="num" value="3" /> <!-- mỗi 1 lần hiển thị 3 số trang: 1 2 3 || 4 5 6 ||.... -->

    <!-- Nếu totalPage = 6, num = 3 thì suy ra Totalround = 2 -->
    <!-- Nếu totalPage = 7, num = 3 thì suy ra Totalround = 3 -->
    <!-- check xem no dang o trang nao de them class "active" thui -->
    <!-- 
    ví dụ đang ở round = 1: thì (round - 1) * num + 1 -> round * num = 1 2 3
          đang ở round = 2: thì (round - 1) * num + 1 -> round * num = 4 5 6
    -->

    <!-- round hiện tại: 
    ====> Check xem currentPage thì đang ở round nào?
    Ví dụ currentPage = 1,2,3 thì ở round 1 (1,2,3 là set của num)
    Nếu num = 4 thì 1,2,3, 4 mới là round 1
    -->
    <c:set var="round" value="${currentPage % num == 0 ? (currentPage / num) : Integer.valueOf(currentPage / num) + 1}" />

    <!-- tổng số round -->
    <c:set var="totalRound" value="${totalPage % num == 0 ? (totalPage / num) : Integer.valueOf(totalPage / num) + 1}" />
    <!-- ================== pagination ================== -->


    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />
    <div class='girlShoes'>
      <div class="girlShoes__header">
        <div class="girlShoes__header--left">
          <a href='/' class=''>Trang chủ</a>
          <div class="">/</div>

          <c:if test="${brand == null || brand == 'default' || brand == 'all'}">
            <span class=''>${categoryUTF8}</span>
          </c:if>

          <!-- Nếu lọc theo brand thì ở title sẽ hiển thị thêm TÊN CỦA BRAND -->
          <c:if test="${brand != null && brand != 'default' && brand != 'all'}">
            <a href="/san-pham?category=${categoryQuery}">
              ${categoryUTF8}
            </a>
            <div class="">/</div>
            <span class=''>${brand}</span>
          </c:if>

        </div>
        <div class="girlShoes__header--right">
          <p class=''>
            <span class=''>Số lượng</span>: 
            <c:if test="${size < 10 && size != 0}"> ${String.format("%02d", size)} </c:if>
            <c:if test="${size >= 10 || size == 0}"> ${size} </c:if>
              sản phẩm
            <%--<%= String.format("%02d", size)%>--%> 
          </p>

<!-- ?category=${categoryQuery}&brand=${brand} -->
          <form action="/san-pham">
            <!--Lọc full-->
            <!-- ô input ấn này để truyền categoryQuery lại servlet -->
            <input value="${categoryQuery}" name="category" hidden/> 
            <input value="${brand}" name="brand" hidden/> 
            <input value="${from}" name="from" hidden/> 
            <input value="${to}" name="to" hidden/> 
            <select class='' name="order" id="order" onchange="this.form.submit()">
              <!--<option key='0' value="dèault">Sắp xếp theo</option>--> 
              <option ${order.equals("create_at desc") ? "selected" : ""} value="create_at desc">Thời gian: Mới nhất</option>
              <option ${order.equals("create_at asc") ? "selected" : ""} value="create_at asc">Thời gian: Cũ nhất</option>
              <option ${order.equals("price asc") ? "selected" : ""} value="price asc">Giá: Tăng dần</option>
              <option ${order.equals("price desc") ? "selected" : ""} value="price desc">Giá: Giảm dần</option>
              <option ${order.equals("name asc") ? "selected" : ""} value="name asc">Tên: A - Z</option>
              <option ${order.equals("name desc") ? "selected" : ""} value="name desc">Tên: Z - A</option>
            </select>
          </form>


          <!-- loc san pham theo brand KHONG CO "order" vi se loc theo TAT CA SAN PHAM  -->
          <form action="/san-pham">
            <!-- chỉ lọc brand -->
            <input value="${categoryQuery}" name="category" hidden/> 
            <!--<input value="${order}" name="order" hidden/>--> 
            <select class='' name="brand" id="brand" onchange="solveBrand()">
              <option name="brand" value="default">Lọc sản phẩm theo</option>
              <option ${brand.equals("all") ? "selected" : ""}  value="all">Tất cả sản phẩm</option>
              <option ${brand.equals("classic") ? "selected" : ""} value="classic">Classic</option>
              <option ${brand.equals("sunbaked") ? "selected" : ""} value="sunbaked">Sunbaked</option>
              <option ${brand.equals("chuck 07s") ? "selected" : ""} value="chuck 07s">Chuck 07S</option>
              <option ${brand.equals("one star") ? "selected" : ""} value="one star">One Star</option>
              <option ${brand.equals("psy kicks") ? "selected" : ""} value="psy kicks">PSY Kicks</option>
            </select>
          </form>
        </div>
      </div>

      <!-- bot  -->
      <div class="girlShoes__bot">
        <div class='girlShoes__bot--main'>
          <!-- {/* left */} -->
          <div class='girlShoes__bot--left'>
            <div class="w-full">

              <form action="/san-pham" class="girlShoes__bot--filter">
                <!-- lọc full -->
                <input value="${categoryQuery}" name="category" hidden/> 
                <input value="${order}" name="order" hidden/> 
                <input value="${brand}" name="brand" hidden/> 
                <p class=''>Khoảng giá</p>
                <div>
                  <div class="girlShoes__bot-range">
                    <label for='from' class=''>
                      Từ
                    </label>
                    <input class="" type="number" autoComplete="off" placeholder='VNĐ'
                           maxLength="8" id="from" name="from" oninput="solvePriceRange()"/>
                  </div>

                  <div class="girlShoes__bot--line"></div>

                  <div class="girlShoes__bot-range">
                    <label for='to' class=''>
                      Đến
                    </label>
                    <input class="" type="number" autoComplete="off" placeholder='VNĐ'
                           maxLength="8" id="to" name="to" oninput="solvePriceRange()"/>
                  </div>
                </div>

                <span class="">
                  <button onclick="thís.form.submit()" class="">Lọc</button>

                  <div class="line" style="
                       flex: 1 1 0%;
                       height: 2px;
                       background-color: var(--text-bgPrimary)"></div>

                  <div class=''>
                    Giá:
                    <c:if test="${from != null && !from.isEmpty()}">
                      <p class='fromText'>
                        <fmt:formatNumber value="${from}" pattern="#,##0" />₫
                      </p>
                    </c:if>
                    <c:if test="${from == null || from.isEmpty()}">
                      <p class='fromText'>VNÐ</p>
                    </c:if>

                    <span style='
                          width: 10px;
                          height: 2px;
                          background-color: #666;
                          font-weight: 700;
                          ' class=''></span>

                    <!--<p class='toText'>VNÐ</p>-->
                    <c:if test="${to != null && !to.isEmpty()}">
                      <p class='toText'>
                        <fmt:formatNumber value="${to}" pattern="#,##0" />₫
                      </p>
                    </c:if>
                    <c:if test="${to == null || to.isEmpty()}">
                      <p class='toText'>VNÐ</p>
                    </c:if>
                  </div>
                </span>
              </form>
              <!--  -->
              <div class="girlShoes__bot---newest">
                <p class=''>Sản phẩm</p> 
                <ul class="girlShoes__bot---newestList">

                  <c:forEach items="${listN}" var="p">
                    <li class='girlShoes__bot---newestItem'>
                      <div class="skeleton active"></div>
                      <a href="/san-pham-chi-tiet?id=${p.id}">
                        <img class='' src='/productImage?imgId=${p.image_id}&number=0' alt="" />
                      </a>
                      <div class="">
                        <a style="text-decoration: none;" href="/san-pham-chi-tiet?id=${p.id}" class='line-clamp-1'>
                          ${p.getName()}
                        </a>
                        <span class=''>
                          <fmt:formatNumber value="${p.getPrice()}" pattern="#,##0" />
                          <p class=''>₫</p>
                        </span>
                      </div>
                    </li>
                  </c:forEach>

                </ul>
              </div>
            </div>
          </div>

          <div class="girlShoes__bot--right">
            <div class='girlShoes__bot--productWrapper'>
              <c:forEach items="${list}" var = "product" varStatus="loop">
                <div class="girlShoes__bot--productList">
                  <div class='child'>
                    <div class="skeleton active"></div>
                    <div class='girlShoes__bot--productItem'>
                      <div class='girlShoes__bot--productItem img'>
                        <a href="/san-pham-chi-tiet?id=${product.id}" class=''>
                          <img draggable="false" class='' src='/productImage?imgId=${product.image_id}&number=0'
                               alt="" />
                        </a>
                      </div>
                      <div class="girlShoes__bot--productItem content">
                        <div class="girlShoes__bot--productItem name">
                          <a href="/san-pham-chi-tiet?id=${product.id}">${product.getName()}</a>
                        </div>
                        <div class="girlShoes__bot--productItem price">
                          <fmt:formatNumber value="${product.getPrice()}" pattern="#,##0" />
                          <p class=''>₫</p>
                        </div>
                        <div class='girlShoes__bot--productItem btn'>
                          <div class="mt-[10px]">
                            <button onclick="addToCart(${product.getId()}, ${loop.index})" class=''>
                              <div class="spinning"></div>
                              <a class="">
                                Thêm vào giỏ
                              </a>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div> 
                </div>
              </c:forEach>
            </div>

            <!-- pagination -->
            <!-- Xử lí nếu sản phẩm LỚN HƠN 1 trang thì mới hiển thị pagination -->
            <c:if test="${totalPage > 1}">
              <ol class="pagination">
                <!-- prev button: Chi hien neu nhu currentPage > 1 -->
                <li class="pagination--left">
                  <c:if test="${currentPage > 1}">
                    <a href="/san-pham?category=${categoryQuery}&order=${order}&brand=${brand}&from=${from}&to=${to}&page=${currentPage - 1}">
                      <i class="fas fa-long-arrow-alt-left"></i>
                      <span class="text-[16px]">Prev Page</span>
                    </a>
                  </c:if>
                </li>

                <!-- Từ round 2 thì mới hiện cái này -->
                <c:if test="${round > 1}">
                  <i style="margin: 0 -10px; color: #aaa;" class="fas fa-ellipsis-h"></i>
                </c:if>

                <div class="pagination-center">
                  <c:forEach begin="${(round - 1) * num + 1}" end="${round * num}" var="i">
                    <c:set var="active" value="${(i == currentPage) ? 'active' : ''}" />

                    <!-- Nếu số trang > totalPage thì hiển thị icon Ban thui -->
                    <c:if test="${i > totalPage}">
                      <li class=''>
                        <i class="fas fa-ban"></i>
                      </li>
                    </c:if>

                    <!-- Nếu số trang < totalPage thì hiển thị số -->
                    <c:if test="${i <= totalPage}">
                      <!-- 
                      2 cái c:if bên trong này 
                      để kiểm tra xử lý ví dụ đang ở trang 1 thì cái số 1 đó không có href, 
                      KHÔNG CHO NGƯỜI DÙNG BẤM VÀO TRANG HIỆN TẠI
                      -->
                      <c:if test="${i == currentPage}">
                        <a class="${active}">
                          ${Integer.valueOf(i)}
                        </a>
                      </c:if>

                      <c:if test="${i != currentPage}">
                        <a href="/san-pham?category=${categoryQuery}&order=${order}&brand=${brand}&from=${from}&to=${to}&page=${Integer.valueOf(i)}" class="${active}">
                          ${Integer.valueOf(i)}
                        </a>
                      </c:if>

                    </c:if>
                  </c:forEach>
                </div>

                <!-- round cuối thì không hiện cái này -->
                <c:if test="${round < totalRound}">
                  <i style="margin: 0 -10px; color: #aaa;" class="fas fa-ellipsis-h"></i>
                </c:if>

                <!-- next button: Chi hien neu nhu currentPage < totalPage -->
                <li class="pagination--right">
                  <c:if test="${currentPage < totalPage}">
                    <a href="/san-pham?category=${categoryQuery}&order=${order}&brand=${brand}&from=${from}&to=${to}&page=${currentPage + 1}">
                      <span class="text-[16px]">Next Page</span>
                      <i class="fas fa-long-arrow-alt-right"></i>
                    </a>
                  </c:if>
                </li>

              </ol>
            </c:if>

          </div>
        </div>
      </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />
    <!--<div class="footer"></div>-->

    <!--    <script>
          const allSkeleton = document.querySelectorAll('.skeleton');
    //      console.log('das')
          setTimeout(() => {
            allSkeleton.forEach(skeleton => skeleton.style.display = 'none')
          }, 2222);
        </script>-->

    <script defer src="${pageContext.request.contextPath}/resources/js/pageProduct.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/effect/spinning/spinning.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/effect/skeleton/skeleton.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/effect/toast/toast.js"></script>


      <!--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FE/Header/header.js"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FE/Footer/footer.js"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FE/GirlShoes/girlShoes.js"/>-->
  </body>
</html>