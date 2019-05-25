function deleteFirst(d) {
  if(d[0]) delete d[0];
}

function showData(a, b, c, d, e) {
  if(a > b) {
    f = a/b;
    
  }
  else {
    f = b/a;
  }
  d.push(f);
  console.log(d)
  
  setTimeout("deleteFirst(d)", 1000);
  
  var a = [1, 2, 3];
  var b = [4, 5, 6];
  
  for (var i = 0; i < a.length; i++){
    b.push(a[i]);
  }
  
  for (var j = 0; j < b.length; j++) {
    c[j] = b[j] * 4;
  }
}

showData(012, '10.55', {}, [], new Date());