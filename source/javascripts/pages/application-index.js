// Hero
var heroHeight = $(".hero")[0].offsetHeight;
function setNavOpacity() {
  if (window.pageYOffset > heroHeight) {
    $(".navbar")[0].classList.add("navbar--translucent");
  } else {
    $(".navbar")[0].classList.remove("navbar--translucent");
  }
}
setNavOpacity();
window.addEventListener('scroll', setNavOpacity);

// Chart
new Chartist.Line('.ct-chart', data, basicOptions);