
function formatCurrency(value) {
  return Number(value).toLocaleString('vi-VN');
}

const solveBrand = () => {
  const brand = document.querySelector("#brand");
  if (brand.value != "default") { //neu chon khac default thi moi submit
    var form = brand.parentNode; // Lấy ra đối tượng form
    form.submit();
  }
}

const solvePriceRange = () => {
  let from = document.querySelector("#from").value;
  let to = document.querySelector("#to").value;
  const input = document.querySelectorAll(".girlShoes__bot-range");
//
  const fromText = document.querySelector(".fromText");
  const toText = document.querySelector(".toText");
//
  const line = document.querySelector(".girlShoes__bot--filter span .line");

  const maxLength = 7; // Giới hạn độ dài tối đa là 7 kí tự

  //Nếu đang điền ô from thì innerHTML
  if (from != "") {
    if (from.length > maxLength) { //Giới hạn độ dài cho ô input type number (type number KHÔNG CÓ maxlength)
      document.querySelector("#from").value = from.slice(0, maxLength); // Cắt bớt giá trị nhập vào
    } else {
      fromText.innerHTML = formatCurrency(from) + "₫";
    }
  } else //Nếu ô input rỗng thì hiển thị lại giá trị default: 0
    fromText.innerHTML = "VNĐ";


  //Nếu đang điền ô to thì innerHTML
  if (to != "") {
    if (to.length > maxLength) {
      document.querySelector("#to").value = to.slice(0, maxLength);
    } else {
      toText.innerHTML = formatCurrency(to) + "₫";
    }
  } else
    toText.innerHTML = "VNĐ";


  // Nếu cả 2 ô đã được điền thì check điều kiện để hiện border CẢNH BÁO GIÁ TRỊ KHÔNG HỢP LỆ (to < from)
  if (from != "" && to != "") {

    //lấy ra giá trị MỚI NHẤT 
    //bởi vì nếu không lấy thì khi nhập đến size = 10 thì from VẪN ĐƯỢC gán bằng 10 số, 
    //và thứ bị slice là giá trị ô input trong jsp (biến from vẫn k bị thay đổi)
    from = document.querySelector("#from").value;
    to = document.querySelector("#to").value;

    // Nếu size của tổng 2 ô from + to mà > 12 thì ẩn cái line giữa "Lọc" và "Giá" đi
    if (String(from).length + String(to).length > 12) {
      line.style.display = 'none'
    } else
      line.style.display = 'block'

    if (Number(to) < Number(from)) {
      input.forEach(item => {
        item.querySelector('label').style.color = "var(--text-primary)";
        item.querySelector('input').style.border = "1px solid var(--text-primary)";
      });
    } else
      input.forEach(item => {
        item.querySelector('label').style.color = "";
        item.querySelector('input').style.border = "";
      });
  } else { //Nếu chỉ cần 1 trong 2 ô KHÔNG ĐIỀN thì không cần check điều kiện
    input.forEach(item => {
      item.querySelector('label').style.color = "";
      item.querySelector('input').style.border = "";
    });
  }
}

//============================ ADD TO CART //============================
const addToCart = async (id, idxBtn) => {
  const toasts = document.querySelector('#toasts');
  const btnAddtoCart = document.querySelectorAll('.girlShoes__bot--productItem.btn>div button');

  btnAddtoCart[idxBtn].classList.add('spin-true');
  btnAddtoCart[idxBtn].disabled = true //khi button dang loading thi k bam them sp dc (tranh spam)


  await fetch('/api/addtocart', {
    method: 'POST', //get
    headers: {
      'Content-Type': 'application/json' // định dạng dữ liệu là JSON
    },
    body: JSON.stringify({id_product: id, quantity: 1}) // chuyển số thành JSON và gửi trong body
  }).then(response => response.text()) //.json nếu dạng truyền về là object json
          .then(data => {
            setTimeout(() => {
              //dispatch 1 actice 
              //action này là action chạy để sinh ra toast bên file toast.js
              document.dispatchEvent(new CustomEvent('showToastMessage'));
              //
              btnAddtoCart[idxBtn].disabled = false;
              btnAddtoCart[idxBtn].classList.remove('spin-true');
            }, 1200)
          })
          .catch(error => {
            console.error(error);
          });
};


//===================== SKELETON //=====================
const skeleton = document.querySelector('.skeleton'); //chỉ cần lấy ra 1 thằng để check vì khi xóa thì cũng xóa hết
const pagination = document.querySelector('.pagination');

if (skeleton.classList.contains('active')) {
  pagination.style.display = 'none';
}

//Để trùng thời gian với skeleton, khi nào hết skeleton mới hiển thị pagination
setTimeout(() => {
  pagination.style.display = 'flex';
}, 2222);