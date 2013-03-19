
$(document).ready(function() {
  var dragging, randomXToY, zindexnr;
  randomXToY = function(minVal, maxVal, floatVal) {
    var randVal;
    randVal = minVal + (Math.random() * (maxVal - minVal));
    if (typeof floatVal === "undefined") {
      return Math.round(randVal);
    } else {
      return randVal.toFixed(floatVal);
    }
  };
  $(".polaroid").each(function(i) {
    var cssObj, rotDegrees, tempVal, wih, wiw;
    tempVal = Math.round(Math.random());
    if (tempVal === 1) {
      rotDegrees = randomXToY(330, 360);
    } else {
      rotDegrees = randomXToY(0, 30);
    }
    if (window.innerWidth === undefined) {
      wiw = 1000;
      wih = 700;
    } else {
      wiw = window.innerWidth;
      wih = window.innerHeight;
    }
    cssObj = {
      left: Math.random() * (wiw - 400),
      top: Math.random() * (wih - 400),
      "-webkit-transform": "rotate(" + rotDegrees + "deg)",
      transform: "rotate(" + rotDegrees + "deg)"
    };
    return $(this).css(cssObj);
  });
  zindexnr = 1;
  dragging = false;
  $(".polaroid").mouseup(function(e) {
    var cssObj;
    if (!dragging) {
      zindexnr++;
      cssObj = {
        "z-index": zindexnr,
        transform: "rotate(0deg)",
        "-webkit-transform": "rotate(0deg)"
      };
      return $(this).css(cssObj);
    }
  });
  return $(".polaroid").draggable({
    cursor: "crosshair",
    start: function(event, ui) {
      var cssObj;
      dragging = true;
      zindexnr++;
      cssObj = {
        "box-shadow": "#888 5px 10px 10px",
        "-webkit-box-shadow": "#888 5px 10px 10px",
        "margin-left": "-10px",
        "margin-top": "-10px",
        "z-index": zindexnr
      };
      return $(this).css(cssObj);
    },
    stop: function(event, ui) {
      var cssObj, rotDegrees, tempVal;
      tempVal = Math.round(Math.random());
      if (tempVal === 1) {
        rotDegrees = randomXToY(330, 360);
      } else {
        rotDegrees = randomXToY(0, 30);
      }
      cssObj = {
        "box-shadow": "",
        "-webkit-box-shadow": "",
        transform: "rotate(" + rotDegrees + "deg)",
        "-webkit-transform": "rotate(" + rotDegrees + "deg)",
        "margin-left": "0px",
        "margin-top": "0px"
      };
      $(this).css(cssObj);
      return dragging = false;
    }
  });
});

