function $(selector) {
  if (selector.charAt(0) === "#") {
    return document.querySelector(selector);
  } else {
    return document.querySelectorAll(selector);
  }
}

function deleteElement(el) {``
  el.parentNode.removeChild(el);
}