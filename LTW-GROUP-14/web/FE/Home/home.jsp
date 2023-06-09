<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoes Plus</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/FE/Home/Assest/css/style.css">
    </head>
    <body>
        <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" /> 
    <div class="slider">
        <div class="slides">
            <!--radio buttons start-->
            <input type="radio" name="radio-btn" id="radio1">
            <input type="radio" name="radio-btn" id="radio2">
            <input type="radio" name="radio-btn" id="radio3">
            <input type="radio" name="radio-btn" id="radio4">
        
            <!--radio buttons end-->
            <!--slide images start-->
            <div class="slide first">
            <img src="${pageContext.request.contextPath}/FE/Home/Assest/img/slide-1.jpg" alt="">
            </div>
            <div class="slide">
            <img src="${pageContext.request.contextPath}/FE/Home/Assest/img/slide-2.jpg" alt="">
            </div>
            <div class="slide">
            <img src="${pageContext.request.contextPath}/FE/Home/Assest/img/slide-5.jpg" alt="">
            </div>
            <div class="slide">
            <img src="${pageContext.request.contextPath}/FE/Home/Assest/img/slide-2.jpg" alt="">
            </div>
            <!--slide images end-->
            <!--automatic navigation start-->
            <div class="navigation-auto">
            <div class="auto-btn1"></div>
            <div class="auto-btn2"></div>
            <div class="auto-btn3"></div>
            <div class="auto-btn4"></div>  
            </div>
            <!--automatic navigation end-->
        </div>

        <div class="slider last-slider">
            <img src="./Assest/img/slide-6.png" style="margin-top: 80px; width: 100%;" alt="">
        </div>
        
    </div>
   
    <div  class="content">
        <div class="most-new-product">
            <h2>SẢN PHẨM MỚI NHẤT</h2>

            <div id="formList" class="carousel">    
                <c:forEach items="${items}" var="p" varStatus="status">
                 <div class="carousel-cell">
                    <div class="carousel-cell-top">
                        <img class='' src="/productImage?imgId=${p.image_id}&number=0" alt="" />
                    </div>
                    <div class="carousel-cell-bottom">
                        <p class="name-product-carousel-cell">
                            <a class="carousel-cell-bottom-title" href="#">${p.getName()}</a>
                        </p>
                        <h1 class="related-products-price">${p.getPrice()} ₫</h1>
                        <a class="related-products-button" type="submit">THÊM VÀO GIỎ</a>
                    </div>                                                   
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="sale-product">
            <h2>SẢN PHẨM BÁN CHẠY</h2>

            <div id="formList" class="carousel"> 
                <c:forEach items="${items1}" var="p" varStatus="status">
                    <div class="carousel-cell">
                    <div class="carousel-cell-top">
                        <img class='' src="/productImage?imgId=${p.image_id}&number=0" alt="" />
                    </div>
                    <div class="carousel-cell-bottom">
                        <p class="name-product-carousel-cell">
                            <a class="carousel-cell-bottom-title" href="#">${p.getName()}</a>
                        </p>
                        <h1 class="related-products-price">${p.getPrice()} ₫</h1>
                        <a class="related-products-button" type="submit">THÊM VÀO GIỎ</a>
                    </div>                                                   
                </div>
                </c:forEach>
                
               </div>

        </div>
        <div></div>

    </div>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />

    <script type="text/javascript">
    var counter = 1;
    setInterval(function(){
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if(counter > 4){
        counter = 1;
      }
    }, 5000);
    </script>
    </body>
</html>
