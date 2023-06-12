

const imgShow = document.querySelector('.product-detail_imgShow .show');
//
const btnPrev_show = document.querySelector('.product-detail_imgShow .btn-left');
const btnNext_show = document.querySelector('.product-detail_imgShow .btn-right');
// 
const imgPreviews = document.querySelectorAll('.product-detail_imgPreview .wrapper .imgPreview');


// Hàm này sẽ thực hiện việc hiển thị ảnh với idx ảnh truyền vào
const showImgCurrent = (idxCurrent) => {
  imgShow.style.transform = `translateX(-${idxCurrent * 584}px)`
  //
  imgPreviews.forEach((item) => item.querySelector('img').classList.remove('active'))
  imgPreviews[idxCurrent].querySelector('img').classList.add('active');
}

// const idxStart = 0;
const idxEnd = imgShow.querySelectorAll('img').length - 1;
let idxCurrent = 0;
showImgCurrent(0) //Mặc định là hiển thị ảnh đầu tiên

//Ấn vào nút prev
btnPrev_show.addEventListener("click", () => {
  if (idxCurrent == 0) idxCurrent = idxEnd;
  else idxCurrent--;
  showImgCurrent(idxCurrent)
})

//Ấn vào nút next
btnNext_show.addEventListener("click", () => {
  if (idxCurrent == idxEnd) idxCurrent = 0;
  else idxCurrent++;
  showImgCurrent(idxCurrent)
})

// Ấn vào ảnh preview
imgPreviews.forEach((item, idx) => {
  item.addEventListener('click', () => {
    showImgCurrent(idx);
  })
})

//====================================== OVERLAY ======================================

const overlay = document.querySelector('.overlay-preview');
//
const ovelay_imgShow = document.querySelector('.overlay-main .overlay-imgs');
const overlay_prev = document.querySelector('.overlay-prev');
const overlay_next = document.querySelector('.overlay-next');
//
// Đây là list ảnh ở trang (Để bắt sự kiện click vào từng ảnh => Hiện overlay)
const imgShows = document.querySelectorAll('.product-detail_imgShow .show img');
//
const overlay_close = document.querySelector('.overlay-close');
let overlay_idxCurrent;

// Hàm này sẽ thực hiện việc hiển thị ảnh với idx ảnh truyền vào
const overlay_showImgCurrent = (idxCurrent) => {
  // Nếu ảnh đầu tiên thì xóa class "show" => KHÔNG HIỆN NÚT PREV
  if (idxCurrent == 0) overlay_prev.classList.remove("show")
  else overlay_prev.classList.add("show")

  // Nếu ảnh cuối cùng thì xóa class "show" => KHÔNG HIỆN NÚT NEXT
  if (idxCurrent == idxEnd) overlay_next.classList.remove("show")
  else overlay_next.classList.add("show")

  ovelay_imgShow.style.transform = `translateX(-${idxCurrent * 876}px)`
}

// Bắt sự kiện ấn vào list ảnh ở trang => Hiện overlay
imgShows.forEach((imgShow, idx) => {
  imgShow.addEventListener('click', () => {
    overlay.classList.add('active');
    overlay_idxCurrent = idx;
    overlay_showImgCurrent(overlay_idxCurrent);
  })
})

//OVERLAY: Ấn vào nút prev
overlay_prev.addEventListener("click", () => {
  overlay_idxCurrent--;
  overlay_showImgCurrent(overlay_idxCurrent)
})

//OVERLAY: Ấn vào nút next
overlay_next.addEventListener("click", () => {
  overlay_idxCurrent++;
  overlay_showImgCurrent(overlay_idxCurrent)
})

//OVERLAY: Ấn vào dấu X thì close
overlay_close.addEventListener('click', () => {
  overlay.classList.remove('active');
})

// LÀM THÊM CÁI ẤN RA BÊN NGOÀI THÌ CŨNG BỊ CLOISE => BẮT DỰ KIỆN CLICK VÀO OVERLAY VỚI ĐIỀU KIỆN
// E.TARGET != 'ẢNH' THÌ CLOSE

//====================================== SIMILAR PRODUCT ======================================

