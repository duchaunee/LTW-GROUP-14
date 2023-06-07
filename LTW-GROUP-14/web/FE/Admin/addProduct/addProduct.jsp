<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add product</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Admin/addProduct/addProduct.css">
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

          <a href="/" class='admin_leftItem'>
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

          <a href="/admin-addproduct" style="text-decoration: none; color: white;" class='admin_leftItem active'>
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
          <form class="add-product_wrapper" method="post" action="/admin-addproduct" enctype="multipart/form-data">
          <div class="add-product_main">
            <!-- LEFT -->
            <div class="add-product_left">

              <div class="add-product_name">
                <label for="product-name" class="">Tên sản phẩm</label>
                <input value="${product.name}" required name='name' class="" autocomplete="off" type="text"
                  id="product-name" placeholder="Nhập vào tên sản phẩm" />
              </div>

              <div class="add-product_detail">
                <div class="add-product_img ">
                  <label for="upload-product">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <span class=''>Tải lên ảnh sản phẩm</span>
                    <!-- Đây chính là src ảnh sau khi đã up lên để nó hiển thị trong khung -->
<!--                     <img class='w-full h-full object-cover object-center'
                      src="/productImage?imgId=${product.image_id}&number=0" alt="" />-->
                  </label>
                  <input type="file" name="imgURL" id="upload-product" hidden />
                </div>

                <div class="add-product_info">
                  <div class="price">
                    <label for="product-price" class="">Giá</label>
                    <input required name="price" autocomplete="off" type="text" id="product-price"
                      placeholder="Giá sản phẩm (VNĐ)" maxLength="7" />
                  </div>

                  <div class="inventory">
                    <label for="product-inventory">Số lượng tồn kho</label>
                    <input required name="inventory" autocomplete="off" type="text"
                      id="product-inventory" placeholder="Số lượng (Number)" maxLength="7" />
                  </div>

                  <div class="category">
                    <label for="product-category">Loại</label>
                    <select required name="category" class="" autocomplete="off" type="text"
                      id="product-category" placeholder="Chọn loại sản phẩm">
                      <option key='0' value="">Chọn loại sản phẩm</option>
                      <option key='1' value="Giày nam">Giày nam</option>
                      <option key='2' value="Giày nữ">Giày nữ</option>
                      <option key='3' value="Giày trẻ em">Giày trẻ em</option>
                    </select>
                  </div>

                  <div class="brand">
                    <label for="product-brand">Thương hiệu</label>
                    <select required name="brand" autocomplete="off" type="text" id="product-brand"
                      placeholder="Product Brand">
                      <option key='0' value="">Chọn thương hiệu</option>
                      <option key='1' value="Classic">Classic</option>
                      <option key='2' value="Sunbaked">Sunbaked</option>
                      <option key='3' value="Chuck 07s">Chuck 07S</option>
                      <option key='4' value="One Star">One Star</option>
                      <option key='5' value="Psy Kicks">PSY Kicks</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="add-product_desc">
                <label for="product-desscription">Mô tả sản phẩm</label>
                <textarea required name="desc" cols="30" autocomplete="off"
                          id="product-desscription" placeholder="Nhập vào mô tả sản phẩm"></textarea>
              </div>
            </div>

            <!-- RIGHT - imgPreview 1-> 4 -->
            <div class="add-product_right">

              <div class="add-product_imgPreview1">
                <label for="product-preview-1">
                  <i class="fas fa-cloud-upload-alt"></i>
                  <span class='text-[16px]'>Tải lên ảnh sản phẩm</span>
                  <!-- Đây chính là src ảnh sau khi đã up lên để nó hiển thị trong khung -->
<!--                  <img class='w-full h-full object-cover object-center' 
                       src="/productImage?imgId=${product.image_id}&number=1" alt="" />-->
                </label>
                <input type="file" name={name} id="product-preview-1" hidden />
              </div>

              <div class="add-product_imgPreview1">
                <label for="product-preview-2">
                  <i class="fas fa-cloud-upload-alt"></i>
                  <span class='text-[16px]'>Tải lên ảnh sản phẩm</span>
                  <!-- Đây chính là src ảnh sau khi đã up lên để nó hiển thị trong khung -->
<!--                  <img class='w-full h-full object-cover object-center' 
                       src="/productImage?imgId=${product.image_id}&number=2" alt="" />-->
                </label>
                <input type="file" name={name} id="product-preview-2" hidden />
              </div>

              <div class="add-product_imgPreview1">
                <label for="product-preview-3">
                  <i class="fas fa-cloud-upload-alt"></i>
                  <span class='text-[16px]'>Tải lên ảnh sản phẩm</span>
                  <!-- Đây chính là src ảnh sau khi đã up lên để nó hiển thị trong khung -->
<!--                  <img class='w-full h-full object-cover object-center' 
                       src="/productImage?imgId=${product.image_id}&number=3" alt="" />-->
                </label>
                <input type="file" name={name} id="product-preview-3" hidden />
              </div>

              <div class="add-product_imgPreview1">
                <label for="product-preview-4">
                  <i class="fas fa-cloud-upload-alt"></i>
                  <span class='text-[16px]'>Tải lên ảnh sản phẩm</span>
<!--                   Đây chính là src ảnh sau khi đã up lên để nó hiển thị trong khung 
                  <img class='w-full h-full object-cover object-center'
                    src="/productImage?imgId=${product.image_id}&number=4" alt="" />-->
                </label>
                <input type="file" name={name} id="product-preview-4" hidden />
              </div>

            </div>
          </div>

          <!-- btn submit -->
          <button type="submit" class='add-product_submit'>
            <div class="">
              <i class="fas fa-plus"></i>
              Thêm sản phẩm
            </div>
            <!-- detect add/ edit -->
            <!-- <div class="flex gap-2 items-center justify-center">
              <FontAwesomeIcon class='text-[18px]' icon={faWrench} />
              Sửa sản phẩm
            </div> -->
          </button>
        </form>
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

</body>

</html>
