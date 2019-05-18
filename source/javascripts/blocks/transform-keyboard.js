function transformKeyboard() {
  var scrollLength = 500;
  var white = { red: 255, green: 255, blue: 255, alpha: 1 }
  var gray = { red: 151, green: 151, blue: 151, alpha: 1 }
  // if (window.pageYOffset > 0) {
  //   $(".navbar")[0].classList.add("navbar--translucent");
  // } else {
  //   $(".navbar")[0].classList.remove("navbar--translucent");
  // }

  var percentScrolled = window.pageYOffset / scrollLength;
  if (percentScrolled > 1) {
    percentScrolled = 1;
  }

  $(".white-key").forEach(key => {
    key.style.backgroundColor = transformColor(white, gray, percentScrolled);
  })

  $(".white-chonk").forEach(chonk => {
    chonk.style.height = numberTransition(179, 0, percentScrolled) + "px";
    chonk.style.backgroundColor = transformColor(white, gray, percentScrolled);
  });

  $(".black-key").forEach(key => {
    key.style.height = numberTransition(274, 455, percentScrolled) + "px";
  })
}

transformKeyboard();
window.addEventListener('scroll', transformKeyboard);



function transformColor(startingColor, endingColor, percent) {
  var newColor = {
    red: numberTransition(startingColor.red, endingColor.red, percent),
    green: numberTransition(startingColor.green, endingColor.green, percent),
    blue: numberTransition(startingColor.blue, endingColor.blue, percent),
    alpha: numberTransition(startingColor.alpha, endingColor.alpha, percent),
  }
  return `rgb(${newColor.red}, ${newColor.green}, ${newColor.blue}, ${newColor.alpha})`;
}

function numberTransition(n1, n2, percent) {
  return n1 + ((n2 - n1) * percent);
}