const similar = document.querySelector('.similar-products .main_wrapper');
const similarProducts = document.querySelectorAll('.similar-products .main_wrapper .similar-item');
//
const similar_prev = document.querySelector('.similar-products .prev');
const similar_next = document.querySelector('.similar-products .next');
//
const similar_idEnd = similarProducts.length - 1;

// Hàm này sẽ thực hiện việc hiển thị ảnh với idx ảnh truyền vào
const similar_showProductCurrent = (similar_idx) => {
  // Nếu sản phẩm đầu tiên thì xóa class "show" => KHÔNG HIỆN NÚT PREV
  if (similar_idx == 0) similar_prev.classList.remove("show")
  else similar_prev.classList.add("show")

  // Nếu sản phẩm cuối cùng thì xóa class "show" => KHÔNG HIỆN NÚT NEXT
  // similar_idx = 0 thì ở sp cuối cùng đang có idx là similar_idx + 4, tức khi nào similar_idx + 4 mà là similar_idEnd thì không hiện nút next
  if (similar_idx + 4 == similar_idEnd) similar_next.classList.remove("show")
  else similar_next.classList.add("show")

  // similar.style.transform = `translateX(${similar_idx * (-1) * 240}px)`
  similar.style.transform = `translateX(-${similar_idx * 240}px)`
}

let similar_idxCurrent = 0;
similar_showProductCurrent(0)

//SIMILAR: Ấn vào nút prev
similar_prev.addEventListener("click", () => {
  similar_idxCurrent--;
  similar_showProductCurrent(similar_idxCurrent)
})

//SIMILAR: Ấn vào nút next
similar_next.addEventListener("click", () => {
  similar_idxCurrent++;
  similar_showProductCurrent(similar_idxCurrent)
})

//================================== BUTTON DESC/ASC QUANTITY ==================================
const quantity_prev = document.querySelector('.input_main .desc');
const quantity_next = document.querySelector('.input_main .asc');
//
const quantity = document.querySelector('.input_main .value');
const inventory = document.querySelector('.select-quantity .inventory span');
//
let quantityCurrent = 1;

quantity_prev.addEventListener("click", () => {
  //Nếu số lượng là 1 thì không cho ấn
  if (quantityCurrent > 1) {
    quantityCurrent--;
    quantity.innerHTML = quantityCurrent.toString().padStart(2, "0");
  }
})

quantity_next.addEventListener("click", () => {
  //Nếu số lượng < số lượng "sản phẩm hiện có thì không cho ấn"
  if (quantityCurrent < Number(inventory.innerHTML)) {
    quantityCurrent++;
    quantity.innerHTML = quantityCurrent.toString().padStart(2, "0");
  }
})

//================================== SKELETON -> BOT HIDE WHEN SKELETON RUN ==================================
const productDetail_bottom = document.querySelector('.product-detail_bottom');
setTimeout(() => {
  productDetail_bottom.classList.remove('skeleton_active');
}, 2222); //time = time of skeleton

//================================== ADD TO CART ==================================
const addToCart = async (id) => {
  const btnAddtoCart = document.querySelector('.product-detail_topRight .addToCart button');
  //quantity ở phần BUTTON DESC/ASC QUANTITY xử lý bên trên nha

  btnAddtoCart.classList.add('spin-true');
  btnAddtoCart.disabled = true //khi button dang loading thi k bam them sp dc (tranh spam)

  await fetch('/api/addtocart', {
    method: 'POST', // hoặc 'GET' tùy theo phương thức bạn sử dụng
    headers: {
      'Content-Type': 'application/json' // định dạng dữ liệu là JSON
    },
    body: JSON.stringify({id_product: id, quantity: Number(quantity.innerText)}) // chuyển số thành JSON và gửi trong body
//    body: id,
  }).then(response => response.text()) //.json nếu dạng truyền về là object json
          .then(data => {
            setTimeout(() => {
              document.dispatchEvent(new CustomEvent('showToastMessage'));
               //
              quantityCurrent = 1;
              quantity.innerHTML = "01";
              //
              btnAddtoCart.classList.remove('spin-true');
              btnAddtoCart.disabled = false;
            }, 1200);
          })
          .catch(error => {
            console.error(error);
          });
};