const navDataFooter = [
  {
    name: 'Trang chủ',
    href: "/"
  },
  {
    name: 'Giới thiệu',
    href: "/gioi-thieu"
  },
  {
    name: 'Giày nữ',
    href: '/giay-nu'
  },
  {
    name: 'Giày nam',
    href: '/giay-nam'
  },
  {
    name: 'Giày trẻ em',
    href: '/giay-tre-em'
  },
  {
    name: 'Tin tức',
    href: '/tin-tuc'
  },
  {
    name: 'Liên hệ',
    href: '/lien-he'
  },
];

const $ = document.querySelector.bind(document)
const $$ = document.querySelectorAll.bind(document)

const footerEl = $('.footer')
footerEl.innerHTML = `
<div class="footer__wrapper">
<div class="footer__wrapper--main">
  <div class="footer__item">
    <h3 class=''>Giới thiệu</h3>
    <div class=""></div>
    <ul class=''>
      Chào mừng bạn đến với ShoesPlus! Tại đây, mỗi một dòng chữ, mỗi chi tiết và hình
      ảnh đều là những bằng chứng mang dấu ấn lịch sử Converse 100 năm, và đang không ngừng
      phát triển lớn mạnh.
    </ul>
  </div>

  <div class="footer__item">
    <h3 class=''>Địa chỉ</h3>
    <div class=""></div>
    <ul class=''>
      <li class='footer__item--2'>
        <i class="fas fa-map-marker-alt"></i>
        <p>Km10, Đường Nguyễn Trãi, Hà Đông, Hà Nội</p>
      </li>
      <li class='footer__item--2'>
        <i class="fas fa-phone"></i>
        <p><a class='' href="tel:0912316304">0912316304</a>
        </p>
      </li>
      <li class='footer__item--2'>
        <i class="fas fa-envelope"></i>
        <p><a class='' href="mailto:ShoesPlus@gmail.com">ShoesPlus@gmail.com</a></p>
      </li>
      <li class='footer__item--2'>
        <i class="fab fa-twitter"></i>
        <p><a class='' href="skype:ShoesPlus?chat">ShoesPlus</a></p>
      </li>
    </ul>
  </div>

  <div class="footer__item">
    <h3 class=''>Menu</h3>
    <div class=""></div>
    <ul class="footer__item--grid">
    </ul>
  </div>

  <div class="footer__item">
    <h3 class=''>Mạng xã hội</h3>
    <div class=""></div>
    <ul class='footer__item-4'>
      <a href="https://fb.com/duchaudeyy" target="_blank" class=''
        style='background-color: #3a589d'>
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="https://fb.com/duchaudeyy" target="_blank" class=''
        style='background-color: #3b6995'>
        <i class="fab fa-instagram"></i>
      </a>
      <a href="https://fb.com/duchaudeyy" target="_blank" class=''
        style='background-color: #2478ba'>
        <i class="fab fa-twitter"></i>
      </a>
      <a href="https://fb.com/duchaudeyy" target="_blank" class=''
        style='background-color: #ff0303'>
        <i class="fab fa-youtube"></i>
      </a>
    </ul>
  </div>

</div>
</div>
<div class="footer__cre">
<p class=''>
  © Bản quyền thuộc về <a class='' href="https://fb.com/duchaudeyy">
    ShoesPlus</a>
</p>
</div>
`

const footerItem3 = $('.footer__item--grid')
for (let i = 0; i < navDataFooter.length; i++) {
  const li = document.createElement("li");
  const a = document.createElement("a");
  li.setAttribute('class', 'footer__item--3')
  a.textContent = navDataFooter[i].name;
  li.appendChild(a)
  footerItem3.appendChild(li)
}