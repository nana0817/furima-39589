window.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    // 「価格」フォームに入力した値を取得
    const inputValue = priceInput.value;

    // 「販売手数料」に表示する値
    taxPrice.innerHTML = Math.floor(inputValue * 0.1);

    // 「販売利益」に表示する値
    profit.innerHTML = Math.floor(inputValue - inputValue * 0.1);

  });

});