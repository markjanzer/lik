// Improvement Graph

class Keyboard {
  constructor(options) {
    this.totalShapes = options.totalShapes
    this.name = options.name
    this.practiceSessions = []
    this.shapesLearnedPerPracticeSession = 15;

    this.unknownShapes = []
    let i = 0;
    while (i < this.totalShapes) {
      i ++
      this.unknownShapes.push(i)
    }
  }

  practice() {
    var newShapes = []
    var knownShapes = []
    var practicedShapes = []
    for (let i = 0; i < this.shapesLearnedPerPracticeSession; i++) {
      practicedShapes.push(Math.ceil(Math.random() * this.totalShapes));
    }

    practicedShapes.forEach(shapeId => {
      if (this.unknownShapes.includes(shapeId)) {
        let shapeIndex = this.unknownShapes.indexOf(shapeId);
        this.unknownShapes.splice(shapeIndex, 1);
        newShapes.push(shapeId);
      } else {
        knownShapes.push(shapeId);
      }
    });

    const percentKnown = (knownShapes.length / this.shapesLearnedPerPracticeSession) * 100.0

    const practiceSession = {
      number: this.practiceSessions.length + 1,
      newShapes: newShapes,
      knownShapes: knownShapes,
      percentKnown: percentKnown,
      percentKnownOnKeyboard: this.percentLearned()
    }

    this.practiceSessions.push(practiceSession);

    return practiceSession;
  }

  percentLearned() {
    return ((this.totalShapes - this.unknownShapes.length) / this.totalShapes) * 100;
  }

  practiceSessionsPercentKnown() {
    return this.practiceSessions.map(ps => ps.percentKnown);
  }
}

var lik = new Keyboard({name: "LIK", totalShapes: 300})
var tk = new Keyboard({name: "TK", totalShapes: 700})

// while (lik.percentLearned() < 85) {
// }

while (lik.percentLearned() < 90) {
  lik.practice();
  tk.practice();
}

var improvementChartOptions = {
  axisY: {
    onlyInteger: true
  },
  high: 100,
  // If low is specified then the axis will display values explicitly down to this value and the computed minimum from the data is ignored
  low: 0,
  // This option will be used when finding the right scale division settings. The amount of ticks on the scale will be determined so that as many ticks as possible will be displayed, while not violating this minimum required space (in pixel).
  scaleMinSpace: 20,
  series: {
    "TK percent known": {
      showArea: true
    },
    "LIK percent known": {
      showArea: true
    },
  },
  plugins: [
    Chartist.plugins.ctAxisTitle({
      axisX: {
        axisTitle: "Practice Sessions",
        offset: {
          x: 0,
          y: 35
        },
      },
      axisY: {
        axisTitle: "Percent Learned",
      }
    }),
    Chartist.plugins.ctAccessibility({
      caption: "Rate of improvement for each keyboard",
      seriesHeader: 'Keyboard',
      summary: 'A graphic that shows the hypothetical rate of improvement of the LIK and the TK.',
      valueTransform: function(value) {
        return value + ' percent learned';
      },
      // Use this if you want to make accessibility table visible
      // visuallyHiddenStyles: 'position: absolute; top: 100%; width: 100%; font-size: 11px; overflow-x: auto; background-color: rgba(0, 0, 0, 0.1); padding: 10px'
    }),
    Chartist.plugins.legend({
      legendNames: ["TK", "% known in TK practice session", "LIK", "% known in LIK practice session"],
    }),
  ]
}

new Chartist.Line('.improvement-chart', {
  labels: tk.practiceSessions.map(ps => ps.number),
  series: [{
    name: 'TK percent known',
    data:  tk.practiceSessions.map(ps => ps.percentKnownOnKeyboard),
  }, {
    name: 'TK percent known of practice session',
    data: tk.practiceSessions.map(ps => ps.percentKnown),
  }, {
    name: 'LIK percent known',
    data: lik.practiceSessions.map(ps => ps.percentKnownOnKeyboard),
  }, {
    name: 'LIK percent known of practice session',
    data: lik.practiceSessions.map(ps => ps.percentKnown),
  }]
}, improvementChartOptions);







