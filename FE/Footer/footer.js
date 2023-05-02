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

const footerItem3 = $('.footer__item--grid')

// <li class='footer__item--3'>
// <a 
//   class='hover:text-primary transition-all'>
//   {name}
// </a>
// </li>

for (let i = 0; i < navData.length; i++) {
  const li = document.createElement("li");
  const a = document.createElement("a");
  li.setAttribute('class', 'footer__item--3')
  a.textContent = navData[i].name;
  li.appendChild(a)
  footerItem3.appendChild(li)
}