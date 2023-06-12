<%-- 
    Document   : productDetail
    Created on : Jun 9, 2023, 7:42:10 PM
    Author     : DUC HAU
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/FE/CSS/reset.css" />

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/skeleton/skeleton.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/spinning/spinning.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/effect/toast/toast.css" />
    
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/productDetail.css" />

  </head>

  <style>

  </style>

  <body>

    <div id="toasts" class="success">
      <input class="message top-left" value="Thêm sản phẩm thành công" hidden>
    </div>

    <% Product product = (Product) request.getAttribute("product"); %>
    <% // String priceBefore = String.valueOf(Integer.parseInt(product.getPrice()) * 2); %>

    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />

    <!-- OVERLAY -->
    <div class="overlay-preview">
      <div class="overlay-product">
        <div class="overlay-prev">
          <i class="fas fa-arrow-left"></i>
        </div>
        <div class="overlay-main">
          <div class="overlay-close">
            <i class="fas fa-times"></i>
          </div>
          <div style="transform: translateX(-876px)" class="overlay-imgs">
            <img
              src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
              alt="">

            <img
              src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483504493women-sunbaked-1-1-600x384.jpg?alt=media&token=99d99c41-1fb4-401a-98f5-66c9e0f5097f"
              alt="">

            <img
              src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483506421women-sunbaked-1-2-600x384.jpg?alt=media&token=cd8287b2-cb87-4e2c-9cc5-259840f3a133"
              alt="">

            <img
              src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483508667women-sunbaked-1-3-600x384.jpg?alt=media&token=1e96cdce-c85d-48b3-97a1-7e932d49cc26"
              alt="">

            <img
              src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483510779women-sunbaked-1-4-600x384.jpg?alt=media&token=6a6dde63-fe27-4246-b7d3-761628d7a66f"
              alt="">
          </div>
        </div>
        <div class="overlay-next">
          <i class="fas fa-arrow-right"></i>
        </div>
      </div>
    </div>

    <div>
      <!-- top -->
      <div class="product-detail_top">
        <div class="product-detail_main">
          <div class="product-detail_body">
            <!-- left -->
            <div class="product-detail_topLeft">
              <div class="product-detail_imgShow">
                <div class="skeleton active"></div>

                <button class="btn-left">
                  <!-- <FontAwesomeIcon class='text-[36px]' icon={faChevronLeft} /> -->
                  <i style="font-size: 36px;" class="fas fa-chevron-left"></i>
                </button>

                <!-- Rải ảnh theo translate -->
                <!-- style={{ transform: `translateX(-${translateShowX}px)` }} -->
                <div class='show'>
                  <img
                    src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                    alt="">

                  <img
                    src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483504493women-sunbaked-1-1-600x384.jpg?alt=media&token=99d99c41-1fb4-401a-98f5-66c9e0f5097f"
                    alt="">

                  <img
                    src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483506421women-sunbaked-1-2-600x384.jpg?alt=media&token=cd8287b2-cb87-4e2c-9cc5-259840f3a133"
                    alt="">

                  <img
                    src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483508667women-sunbaked-1-3-600x384.jpg?alt=media&token=1e96cdce-c85d-48b3-97a1-7e932d49cc26"
                    alt="">

                  <img
                    src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680483510779women-sunbaked-1-4-600x384.jpg?alt=media&token=6a6dde63-fe27-4246-b7d3-761628d7a66f"
                    alt="">
                </div>


                <button class="btn-right">
                  <!-- <FontAwesomeIcon class='text-[36px]' icon={faChevronRight} /> -->
                  <i style="font-size: 36px;" class="fas fa-chevron-right"></i>
                </button>
              </div>

              <div class="product-detail_imgPreview">
                <!-- fix height cứng để slide nè, responsive cẩn thận nhé -->
                <div class="wrapper">
                  <!-- mỗi 1 thẻ div dưới đây là 1 img preview -->
                  <div class="imgPreview"> <!-- active: img1 -->
                    <div class="src_img">
                      <div class="skeleton active"></div>
                      <img class=""
                           src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                           alt="" />
                    </div>
                  </div>

                  <div class="imgPreview"> <!-- not active: img2 -->
                    <div class="src_img">
                      <div class="skeleton active"></div>
                      <img class=""
                           src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                           alt="" />
                    </div>
                  </div>

                  <div class="imgPreview"> <!-- not active: img3 -->
                    <div class="src_img">
                      <div class="skeleton active"></div>
                      <img class=""
                           src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                           alt="" />
                    </div>
                  </div>

                  <div class="imgPreview"> <!-- not active: img4 -->
                    <div class="src_img">
                      <div class="skeleton active"></div>
                      <img class=""
                           src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                           alt="" />
                    </div>
                  </div>

                  <div class="imgPreview"> <!-- not active: img5 -->
                    <div class="src_img">
                      <div class="skeleton active"></div>
                      <img class=""
                           src="https://firebasestorage.googleapis.com/v0/b/shoes-shopping-web.appspot.com/o/shoesPlus%2F1680530242587women-sunbaked-1-600x384.jpg?alt=media&token=e2189cac-9168-40e8-a1da-055fb9a99e63"
                           alt="" />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- right -->
            <div class="product-detail_topRight">

              <nav class=''>
                <div class="skeleton active"></div>
                <a href="/" class=''>Trang chủ</a>
                <span class="">/</span>
                <!-- /san-pham?category= -->
                <a href="" class=''>${product.category}</a>
              </nav>

              <div class="name">
                <div class="skeleton active"></div>
                <h1 class=''>${product.name}</h1>
              </div>

              <div class="rate">
                <div class="skeleton active"></div>
                <div class="star">
                  <i class="fas fa-star"></i>
                  <p class=''>4.5</p>
                </div>
                <div class="line"></div>
                <p class='quantity'>2 Đánh Giá</p>
              </div>

              <div class="price">
                <div class="skeleton active"></div>
                <!-- cái đề để tránh flex nó làm cho height tăng theo thằng con dài nhất mà mình chỉ
                  muốn nó py-1 theo font thui  -->
                <div class=""> <!-- thêm cái div ngoài để tránh flex dài bằng thằng con thôi -->
                  <div class="discount">
                    <!-- <FontAwesomeIcon class='text-[#6ab87e] text-[14px]' icon={faTags} /> -->
                    <i class="fas fa-tags"></i>
                    <p class=''>50%</p>
                  </div>
                </div>

                <p class="before-price">
                  <fmt:formatNumber value="${product.price * 2}" pattern="#,##0" />
                  <span class='text-[14px] align-top'>₫</span>
                </p>

                <p class="after-price">
                  <!-- {solvePrice(product.price)} -->
                  <fmt:formatNumber value="${product.price}" pattern="#,##0" />
                  <span class=''>₫</span>
                </p>
              </div>

              <div class="line_topRight" style="
                   width: 50px;
                   height: 2px;
                   margin: 10px 0;
                   background-color: rgba(0,0,0,0.2);
                   position: relative">
                <div class="skeleton active"></div>
              </div>

              <div class="shipping">
                <div class="skeleton active"></div>
                <span class="">
                  <p class=''>Vận chuyển</p>
                </span>
                <div class='delivery'>
                  <div class="">
                    <i class="fas fa-truck-moving"></i>
                    <p class=''>Miễn phí vận chuyển</p>
                  </div>
                  <span class=''>
                    Miễn phí vận chuyển cho đơn hàng trên 850.000₫
                  </span>
                </div>
              </div>

              <div class="select-quantity">
                <div class="skeleton active"></div>
                <div class="title">
                  <p class=''>Số lượng</p>
                </div>
                <!-- input -->
                <div class='input'>
                  <div class="input_main">
                    <button type='button' class='desc '>
                      <i class="fas fa-minus"></i>
                      <!-- <FontAwesomeIcon class='text-[24px] font-medium' icon={faMinus} /> -->
                    </button>
                    <!-- {quantity < 10 ? `0${quantity}` : quantity} -->
                    <div class='value'>01</div>
                    <!-- //chỉ đc set đến max số lượng tồn kho -->
                    <button type='button' class='asc'>
                      <i class="fas fa-plus"></i>
                      <!-- <FontAwesomeIcon class='text-[24px] font-medium' icon={faPlus} /> -->
                    </button>
                  </div>
                </div>

                <div class="inventory">
                  <div class=""></div>
                  <p class=''><span>${product.inventory}</span> sản phẩm có sẵn</p>
                </div>
              </div>
              <!-- {/* <div class="mb-[15px]">
                <p class='font-medium text-[18px] text-[#1b1b1b] mb-3'>
  
                </p>
              </div> */} -->

              <div class="addToCart">
                <div class="skeleton active"></div>
                <button onclick="addToCart(${product.id})" class=''>
                  <div class="spinning"></div>
                  <!-- <div class="flex gap-2 items-center justify-center">
                    <i class="fas fa-wrench"></i>
                    <FontAwesomeIcon class='text-[18px]' icon={faWrench} />
                    Sửa sản phẩm
                  </div> -->
                  <div class="">
                    <i class="fas fa-shopping-cart"></i>
                    <!-- <FontAwesomeIcon class='text-[18px]' icon={faCartShopping} /> -->
                    Thêm vào giỏ
                  </div>
                </button>
              </div>

              <div class="refun">
                <div class="skeleton active"></div>
                <p class="title">Quyền lợi khách hàng & Bảo hành</p>

                <div class="title-refun">
                  <i class="fas fa-check-circle"></i>
                  <!-- <FontAwesomeIcon class='text-[#6ab87e] text-[22px]' icon={faCircleCheck} /> -->
                  <p style="font-weight: 700;" class=''>Chính sách hoàn trả của ShoesPlus</p>
                </div>
                <p class='info-refun'>
                  Trả hàng hoàn tiền trong vòng 48 giờ cho các sản phẩm bị lỗi kỹ thuật, bể vỡ, không
                  đúng mô tả hoặc không đúng như đơn đặt hàng.
                </p>

                <div class="title-refun">
                  <i class="fas fa-check-circle"></i>
                  <!-- <FontAwesomeIcon class='text-[#6ab87e] text-[22px]' icon={faCircleCheck} /> -->
                  <p style="font-weight: 700;" class=''>Chính sách bảo hành của ShoesPlus</p>
                </div>
                <p class='info-refun'>
                  Bảo hành bao gồm các lỗi do nhà sản xuất như lỗi về chất liệu, lỗi thiết kế. Không
                  bao gồm các lỗi do sử dụng sai cách hoặc tai nạn gây ra.
                </p>
              </div>

            </div>
          </div>
        </div>
      </div>

      <!-- bottom  -->
      <div class="product-detail_bottom skeleton_active">
        <div class="">
          <!-- thong tin bo sung -->
          <div class="add-info">
            <div class="add-info_body">

              <div style="padding-bottom: 8px;" class="">
                <h1 class='title'>Thông tin bổ sung</h1>
              </div>

              <div style="
                   width: 50px;
                   height: 3px;
                   margin-top: 4px;
                   margin-bottom: 12px;
                   background-color: #DC2626;">
              </div>

              <div class="info">
                <div class="category">
                  <h1 class='main'>Danh mục</h1>
                  <p class='sub'>${product.category}</p>
                </div>

                <div class="classic">
                  <h1 class='main'>Thương hiệu</h1>
                  <p class='sub'>${product.brand}</p>
                </div>

                <div class="desc">
                  <h1 class='main'>Mô tả sản phẩm</h1>
                  <p class='sub'>
                    ${product.description}

                  </p>
                </div>
              </div>

            </div>
          </div>

          <!-- danh gia -->
          <div class="comment">
            <div class="">

              <div style="padding-bottom: 8px;">
                <h1 class='title'>Đánh giá sản phẩm</h1>
              </div>

              <div style="
                   width: 50px;
                   height: 3px;
                   margin: 8px 0;
                   background-color: #DC2626;">
              </div>

              <div class="user-comment_wrapper">
                <!-- no have comment -->
                <!-- {/* <div
                  class="w-full min-h-[200px] flex flex-col gap-4 items-center justify-center">
                  <img src="../../noHaveComment.png" alt="" />
                  <p class='text-[18px] font-medium opacity-75'>Chưa có đánh giá</p>
                </div> */} -->

                <!-- comment -->
                <!-- <div class="w-full flex flex-col gap-4 items-center justify-center">
                  <img class='' src="../../noHaveComment.png" alt="" />
                  <p class='text-[17px] text-center'>Hiện chưa có đánh giá nào</p>
                </div> -->

                <div class="here-is-wrapper-second">
                  <!-- Mỗi thẻ div là 1 người comment -->
                  <div class="user-comment">
                    <div class="avatar">
                      <!-- phải xử lí nếu nó không có avatar thì cho avatar mặc định -->
                      <img
                        src="https://scontent.fsgn2-8.fna.fbcdn.net/v/t39.30808-6/249261883_3143393982651534_6533103562518237249_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IHnDBPcRKQ8AX_GlfWP&_nc_ht=scontent.fsgn2-8.fna&oh=00_AfCP5nzAnqMBataMrGZe0Dm6-7tOSGiEGQkTp6PG8hAeXw&oe=6487B63A"
                        alt="" />
                    </div>

                    <div class="info">
                      <span class='name'>Đức Hậu</span>
                      <div class="star">
                        <!-- Truyền star vào đây rồi loop, vd star = 3 thì loop class full 3 lần -->
                        <i class="full fas fa-star"></i>
                        <i class="full fas fa-star"></i>
                        <i class="full fas fa-star"></i>
                        <i class="empty fas fa-star"></i>
                        <i class="empty fas fa-star"></i>
                      </div>
                      <div class="time">
                        10 Tháng 5, 2023 22:19:55 | Phân loại hàng: Giày nam
                      </div>
                      <div class="desc">Giày đẹp lắm nha shop ơiiiii</div>
                    </div>

                  </div>

                  <div class="user-comment">
                    <div class="avatar">
                      <!-- phải xử lí nếu nó không có avatar thì cho avatar mặc định -->
                      <img
                        src="https://scontent.fsgn2-8.fna.fbcdn.net/v/t39.30808-6/249261883_3143393982651534_6533103562518237249_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IHnDBPcRKQ8AX_GlfWP&_nc_ht=scontent.fsgn2-8.fna&oh=00_AfCP5nzAnqMBataMrGZe0Dm6-7tOSGiEGQkTp6PG8hAeXw&oe=6487B63A"
                        alt="" />
                    </div>

                    <div class="info">
                      <span class='name'>Đức Hậu</span>
                      <div class="star">
                        <!-- Truyền star vào đây rồi loop, vd star = 3 thì loop class full 3 lần -->
                        <i class="full fas fa-star"></i>
                        <i class="full fas fa-star"></i>
                        <i class="full fas fa-star"></i>
                        <i class="full fas fa-star"></i>
                        <i class="empty fas fa-star"></i>
                      </div>
                      <div class="time">
                        10 Tháng 5, 2023 22:19:55 | Phân loại hàng: Giày nam
                      </div>
                      <div class="desc">Giày đẹp lắm nha shop ơiiiii</div>
                    </div>

                  </div>
                </div>

              </div>

            </div>
          </div>

          <!-- sp tuong tu -->
          <div class="similar">
            <div class="similar_wrapper">

              <div class="title">
                <h1 class=''>Sản phẩm tương tự</h1>
              </div>

              <div style="
                   margin-left: 20px;
                   width: 50px;
                   height: 3px;
                   margin-top: 4px;
                   margin-bottom: 20px;
                   background-color: #DC2626;">
              </div>

              <div class="similar-products">
                <!-- icon left -->
                <!-- 240 là width của từng phần tử, nếu responsive thì thay đổi đi //tức là mỗi lần
                  nhấn thì sang trái 1 phần tử (240px)  -->

                <!-- ${hoverSimilarProduct ? 'w-[60px] h-[60px] shadow-shadowAuth'
                       : 'w-[46px] h-[46px] shadow-shadowAccount' } -->

                <div class="prev show">
                  <i style="font-size: 20px;" class="fas fa-arrow-left"></i>
                  <!-- <FontAwesomeIcon class='text-[20px]' icon={faArrowLeft} /> -->
                </div>

                <!-- main -->
                <div class="main">
                  <!-- transform: `translateX(-${translateX}px) -->
                  <div style="transform: translateX(-240px)" class="main_wrapper">
                    <!-- nếu trên điện thoại thì đổi w-1/5 thành w-1/3 hoặc w-1/2 nhé -->
                    <!-- Mỗi 1 similar-item là 1 sản phẩm -->
                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="/san-pham-chi-tiet?id=${1}" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic 1</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic2</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic3</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic4</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic5</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic6</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic7</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                    <div class="similar-item">
                      <div class="similar-item_sub">
                        <!-- ${width ? "" : 'w-full' } -->
                        <div class="similar-item_sub2">
                          <div class='img'>
                            <!-- to={`/san-pham/${id}`}> -->
                            <a href="" class=''>
                              <img draggable="false" class='' src="https://source.unsplash.com/random"
                                   alt="" />
                            </a>
                          </div>

                          <div class="info">
                            <div class="name">
                              <!-- to={`/san-pham/${id}`}> -->
                              <a href="">Chuck Taylor Classic8</a>
                            </div>
                            <div class="price">
                              1.250.000
                              <p class=''>₫</p>
                            </div>
                            <div class='submit'>
                              <div style="margin-top: 10px;"">
                                <button>Thêm vào giỏ</button>
                                <!-- <button class=" btn">Sửa sản phẩm</button> -->
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>
                      <!-- <Card width='w-full'>
                        <ProductItem product={item} id={item.id} img={item.imgURL} name={item.name}
                          price={solvePrice(item.price)} idURL={`san-pham/${id}`} //prevLink là id của
                          cái trang hiện tại chứa sp, chứ kp item.id nhé setLoadingPage={setLoading}
                          //top setIdxActive={setIdxActive} setHoverShowProduct={setHoverShowProduct}
                          setTranslateShowX={setTranslateShowX} //2 thằng set bên dưới là xử lí khi ấn
                          vào 1 sp ở similar Products qua sp đó rùi, nhưng nếu không set về 0 và về
                          false thì qua sp mới nó vẫn bị như lúc cũ, bỏ ra chạy thử là biết
                          setTranslateX={setTranslateX}
                          setHoverSimilarProduct={setHoverSimilarProduct} text={admin ? 'Sửa sản phẩm'
                          : 'Thêm vào giỏ' } />
                      </Card> -->
                    </div>

                  </div>
                </div>

                <!-- icon right -->
                <!-- 240 là width của từng phần tử, nếu responsive thì thay đổi đi //tức là mỗi lần
                  nhấn thì sang phải 1 phần tử (240px) -->
                <!-- ${hoverSimilarProduct ? 'w-[60px] h-[60px] shadow-shadowAuth'
                       : 'w-[46px] h-[46px] shadow-shadowAccount' } -->

                <div class="next show">
                  <i style="font-size: 18px" class="fas fa-arrow-right"></i>
                  <!-- <FontAwesomeIcon class='text-[18px]' icon={faArrowRight} /> -->
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />

    <script defer src="${pageContext.request.contextPath}/resources/js/productDetail.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/effect/spinning/spinning.js"></script>   
    <script defer src="${pageContext.request.contextPath}/resources/effect/skeleton/skeleton.js"></script>  
    <script defer src="${pageContext.request.contextPath}/resources/effect/toast/toast.js"></script> 

  </body>
</html>
