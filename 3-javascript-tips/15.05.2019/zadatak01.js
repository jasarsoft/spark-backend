function deleteFirst(d) {
    //d = d.shift();
    d = d.slice(1);
  }
  
  function showData(a, b, c, d) {
    var f = (a>b) ? a/b : b/a;
    
    d.push(f);
    console.log(d)
    
    setTimeout(deleteFirst(d), 1000);
    
    var aa = [1, 2, 3];
    var bb = [4, 5, 6];
    
    aa = aa.concat(bb);
      
    b2.map(function(item){
      c[item] = item;
    });
    
    console.log(a, b, c, d, aa, bb);  
  }
  
  showData(012, '10.55', {}, []);
  