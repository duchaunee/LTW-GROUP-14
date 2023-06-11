

const container = document.querySelector('#container')
const container_signin_reset = document.querySelector('.container-signin_reset')

// nút đăng ký/đăng nhập ở overlay
const btnOverlaySignUp = document.querySelector('.overlay-right_btn')
const btnOverlaySignIn = document.querySelector('.overlay-left_btn')

// 2 cái wrapper đăng ký/đăng nhập
const signInWrapper = document.querySelector('.sign-in_wrapper')
const signUpWrapper = document.querySelector('.sign-up_wrapper')

// nút 'Quên mật khẩu' và nút quay lại 'Đăng nhập' ở phần quên mật khẩu
const resetPassWrapper = document.querySelector('.reset-pass_wrapper')
const signIn_ResetPass = document.querySelector('.sign-in_resetpass')
const resetPass_arrowLeft = document.querySelector('.reset-pass_arrowLeft')
//
const overlay = document.querySelector('.overlay')

const ShowResigterLauout = () => {
  container.classList.add('right-panel-active')
  signInWrapper.style.transform = 'translateX(100%)'
  // 
  resetPassWrapper.style.transform = 'translateX(100%)'
  // 
  signUpWrapper.style.transform = 'translateX(100%)'
  signUpWrapper.style.opacity = '1'
  signUpWrapper.style.zIndex = '5'
}

const ShowLoginLauout = () => {
  container.classList.remove('right-panel-active')
  signInWrapper.style.transform = ''
  // 
  resetPassWrapper.style.transform = ''
  //
  signUpWrapper.style.transform = ''
  signUpWrapper.style.opacity = '0'
  signUpWrapper.style.zIndex = '1'
}

ShowResigterLauout() //mặc định để là đăng ký

btnOverlaySignUp.addEventListener('click', () => {
  ShowResigterLauout();
  overlay.style.transition = 'transform 0.6s ease-in-out'
})
btnOverlaySignIn.addEventListener('click', () => {
  ShowLoginLauout();
  overlay.style.transition = 'transform 0.6s ease-in-out'
})

// 
signIn_ResetPass.addEventListener('click', () => {
  container_signin_reset.classList.add('show_reset')
})

resetPass_arrowLeft.addEventListener('click', () => {
  container_signin_reset.classList.remove('show_reset')
})