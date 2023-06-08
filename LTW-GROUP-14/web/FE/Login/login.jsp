<%-- 
    Document   : login
    Created on : Jun 8, 2023, 10:59:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="../CSS/reset.css">
  <link rel="stylesheet" href="../Login/login.css">
</head>

<body>
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
        <form class='reset-pass_form'>
          <h1 class="reset-pass_title">Quên mật khẩu</h1>
          <span class='reset-pass_type'>
            <div class="line"></div>
            <p style="margin: 8px 10px;">Nhập email để lấy lại mật khẩu</p>
            <div class="line"></div>
          </span>
          <input class='login_input' type="text" placeholder="Email" />
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
        <form class='sign-in_form' method="post" action="login" >
          <h1 class="sign-in_title">Đăng nhập</h1>
          <a class="sign-in_google">
            <span class="sign-in_googleIcon">
              <i class="fab fa-google"></i>
              <!-- <FontAwesomeIcon class='icon' icon={faGoogle} /> -->
            </span>
            <p>Continue with Google</p>
          </a>
          <span class='sign-in_other'>
            <div class="line"></div>
            <p style="margin: 0 10px"'>Hoặc đăng nhập bằng tài khoản</p>
          <div class="line"></div>
        </span>
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
        <form class='sign-up_form' method="post" action="register">
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
        <input name="email"
          class=' login_input ' type="text" placeholder="Email"/>
          <input name="password"
            class=' login_input' type="password" placeholder="Password" />
          <input name="Cpassword" class='login_input' type="password"
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
  <script src="../login.js"></script>
</body>

</html>
