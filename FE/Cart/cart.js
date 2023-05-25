function increaseQuantity(id, price, total) {
  const currentQuantity = document.getElementById(id);
  const newQuantity = parseInt(currentQuantity.innerHTML.trim()) + 1 < 10
    ? `0${parseInt(currentQuantity.innerHTML.trim()) + 1}`
    : parseInt(currentQuantity.innerHTML.trim()) + 1;
  currentQuantity.innerHTML = newQuantity
  // 
  const priceEl = document.getElementById(price);
  const totalEl = document.getElementById(total);
  totalEl.innerText = parseInt(priceEl.innerText) * parseInt(newQuantity)
}

function decreaseQuantity(id, price, total) {
  const currentQuantity = document.getElementById(id);
  const currentValue = parseInt(currentQuantity.innerHTML.trim());
  if (currentValue > 1) {
    const newQuantity = currentValue - 1 < 10
      ? `0${currentValue - 1}`
      : currentValue - 1;
    currentQuantity.innerHTML = newQuantity
    // 
    const priceEl = document.getElementById(price);
    const totalEl = document.getElementById(total);
    totalEl.innerText = parseInt(priceEl.innerText) * parseInt(newQuantity)
  }
}