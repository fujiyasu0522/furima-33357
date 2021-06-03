function tax() {
  const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('change', () => {
      const price = itemPrice.value;
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const taxPrice = Math.floor(price / 10);
      const saleProfit = price - taxPrice;
      
      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit; 
  });
}
window.addEventListener("load", tax);



// window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//     console.log(inputValue);
//   })

//   const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
// })

