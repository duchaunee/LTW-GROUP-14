<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View product</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" type="text/css" 
        href="${pageContext.request.contextPath}/FE/Admin/viewProduct/viewProduct.css">
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

          <a href="/admin-viewproduct" style="text-decoration: none; color: white;" class='admin_leftItem active'>
            <div class=''>
              <i class="fas fa-mountain"></i>
              <span class=''>Xem sản phẩm</span>
            </div>
          </a>

            <a href="/admin-addproduct" style="text-decoration: none; color: black;" class='admin_leftItem '>
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
        <div class='view-product_wrapper'>
          <div class="view-product_top">
            <span class='view-product_quantity'>
              <p class=''>Số lượng</p>: ${size} sản phẩm
            </span>
            <!-- <div class='view-product_filter'>
              <div class="">
                <select class='view-product_filterBrand' name="sort-by" id="">
                  <option key='0' value="default">Lọc sản phẩm theo</option>
                  <option key='1' value="all">Tất cả</option>
                  <option key='2' value="classic">Classic</option>
                  <option key='3' value="sunbaked">Sunbaked</option>
                  <option key='4' value="chuck-07s">Chuck 07S</option>
                  <option key='5' value="one-star">One Star</option>
                  <option key='6' value="psy-kicks">PSY Kicks</option>
                </select>
              </div>
              <form class="view-product_filterName">
                <div class="input">
                  <input required placeholder='Tìm kiếm theo tên' autoComplete='off' type="text"
                    name="" id="" />
                </div>
                <button type='submit'>
                  <i class="fas fa-search"></i>
                </button>
              </form>
              <div class="">
                <select class='view-product_filterDate ' name="sort-by" id="">
                  <option key='0' value="default">Sắp xếp sản phẩm theo</option>
                  <option key='1' value="latest">Mới nhất</option>
                  <option key='2' value="oldest">Cũ nhất</option>
                  <option key='3' value="lowest-price">Giá tăng dần</option>
                  <option key='4' value="highest-price">Giá giảm dần</option>
                  <option key='5' value="a-z">A - Z</option>
                  <option key='6' value="z-a">Z - A</option>
                </select>
              </div>
            </div> -->
          </div>

          <!-- <div class='flex flex-col items-center'>
            <img class='w-[350px] object-cover' src="../../notFound.jpg" alt="" />
            <h1 class='text-[20px] text-center text-bgPrimary'>Không tìm thấy sản phẩm phù hợp
            </h1>
          </div> -->

          <!-- style={{ height: `${itemsPerPage * 148 + 20}px` }} -->
          <div class="view-product_bottom">
            <!-- <Spinning color='#1f2028' size='28px' /> -->
            <table class='w-full'>
              <thead>
                <tr class=''>
                  <td class='order '>Thứ tự</td>
                  <td class='info '>Thông tin sản phẩm</td>
                  <td class='classify '>Phân loại</td>
                  <td class='price'>Giá</td>
                  <td class='action'>Hành động</td>
                </tr>
              </thead>
              <tbody>
                <!-- mỗi sản phẩm là 1 hàng -->
                
                <c:forEach items="${productList}" var="p">
                <tr class=''>
                  <td class='order'>
                    <span class=''>
                      ${productList.indexOf(p) + 1+3*(current-1)}
                      <!-- 
                        {(idx + 1) + itemsPerPage * (currentPage - 1)}  
                        ==> Công thức tính số thứ tự
                      -->
                    </span>
                  </td>
                  <td class='info'>
                    <img class='' src="/productImage?imgId=${p.image_id}&number=0" alt="" />
                    <div class="">
                      <span class='name'>${p.name}</span>
                      <span class='desc'>
                          ${p.description}
                      </span>
                    </div>
                  </td>
                  <td class='classify'>
                    <span class=''>${p.category}</span>
                  </td>
                  <td class='price'>
                    <span class=''>
                      ${p.price}<p class=''>₫</p>
                    </span>
                  </td>
                  <td class='action'>
                      <a href="/admin-editproduct?id=${p.id}"><button style="border: none" class="edit">
                      <i class="fas fa-edit"></i>
                      <FontAwesomeIcon
                        class='text-[18px] cursor-pointer text-bgPrimary hover:text-green-600 transition-all ease-linear duration-100'
                        icon={faEdit} /></a>
                    </button>
                    <a href="#"> <button style="border: none" class='remove' onclick="confirmDelete(${p.countNumberOfOrderDetail()},${p.id})">
                      <i class="fas fa-trash-alt"></i>
                      <FontAwesomeIcon
                        class='text-[18px] cursor-pointer text-bgPrimary hover:text-primary transition-all ease-linear duration-100'
                        icon={faTrashAlt} />
                    </button>
                      </a>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- pagination -->
          <ul class="pagination">
                <c:forEach begin="1" end="${page}" var="i">
                  <li>
                    <a href="admin-viewproduct?index=${i}">${i}</a>
                  </li>
                </c:forEach>
          </ul>
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
    <script>
      function confirmDelete(n, id){
          if(n === 0){
             var option = confirm("Bạn có chắc muốn xóa sản phẩm này ?");
             if ( option === true){
             window.location.href='admin-deleteproduct?id='+id;
           }
          }
  
          else{
              alert("Không thể xóa sản phẩm đang có đơn hàng");
          }
      }

      
  </script>
  <!-- <script src="./addProduct.js"></script> -->
</body>

</html>
