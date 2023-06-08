const carousel = document.querySelector(".carousel");
const carouselContainer = document.querySelector(".carousel-container");
const carouselItems = document.querySelectorAll(".carousel-item");

let currentIndex = 0;
const itemWidth = carouselItems[0].offsetWidth;

console.log("oke");
function slideTo(index) {
  carouselContainer.style.transform = `translateX(-${index * itemWidth}px)`;
  currentIndex = index;
}

function nextSlide() {
  alert("worked");
  if (currentIndex === carouselItems.length - 1) {
    slideTo(0);
  } else {
    slideTo(currentIndex + 1);
  }
}

setInterval(nextSlide, 3000); // Auto slide every 3 seconds
4;

window.addEventListener("scroll", function () {
  let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  let parallaxBg = document.querySelector(".parallax-bg");
  parallaxBg.style.transform = "translateY(" + scrollTop * 0.5 + "px)";
});
