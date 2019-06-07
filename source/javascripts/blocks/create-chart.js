function createChart(node, data, options) {
  if (options === undefined) {
    options = {
      axisY: {
        onlyInteger: true
      },
      plugins: [
        Chartist.plugins.ctAxisTitle({
          axisX: {
            axisTitle: "Practice Sessions",
            offset: {
              x: 0,
              y: 40
            },
          },
          axisY: {
            axisTitle: "Completed Increments",
          }
        }),
        Chartist.plugins.ctAccessibility({
          caption: "Increments completed by each keyboard",
          seriesHeader: 'Keyboard',
          summary: 'A graphic that shows the rate of improvement for the LIK and the TK',
          valueTransform: function(value) {
            return value + ' completed increments';
          },
          // Use this if you want to make accessibility table visible
          // visuallyHiddenStyles: 'position: absolute; top: 100%; width: 100%; font-size: 11px; overflow-x: auto; background-color: rgba(0, 0, 0, 0.1); padding: 10px'
        }),
        Chartist.plugins.legend({
          legendNames: ["TK", "LIK"],
        }),
      ]
    }
  }

  var container;
  if (typeof node === "string") {
    container = $(node)[0];
  } else {
    container = node;
  }

  // Skip however many labels needed to ensure that there are at least 18 pixels per label
  var modulo = 1;
  while (container.offsetWidth / (data.labels.length / modulo) < 18) {
    console.log(modulo);
    console.log(container.offsetWidth / (data.labels.length / modulo))
    modulo += 1;
  }
  data.labels = data.labels.map(num => num % modulo === 0 ? num : "");

  new Chartist.Line(node, data, options);
}

var basicOptions = {
  axisY: {
    onlyInteger: true
  },
  plugins: [
    Chartist.plugins.ctAxisTitle({
      axisX: {
        axisTitle: "Practice Sessions",
        offset: {
          x: 0,
          y: 40
        },
      },
      axisY: {
        axisTitle: "Completed Increments",
      }
    }),
    Chartist.plugins.ctAccessibility({
      caption: "Increments completed by each keyboard",
      seriesHeader: 'Keyboard',
      summary: 'A graphic that shows the rate of improvement for the LIK and the TK',
      valueTransform: function(value) {
        return value + ' completed increments';
      },
      // Use this if you want to make accessibility table visible
      // visuallyHiddenStyles: 'position: absolute; top: 100%; width: 100%; font-size: 11px; overflow-x: auto; background-color: rgba(0, 0, 0, 0.1); padding: 10px'
    }),
    Chartist.plugins.legend({
      legendNames: ["TK", "LIK"],
    }),
  ]
}