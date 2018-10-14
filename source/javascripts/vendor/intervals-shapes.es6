var edges = [
  {"group":"edges","data":{"id":"rec0JNcCR6mWbIUC4","source":"reckvpdIs6Xuq1HVj","target":"recI4GQgm65zG0mWf","weight":3,"names":["G to B","F to A","C to E"]}},
  {"group":"edges","data":{"id":"rec0NGLEXI55bl58C","source":"recdeN9izKLz6FxLx","target":"recVEelstSUtfbWsw","weight":3,"names":["Ab to B","C# to E","F# to A"]}},
  {"group":"edges","data":{"id":"rec1ASlwlu2xJo1wR","source":"rec0vNdSsnZkIcA4X","target":"recpPTjrPCoWEqHqc","weight":5,"names":["Eb to E","C# to D","Ab to A","Bb to B","F# to G"]}},
  {"group":"edges","data":{"id":"rec1IKaza0cMlDGGU","source":"rec0vNdSsnZkIcA4X","target":"recwYr1BR7SJOhV2K","weight":5,"names":["C to C#","D to Eb","A to Bb","G to Ab","F to F#"]}},
  {"group":"edges","data":{"id":"rec1TjZXu5iXahNKc","source":"recyyC3ERyaf28Xn6","target":"reciaFs54NU3QcW5a","weight":5,"names":["A to Ab","B to Bb","D to C#","G to F#","E to Eb"]}},
  {"group":"edges","data":{"id":"rec27JwtK79KBBrVe","source":"reczsYyfXWbFv1v1d","target":"recBe3PY2ElHu4G6x","weight":3,"names":["Bb to Ab","Eb to C#","Ab to F#"]}},
  {"group":"edges","data":{"id":"rec2DLayIjgYHioWi","source":"recH91UnZq5M46BN2","target":"rec9HUG3nu1eZHs1L","weight":6,"names":["C to F","E to A","D to G","A to D","G to C","B to E"]}},
  {"group":"edges","data":{"id":"rec2LQtgpZT0IJ4GP","source":"recS58DmkLKu2grR9","target":"recuYrPcvwNMSr4Sy","weight":5,"names":["A to B","D to E","G to A","F to G","C to D"]}},
  {"group":"edges","data":{"id":"rec2WnLuWLHPQLD3E","source":"rec8sFmzq4bUF9g3D","target":"recCBGfwxnRisN5v6","weight":7,"names":["A to A","E to E","B to B","G to G","C to C","F to F","D to D"]}},
  {"group":"edges","data":{"id":"rec2bt9z4VTUpREmG","source":"recH91UnZq5M46BN2","target":"recEVTjwd7ySM8R4J","weight":4,"names":["C# to F#","Ab to C#","Bb to Eb","Eb to Ab"]}},
  {"group":"edges","data":{"id":"rec2qRiPJ53ZxGJaX","source":"reczsYyfXWbFv1v1d","target":"recppuCcNqM6FkJyH","weight":5,"names":["D to C","B to A","A to G","E to D","G to F"]}},
  {"group":"edges","data":{"id":"rec2wrbmyEGPQ2ABu","source":"recS58DmkLKu2grR9","target":"reca2z9JHoJ599b0e","weight":2,"names":["E to F#","B to C#"]}},
  {"group":"edges","data":{"id":"rec3TXoucMsTcZoqy","source":"recdeN9izKLz6FxLx","target":"recI4GQgm65zG0mWf","weight":4,"names":["A to C","B to D","E to G","D to F"]}},
  {"group":"edges","data":{"id":"rec3opKSqxKwpdERy","source":"reckvpdIs6Xuq1HVj","target":"reclgFxnI22C1BFhd","weight":4,"names":["C# to F","Ab to C","Eb to G","Bb to D"]}},
  {"group":"edges","data":{"id":"rec6lJJCtSj5tcE1w","source":"recZbKFnM0QfVkOmm","target":"recY743bibqUglxhX","weight":6,"names":["E to B","C to G","A to E","G to D","F to C","D to A"]}},
  {"group":"edges","data":{"id":"rec6uqSakNTVMIvTk","source":"recZbKFnM0QfVkOmm","target":"recBxv0fvY0pkuVkJ","weight":1,"names":["Bb to F"]}},
  {"group":"edges","data":{"id":"rec71wOlX28VSsdFv","source":"recLsI9cI3dAimpvR","target":"recwgjsitkTZuMC7l","weight":3,"names":["E to C#","B to Ab","A to F#"]}},
  {"group":"edges","data":{"id":"rec7kZFoLjSI5eCzh","source":"recdeN9izKLz6FxLx","target":"reca2z9JHoJ599b0e","weight":3,"names":["G to Bb","F to Ab","C to Eb"]}},
  {"group":"edges","data":{"id":"rec7xjLnAKzN6ERew","source":"recLsI9cI3dAimpvR","target":"recB9zg5H5TwGtp7e","weight":3,"names":["Eb to C","Bb to G","Ab to F"]}},
  {"group":"edges","data":{"id":"rec8Pl85i9cHw1her","source":"recyMPEnGXy97mxll","target":"recQVcnBLRQycKSkz","weight":3,"names":["B to G","E to C","A to F"]}},
  {"group":"edges","data":{"id":"rec9D2aCRZvPNiKeH","source":"receqRQ6G8fmCtEVx","target":"recBxv0fvY0pkuVkJ","weight":5,"names":["Ab to D","Bb to E","C# to G","Eb to A","F# to C"]}},
  {"group":"edges","data":{"id":"rec9NeSpmujJBPN1r","source":"rec0vNdSsnZkIcA4X","target":"recuYrPcvwNMSr4Sy","weight":2,"names":["B to C","E to F"]}},
  {"group":"edges","data":{"id":"rec9Pb5y4ojummE7V","source":"rec8sFmzq4bUF9g3D","target":"recwkWJhG5WlEHqAw","weight":5,"names":["F# to F#","Eb to Eb","Bb to Bb","Ab to Ab","C# to C#"]}},
  {"group":"edges","data":{"id":"rec9rLBZHaHadksgE","source":"recyyC3ERyaf28Xn6","target":"recwnb2NblRpgcTQH","weight":5,"names":["F# to F","Ab to G","Bb to A","Eb to D","C# to C"]}},
  {"group":"edges","data":{"id":"recAiP9sQ1OfNqnjH","source":"recdeN9izKLz6FxLx","target":"recIhXSA4YZRwrq4w","weight":2,"names":["Eb to F#","Bb to C#"]}},
  {"group":"edges","data":{"id":"recCMqdXGRrtSVDKM","source":"reczsYyfXWbFv1v1d","target":"recwgjsitkTZuMC7l","weight":2,"names":["F to Eb","C to Bb"]}},
  {"group":"edges","data":{"id":"recCvRVejxOguooa1","source":"recZbKFnM0QfVkOmm","target":"rec4lvBafSjpf6iUm","weight":1,"names":["B to F#"]}},
  {"group":"edges","data":{"id":"recDm306cWWKenTlK","source":"reczsYyfXWbFv1v1d","target":"recB9zg5H5TwGtp7e","weight":2,"names":["C# to B","F# to E"]}},
  {"group":"edges","data":{"id":"recEdeBYJrCTtSrGS","source":"reckvpdIs6Xuq1HVj","target":"recG4t1WiOR1DM2tc","weight":4,"names":["E to Ab","A to C#","B to Eb","D to F#"]}},
  {"group":"edges","data":{"id":"recHP57nEp0j32nHw","source":"recyMPEnGXy97mxll","target":"recOz4xQj9DEV4olt","weight":4,"names":["Ab to E","Eb to B","C# to A","F# to D"]}},
  {"group":"edges","data":{"id":"recHYEwysBnG40GQ6","source":"recyMPEnGXy97mxll","target":"rec4lvBafSjpf6iUm","weight":4,"names":["D to Bb","F to C#","G to Eb","C to Ab"]}},
  {"group":"edges","data":{"id":"recJUvMHN2BSmQYmT","source":"recS58DmkLKu2grR9","target":"recVEelstSUtfbWsw","weight":2,"names":["Bb to C","Eb to F"]}},
  {"group":"edges","data":{"id":"recJv9kMZ2Ug2R63d","source":"recyyC3ERyaf28Xn6","target":"recppuCcNqM6FkJyH","weight":2,"names":["C to B","F to E"]}},
  {"group":"edges","data":{"id":"recMxqv6u6ex0PF9J","source":"recS58DmkLKu2grR9","target":"recstZnrrXgGG0YOa","weight":3,"names":["C# to Eb","F# to Ab","Ab to Bb"]}},
  {"group":"edges","data":{"id":"recPOuOv4OGzh4aJx","source":"recZbKFnM0QfVkOmm","target":"rectMuASyozV4jN2j","weight":4,"names":["Ab to Eb","F# to C#","C# to Ab","Eb to Bb"]}},
  {"group":"edges","data":{"id":"recQKOKGRQpV7Up8W","source":"receqRQ6G8fmCtEVx","target":"recY743bibqUglxhX","weight":2,"names":["B to F","F to B"]}},
  {"group":"edges","data":{"id":"recTuwL9rjG5MOLWc","source":"recLsI9cI3dAimpvR","target":"recQVcnBLRQycKSkz","weight":4,"names":["C to A","D to B","F to D","G to E"]}},
  {"group":"edges","data":{"id":"recVvb9a4z5YVqfL7","source":"receqRQ6G8fmCtEVx","target":"rec7EU4KfVep7D6Sa","weight":5,"names":["A to Eb","C to F#","D to Ab","E to Bb","G to C#"]}},
  {"group":"edges","data":{"id":"receWX5Xzrv9GX4yx","source":"recH91UnZq5M46BN2","target":"recG4t1WiOR1DM2tc","weight":1,"names":["F to Bb"]}},
  {"group":"edges","data":{"id":"recjhpl1P1jwHUx8G","source":"recLsI9cI3dAimpvR","target":"recxRi3kOFTsWucav","weight":2,"names":["C# to Bb","F# to Eb"]}},
  {"group":"edges","data":{"id":"recmVgISpv5xEUxYo","source":"reckvpdIs6Xuq1HVj","target":"recIhXSA4YZRwrq4w","weight":1,"names":["F# to Bb"]}},
  {"group":"edges","data":{"id":"recpIeg2vBW8a74L5","source":"recyMPEnGXy97mxll","target":"recxRi3kOFTsWucav","weight":1,"names":["Bb to F#"]}},
  {"group":"edges","data":{"id":"recsM28i8kCF1CGbE","source":"recH91UnZq5M46BN2","target":"reclgFxnI22C1BFhd","weight":1,"names":["F# to B"]}},

  // LIK
  {"group":"edges","data":{"source":"lik-minor-2nd","target":"lik-1","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-major-2nd","target":"lik-2","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-minor-3rd","target":"lik-3","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-major-3rd","target":"lik-4","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-perfect-4th","target":"lik-5","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-tritone","target":"lik-6","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-perfect-5th","target":"lik-7","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-minor-6th","target":"lik-8","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-major-6th","target":"lik-9","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-minor-7th","target":"lik-10","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-major-7th","target":"lik-11","weight":12,"names":[]}},
  {"group":"edges","data":{"source":"lik-octave","target":"lik-12","weight":12,"names":[]}},
];

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

edges.forEach(edge => {
  createLineFromEdge(edge);
});

tippy(document.querySelectorAll('.intervals-shapes-graph--tk .edge'), {
  followCursor: true,
  performance: true,
  theme: 'dark',
  animation: 'fade',
  duration: 100,
})

window.addEventListener("resize", () => {
  $(".edge").forEach(edge => {
    deleteElement(edge);
  });

  edges.forEach(edge => {
    createLineFromEdge(edge);
  });

  tippy(document.querySelectorAll('.intervals-shapes-graph--tk .edge'), {
    followCursor: true,
    performance: true,
    theme: 'dark',
    animation: 'fade',
    duration: 100,
  })
});





