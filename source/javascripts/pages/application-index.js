// -------- Scroll Functions --------

// Opacity for navbar
function setNavOpacity(heroHeight) {
  if (window.pageYOffset > heroHeight) {
    $(".navbar")[0].classList.add("navbar--translucent");
  } else {
    $(".navbar")[0].classList.remove("navbar--translucent");
  }
}

// Transform keyboard from TK to LIK
function transformKeyboard(scrollLength) {
  var scrollLength = $(".hero__text--second")[0].offsetTop;
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
    chonk.style.height = numberTransition(38.90, 0, percentScrolled) + "%";
    chonk.style.backgroundColor = transformColor(white, gray, percentScrolled);
  });

  $(".black-key").forEach(key => {
    key.style.height = numberTransition(60, 100, percentScrolled) + "%";
  })
}

function positionKeyboard(keyboardScrollEnd) {
  // var scrollTop = window.pageYOffset;
  var keyboard = $(".keyboard")[0];
  // Maybe I should use calsses here instead
  if (window.pageYOffset >= keyboardScrollEnd) {
    keyboard.style.position = "absolute";
    keyboard.style.top = "0px";
  } else {
    var top = $(".hero__text--first")[0].offsetHeight;
    keyboard.style.position = "fixed";
    keyboard.style.top = top + "px";
  }
}

function animateHeroText(keyboardScrollEnd) {
  var secondText = $(".hero__text--second")[0];
  if (window.pageYOffset >= keyboardScrollEnd) {
    secondText.classList.add("fadeInUp");
  }
}

function onScroll() {
  var heroHeight = $(".hero")[0].offsetHeight;
  var keyboardScrollEnd = $(".hero__text--second")[0].offsetTop;

  setNavOpacity(heroHeight);
  transformKeyboard(keyboardScrollEnd);
  positionKeyboard(keyboardScrollEnd);
  animateHeroText(keyboardScrollEnd);
}

// -------- Helpers --------

function numberTransition(n1, n2, percent) {
  return n1 + ((n2 - n1) * percent);
}

function transformColor(startingColor, endingColor, percent) {
  var newColor = {
    red: numberTransition(startingColor.red, endingColor.red, percent),
    green: numberTransition(startingColor.green, endingColor.green, percent),
    blue: numberTransition(startingColor.blue, endingColor.blue, percent),
    alpha: numberTransition(startingColor.alpha, endingColor.alpha, percent),
  }
  return `rgb(${newColor.red}, ${newColor.green}, ${newColor.blue}, ${newColor.alpha})`;
}

// function scrollDirection() {
//   var scrollTop = window.pageYOffset || document.documentElement.scrollTop; // Credits: "https://github.com/qeremy/so/blob/master/so.dom.js#L426"
//   var direction;
//   if (scrollTop > lastScrollTop) {
//     direction = "down";
//   } else {
//     direction = "up";
//   }
//   lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // For Mobile or negative scrolling
//   return direction;
// }


// -------- Onload ---------

// var lastScrollTop = window.pageYOffset || document.documentElement.scrollTop;
onScroll();
window.addEventListener('scroll', onScroll);

// Force page scroll position to the top on page load
window.onbeforeunload = function () {
  window.scrollTo(0, 0);
}

// Might use this to conditionally transition
if (window.pageYOffset == 0) {
  setTimeout(function () { 
    var scrollHeight = $(".hero__text--second")[0].offsetTop;
    zenscroll.toY(scrollHeight, 1400) 
  }, 1500)
}

// Chart
new Chartist.Line('.ct-chart', data, basicOptions);
