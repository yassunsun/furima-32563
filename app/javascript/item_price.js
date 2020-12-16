function price() {
  const item_price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  item_price.addEventListener("keyup", function() {
    const selling_price = item_price.value;
    let tax = Math.floor(selling_price * 0.1);
    let benefit = Math.floor(selling_price * 0.9);
    add_tax.innerHTML = tax;
    profit.innerHTML = benefit;
  });
}

window.addEventListener("load", price);