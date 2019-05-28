var products = [
    {
      id: 12,
      name: 'Item 1',
      price: 10
    },
    {
      id: 13,
      name: 'Item 2',
      price: 7.55
    },
    {
      id: 14,
      name: 'Item 3',
      price: 12,
      discount: 5
    },
    {
      id: 15,
      name: 'Item 4',
      price: 130,
      discount: 15
    }
  ];
  
  var showProducts = function () {
    document.getElementById('container-1').innerHTML = products[0].name + ' ' + products[0].price;
    document.getElementById('container-2').innerHTML = products[1].name + ' ' + products[1].price;
    document.getElementById('container-3').innerHTML = products[2].name + ' ' + 
      (products[2].price - products[2].price * products[2].discount / 100);
    document.getElementById('container-4').innerHTML = products[3].name + ' ' + 
      (products[3].price - products[3].price * products[3].discount / 100);
  };
  
  showProducts();
  
  