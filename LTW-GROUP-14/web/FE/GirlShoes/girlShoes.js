const girlShoes = [
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.100.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.200.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.300.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.400.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.500.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.600.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.700.000',
    text: 'Thêm vào giỏ'
  },
  {
    src: 'https://source.unsplash.com/random',
    name: 'One Star Sunbaked',
    price: '1.800.000',
    text: 'Thêm vào giỏ'
  },
];

const productWrapper = document.querySelector('.girlShoes__bot--productWrapper')

// for (let i = 0; i < girlShoes.length; i++) {
//   const div = document.createElement('div')
//   div.innerHTML = `
//   <div class="girlShoes__bot--productList">
//   <div class=''>
//     <div class='girlShoes__bot--productItem'>
//       <div class='girlShoes__bot--productItem img'>
//         <a class=''>
//           <img draggable="false" class='' src=${girlShoes[i].src}
//             alt="" />
//         </a>
//       </div>
//       <div class="girlShoes__bot--productItem content">
//         <div class="girlShoes__bot--productItem name">
//           <a>${girlShoes[i].name}</a>
//         </div>
//         <div class="girlShoes__bot--productItem price">
//         ${girlShoes[i].price}
//           <p class=''>₫</p>
//         </div>
//         <div class='girlShoes__bot--productItem btn'>
//           <div class="mt-[10px]">
//             <button class=''>
//               <span>
//               ${girlShoes[i].text}
//               </span>
//             </button>
//           </div>
//         </div>
//       </div>
//     </div>
//   </div>
// </div>
//   `
//   productWrapper.appendChild(div)
// }

// pagination
function paginate(girlShoes, page_size, page_number) {
  return girlShoes.slice((page_number - 1) * page_size, page_number * page_size);
}
let current_page = 1;
let current_number = 1;
let page_size = 3;
let btn_count = 18;
const btnCount = document.querySelector('.girlShoes__pagination-center')


function showItems(girlShoesSlice) {
  const wrapper = document.querySelector(".girlShoes__bot--productWrapper");
  wrapper.innerHTML = "";
  for (let i = 0; i < girlShoesSlice.length; i++) {
    const div = document.createElement("div");
    div.innerHTML = `
    <div class="girlShoes__bot--productList">
    <div class=''>
      <div class='girlShoes__bot--productItem'>
        <div class='girlShoes__bot--productItem img'>
          <a class=''>
            <img draggable="false" class='' src=${girlShoesSlice[i].src}
              alt="" />
          </a>
        </div>
        <div class="girlShoes__bot--productItem content">
          <div class="girlShoes__bot--productItem name">
            <a>${girlShoesSlice[i].name}</a>
          </div>
          <div class="girlShoes__bot--productItem price">
          ${girlShoesSlice[i].price}
            <p class=''>₫</p>
          </div>
          <div class='girlShoes__bot--productItem btn'>
            <div class="mt-[10px]">
              <button class=''>
                <span>
                ${girlShoesSlice[i].text}
                </span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    `;
    wrapper.appendChild(div);
  }
}
showItems(paginate(girlShoes, page_size, current_page));

//
const prev = document.querySelector('.girlShoes__pagination--left')
const next = document.querySelector('.girlShoes__pagination--right')

prev.addEventListener('click', () => {
  current_page--;
  current_number--;
  if (current_page > 0) {
    showItems(paginate(girlShoes, page_size, current_page));
    paginationBtn(current_page, current_page)
  }
})

next.addEventListener('click', () => {
  current_page++
  current_number++;
  showItems(paginate(girlShoes, page_size, current_page));
  paginationBtn(current_page, current_page)
})

//btn count
const paginationBtn = (currentPage, current_page) => {
  btnCount.innerHTML = '' //reset empty
  for (let i = 0; i < 1; i++) {
    const button = document.createElement("button");
    button.innerHTML = `${(i + 1) * current_page}`
    if (i + 1 === currentPage) {
      button.style.color = "#fff"
      button.style.backgroundColor = "var(--text-bgPrimary)"
    }
    btnCount.appendChild(button)
  }
}
paginationBtn(1, current_page) //mac dinh luc vao hien thi ra 1