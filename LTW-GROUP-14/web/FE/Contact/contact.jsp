<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Contact/Assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Contact/Assets/fonts/themify-icons/themify-icons.css">
    <title>Document</title>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />
    <div id="slider">
        <div class="introduce">
            <div class="title">
                <h1>LIÊN HỆ</h1>
            </div>
            <div class="link">
                <a href="/home" style="text-decoration: none;">TRANG CHỦ  </a>/  LIÊN HỆ
            </div>
        </div>

    </div>
    <div id="content" style="margin: auto">
        <div class="title-content">
            <h3>THÔNG TIN LIÊN HỆ</h3>
            <div class="infor">
                <div class="icon">
                    <i class="ti-location-pin"></i>
                </div>
                <div class="title-infor">
                    <p>122 Hoàng Quốc Việt, Cổ Nhuế, Cầu Giấy, Hà Nội</p>
                </div>
            </div>
            <div class="infor">
                <div class="icon">
                    <i class="ti-mobile"></i>
                </div>
                <div class="title-infor">
                    <p>024 3756 2037</p>
                </div>
            </div>
            <div class="infor">
                <div class="icon">
                    <i class="ti-email"></i>
                </div>
                <div class="title-infor">
                    <p>HocvienBCVT@gmail.com</p>
                </div>

            </div>
            <div class="infor">
                <div class="icon">
                    <i class="ti-skype"></i>
                </div>
                <div class="title-infor">
                    <p>BCVTHanoi</p>
                </div>

            </div>
            <div class="link-icon">
                <a href="https://www.facebook.com/profile.php?id=100065965891839"><i class="ti-facebook"></i></a>
                <a href="https://www.facebook.com/profile.php?id=100065965891839"><i class="ti-youtube"></i></a>
                <a href="https://www.facebook.com/profile.php?id=100065965891839"><i class="ti-twitter"></i></a>
                <a href="https://www.facebook.com/profile.php?id=100065965891839"><i class="ti-pinterest"></i></a>
                <a href="https://www.facebook.com/profile.php?id=100065965891839"><i class="ti-instagram"></i></a>
            </div>

        </div>
        <form action="" class="table-content">
                <div class="row">
                    <div class="name">
                        <input  class="row-input" type="text" placeholder="Họ và tên">  
                    </div>
                    <div class="email">
                        <input  class="row-input" type="text" placeholder="Email">
                    </div>               
                </div>              
                <div class="row">
                    <div class="name">
                        <input  class="row-input" type="text" placeholder="Số điện thoại"> 
                    </div>
                    <div class="email">
                        <input  class="row-input" type="text" placeholder="Địa chỉ">
                    </div>   
                </div>
                <textarea name="" id="" cols="40" rows="10"></textarea>
                <div class="submit">
                    <input type="submit" value="Gửi" class="submit-button">
                </div>
        </form>
        
    </div>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />
</body>
</html>

