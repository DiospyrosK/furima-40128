window.addEventListener('load', () => {
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", () => {
    const itemPrice = inputPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemPrice * 0.1);
    profit.innerHTML = itemPrice - addTaxPrice.innerHTML;
  })
});