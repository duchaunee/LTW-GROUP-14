const toggleVoucher = document.querySelector('.toggle-voucher')
const voucher = document.querySelector('.value-voucher')


toggleVoucher.addEventListener('click', () => {
  if (voucher.style.maxHeight) {
    voucher.style.maxHeight = null;
  } else {
    voucher.style.maxHeight = voucher.scrollHeight + "px";
  }
})