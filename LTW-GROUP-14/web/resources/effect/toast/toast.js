/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
//@duchau

const icons = {
  success: 'fas fa-check-circle',
  warning: 'fas fa-exclamation-circle',
  error: 'fas fa-exclamation-triangle"'
};

const toasts = document.querySelector('#toasts');
const allToast = document.querySelectorAll('.toast');
const message = document.querySelector('.message').value;

//nếu class có top-right == nul thì class là left-right
let position;
if (document.querySelector('.top-right') != null) {
  position = 'topRight';
  toasts.style.right = '22px';
  toasts.style.left = 'unset';
} else {
  position = 'topLeft';
  toasts.style.left = '22px';
  toasts.style.right = 'unset';
}


//khi bên kia dispatch đến action showToastMessage thì sẽ show toast
document.addEventListener('showToastMessage', () => {
  createElementMsg(toasts.className.split(" ")[0]);
});

function createElementMsg(status) {
  var toast = document.createElement('div');
  toast.className = `toast ${status}`;
  toast.innerHTML = `
            <div class="toast__icon">
                <i class="${icons[status]}"></i>
            </div>
            <div class="toast__msg">
                <span>${message}</span>
            </div>
            <i class="close fas fa-times"></i>
            `;
  toasts.appendChild(toast);

  toast.style.animation = `show_slide_${position} 0.66s linear forwards`;
  //sau 2s thì cho chui về
  hideToast(2000, toast);
  
  //Nếu ấn vào thì ngay lập tức ẩn luôn không cần đợi chạy
  toast.addEventListener('click', () => {
    hideToast(0, toast);
  });
}

function hideToast(timeHide, toast) {
  setTimeout(() => {
    toast.style.animation = `hide_slide_${position} 0.8s ease forwards`;
  }, timeHide);

  // sau khi bị ẩn thì 1111ms sau thì xóa element đó đi
  setTimeout(() => {
    toast.remove();
//    toasts.classList.remove('active');
  }, timeHide + 1111);
}