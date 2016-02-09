var initials = "";

process.argv.forEach(function (val, index, array) {
  if (index > 1) {
    initials += val[0];
  }
})

console.log(initials);
