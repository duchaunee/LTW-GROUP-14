
const navData = [
  {
    name: 'Trang chủ',
    href: "/home"
  },
  {
    name: 'Giới thiệu',
    href: "/introduce"
  },
  {
    name: 'Giày nữ',
    href: '/san-pham?category=giay nu'
  },
  {
    name: 'Giày nam',
    href: '/san-pham?category=giay nam'
  },
  {
    name: 'Giày trẻ em',
    href: '/san-pham?category=giay tre em'
  },
  {
    name: 'Tin tức',
    href: '/tin-tuc'
  },
  {
    name: 'Liên hệ',
    href: '/contact'
  },
];

// const $ = document.querySelector.bind(document)
// const $$ = document.querySelectorAll.bind(document)


const headerNavList = document.querySelector('.header__nav--list');

for (let i = 0; i < navData.length; i++) {
  const a = document.createElement("a");
  const div = document.createElement("div");
  a.setAttribute('class', 'header__nav--item');
  a.setAttribute("href", navData[i].href);
  div.textContent = navData[i].name;
  a.appendChild(div);
  headerNavList.appendChild(a);
}

const navListData = document.querySelectorAll('.header__nav--item');

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
