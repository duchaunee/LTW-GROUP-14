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

const $ = document.querySelector.bind(document)
const $$ = document.querySelectorAll.bind(document)

const headerNavList = $('.header__nav--list')

for (let i = 0; i < navData.length; i++) {
  const a = document.createElement("a");
  const div = document.createElement("div");
  a.setAttribute('class', 'header__nav--item')
  div.textContent = navData[i].name;
  a.appendChild(div)
  headerNavList.appendChild(a)
}

const navListData = $$('.header__nav--item')

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
