// Data defined in file this is included in

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
          y: 30
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
// new Chartist.Line('.ct-chart', data, options);