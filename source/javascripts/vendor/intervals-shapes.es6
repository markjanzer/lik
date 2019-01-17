// https://stackoverflow.com/questions/4270485/drawing-lines-on-html-page
function createLineElement(x, y, length, angle, lineWidth, lineColor) {
  var line = document.createElement("div");
  line.className = "edge";
  var styles = 'border: 1px solid ' + "grey" + '; '
             + 'width: ' + length + 'px; '
             + 'height: ' + ((lineWidth * 2.5 + 2) / 16) + 'rem; '
             + '-moz-transform: rotate(' + angle + 'rad); '
             + '-webkit-transform: rotate(' + angle + 'rad); '
             + '-o-transform: rotate(' + angle + 'rad); '  
             + '-ms-transform: rotate(' + angle + 'rad); '  
             + 'position: absolute; '
             + 'top: ' + y + 'px; '
             + 'left: ' + x + 'px; '
             + 'background-color: ' + lineColor + '; ';
  line.setAttribute('style', styles);

  // var tooltip = document.createElement("div");
  // tooltip.className = "tooltip";
  // tooltip.innerHTML = "Ab -> Eb, Eb -> D"
  // line.appendChild(tooltip)
  return line;
}

function createLine(x1, y1, x2, y2, lineWidth, lineColor) {
  var a = x1 - x2,
      b = y1 - y2,
      c = Math.sqrt(a * a + b * b);

  var sx = (x1 + x2) / 2,
      sy = (y1 + y2) / 2;

  var x = sx - c / 2,
      y = sy;

  var alpha = Math.PI - Math.atan2(-b, a);

  return createLineElement(x, y, c, alpha, lineWidth, lineColor);
}

// https://stackoverflow.com/questions/8027875/how-to-find-the-elements-x-center-coordinates-and-related-window-offset
function getCenter(node) {
  var centerX = node.offsetLeft + node.offsetWidth / 2;
  var centerY = node.offsetTop + node.offsetHeight / 2;
  return [centerX, centerY];
}

function createLineFromEdge(edgeData) {
  var interval = $("#" + edgeData.data.source)
  var intervalNode = interval.querySelector(".node__visual")
  var intervalNodeCenter = getCenter(intervalNode);
  var intervalNodeCenterX = intervalNodeCenter[0];
  var intervalNodeCenterY = intervalNodeCenter[1];

  var shape = $("#" + edgeData.data.target);
  var shapeNode = shape.querySelector(".node__visual");
  var shapeNodeCenter = getCenter(shapeNode);
  var shapeNodeCenterX = shapeNodeCenter[0];
  var shapeNodeCenterY = shapeNodeCenter[1];

  var lineWidth = edgeData.data.weight / 2;
  var lineColor = intervalNode.style.backgroundColor;

  var line = createLine(intervalNodeCenterX, intervalNodeCenterY, shapeNodeCenterX, shapeNodeCenterY, lineWidth, lineColor);
  line.className = "edge";
  line.title = edgeData.data.names.join("&#013;&#010;");
  var canvas = $(".intervals-shapes-graph")[0];
  canvas.appendChild(line);
}

function createEdges() {
  edges.forEach(edge => {
    createLineFromEdge(edge);
  });
}

function tippyInit() {
  tippy(document.querySelectorAll('.intervals-shapes-graph--tk .edge'), {
    followCursor: true,
    performance: true,
    theme: 'dark',
    animation: 'fade',
    duration: 100,
  });
}


// Run

createEdges();
tippyInit();

window.addEventListener("resize", () => {
  $(".edge").forEach(edge => {
    deleteElement(edge);
  });

  createEdges();
  tippyInit();
});
