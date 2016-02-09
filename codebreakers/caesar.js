var cipher = "";
var lowercase = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                 "j", "k", "l", "m", "n", "o", "p", "q", "r",
                 "s", "t", "u", "v", "w", "x", "y", "z"];
var key = 0;
var capitalFlag = false;

process.argv.forEach(function (val, index) {
  if (index == 2) {
    key = parseInt(val);
  } else if (index > 2) {
    val.split("").forEach(function (letter, index) {
      if (letter.toUpperCase() == letter) {
        capitalFlag = true;
      } else {
        capitalFlag = false;
      }

      new_index = lowercase.indexOf(letter) + key;
      if (capitalFlag) {
        cipher += lowercase[new_index].toUpperCase();
      } else {
        cipher += lowercase[new_index];
      }
    })
  }
})

console.log(cipher);
