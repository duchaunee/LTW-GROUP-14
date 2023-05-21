const navData = [
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

// const $ = document.querySelector.bind(document)
// const $$ = document.querySelectorAll.bind(document)

const header = document.querySelector('.header')
header.innerHTML = `
<div class='header__inner'></div>
<header class='header__wrapper'>
  <div class="header__main--1">
    <div class="header__main--2">
      <div class='header__left'>
        <a href="/dang-nhap" class='header__left--text' href="">
          Đăng nhập / Đăng ký
        </a>
      </div>

      <a href="#" class="header__logo">
        <div class="header__logo--icon"></div>
      </a>

      <div class="header__right">
        <div class="header__right--search">
          <i class="fas fa-search"></i>
        </div>
        <div class="header__right--text">
          <span class="">
            Giỏ hàng / Thanh toán
          </span>
          <span class="header__right--cart">
            <i class="fas fa-shopping-cart"></i>
          </span>
        </div>
      </div>
    </div>
  </div>
  <div class="header__nav--wrapper">
    <div class="header__nav--main">
      <ul class="header__nav--list">

        <!-- <a class='header__nav--item'>
          <div class=''>
            Giày nam
          </div>
        </a> -->
        <!-- {navData.map((nav) => (
        <Nav key={nav.name} name={nav.name} to={nav.to} />
        ))} -->
      </ul>
    </div>
  </div>
</header>
`
const headerNavList = document.querySelector('.header__nav--list')

for (let i = 0; i < navData.length; i++) {
  const a = document.createElement("a");
  const div = document.createElement("div");
  a.setAttribute('class', 'header__nav--item')
  div.textContent = navData[i].name;
  a.appendChild(div)
  headerNavList.appendChild(a)
}

const navListData = document.querySelectorAll('.header__nav--item')

// navListData.forEach(nav => {
//   nav.addEventListener('click', () => {
//     nav
//   })
// });

// function handleClick(event) {
//   const clickedItem = event.target;
//   if (navListData.includes(clickedItem)) {
//     navListData.forEach(item => item.classList.remove('active'));
//     clickedItem.classList.add('active');
//   }
// }
// // Thêm sự kiện click cho cả danh sách navListData
// navListData.forEach(item => item.addEventListener('click', handleClick));
