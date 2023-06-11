<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/CSS/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/FE/Signup/signup.css">
</head>

<body>
    <jsp:include page="${pageContext.request.contextPath}/FE/Header/header.jsp" />

  <div class="" id="container">
    <!-- {
    resetPassword
    ?
    <Reset signUp={signUp} setResetPassword={setResetPassword} />
    :
    <SignIn signUp={signUp} signInWithGoogle={signInWithGoogle}
      setResetPassword={setResetPassword} />
    } -->

    <!-- SIGN IN -->
    <div class="container-signin_reset">
      <!-- RESET PASSWORD -->
      <div class="reset-pass_wrapper">
          <form class='reset-pass_form' action="/reset-password" method="POST">
          <h1 class="reset-pass_title">Quên mật khẩu</h1>
          <span class='reset-pass_type'>
            <div class="line"></div>
            <p style="margin: 8px 10px;">Nhập email để lấy lại mật khẩu</p>
            <div class="line"></div>
          </span>
          <input class='login_input' name="email" type="text" placeholder="Email" />
          <a class='reset-pass_arrowLeft'>
            <i class="fas fa-long-arrow-alt-left"></i>
            <!-- <FontAwesomeIcon class='mr-[6px]' icon={faLongArrowAltLeft} /> -->
            Đăng nhập
          </a>
          <button type='submit' class='login_btn'>
            <!-- {loading ?
            <Spinning /> : "Đặt lại mật khẩu"} -->
            Đặt lại mật khẩu
          </button>
        </form>
      </div>
      <div class="sign-in_wrapper">
          <form class='sign-in_form' action="/login" method="POST">
          <h1 class="sign-in_title">Đăng nhập</h1>
          <a class="sign-in_google">
            <span class="sign-in_googleIcon">
              <i class="fab fa-google"></i>
              <!-- <FontAwesomeIcon class='icon' icon={faGoogle} /> -->
            </span>
            <p>Tiếp tục với Google</p>
          </a>
          <span class='sign-in_other'>
            <div class="line"></div>
            <p style="margin: 0 10px"'>Hoặc đăng nhập bằng tài khoản</p>
          <div class="line"></div>
        </span>
          <h3>${resetPasswordMessage}</h3>
          <h3>${loginError}</h3>
            <input name="email" class=' login_input' type="text" placeholder="Email" />
            <input name="password" class='login_input' type="password" placeholder="Password" />
            <a class='sign-in_resetpass'>
              Quên mật khẩu?
            </a>
            <button type='submit' class='login_btn'>
              <!-- {loading ?
            <Spinning /> : "Đăng nhập"} -->
              Đăng nhập
            </button>
        </form>
      </div>
    </div>

    <!-- SIGN UP -->
    <div class="sign-up_wrapper">
        <form class='sign-up_form' action="/signup" name="signupForm" 
              method="POST" onsubmit="return validate()">
        <h1 class="sign-up_title">Tạo tài khoản</h1>
        <a class="sign-up_google">
          <span class="sign-up_googleIcon " href="#">
            <i class="fab fa-google"></i>
          </span>
          <p>Continue with Google</p>
        </a>
        <span class='sign-up_other'>
          <div class="line"></div>
          <p style="margin: 0 10px"'>Hoặc tạo tài khoản bằng email</p>
          
          <div class="line"></div>
        </span>
        <h3>${success}</h3>
        <input name="email" class=' login_input ' type="text" placeholder="Email"/>
        <h3 style="color: red">${error.get("email")}</h3>
        <input name="password"
          class=' login_input' type="password" placeholder="Password" />
        <input name="confirmPassword" class='login_input' type="password"
          placeholder="Nhập lại Password" />
        <button type="submit" class='login_btn '>
            <!-- {loading ?
            <Spinning /> : "Đăng ký"} -->
            Đăng ký
          </button>
      </form>
    </div>

    <!--  Overlay -->
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-left">
          <h1 class="overlay-left_title">Đăng nhập vào Shoes Plus</h1>
          <p class="overlay-left_sub">
            Đã có tài
            khoản? Vui lòng đăng nhập ở đây
          </p>
          <button class="overlay-left_btn" id="signIn">
            Đăng nhập
          </button>
        </div>
        <!--  -->
        <div class="overlay-right">
          <h1 class="overlay-right_title">Chưa có tài khoản?</h1>
          <p class="overlay-right_sub">
            Nhập thông
            tin của bạn để thỏa sức mua sắm với Shoes Plus
          </p>
          <button class="overlay-right_btn" id="signUp">
            Đăng ký
          </button>
        </div>
      </div>
    </div>
  </div>
  <script src="${pageContext.request.contextPath}/FE/Signup/signup.js"></script>
    <jsp:include page="${pageContext.request.contextPath}/FE/Footer/footer.jsp" />

</body>

</html>
