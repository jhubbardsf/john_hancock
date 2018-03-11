//= require signature_pad
$( document ).ready(function() {
  var $clearButton = $("[data-action=canvas-clear]");

  var canvases = document.getElementsByClassName("JohnHancock-canvas");
  var hidden_fields = document.getElementsByClassName("JohnHancock-hidden");
  var signaturePads = []
  for(var i = 0; i < canvases.length; i++) {
    var canvas = canvases[i];
    var hidden_field = hidden_fields[i];
    var parent_form = $(canvas).closest("form");
    signaturePads.push(new SignaturePad(canvas));

  }

  $(parent_form).submit(function(e) {
    for(var i = 0; i < hidden_fields.length; i++) {
      $(hidden_fields[i]).val(signaturePads[i].toDataURL());
    }
  });

  $clearButton.on("click", function () {
      clearCanvas()
  });

  function resizeCanvas() {
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    for(var i = 0; i < canvases.length; i++) {
        canvases[i].width = canvases[i].offsetWidth * ratio;
        canvases[i].height = canvases[i].offsetHeight * ratio;
        canvases[i].getContext("2d").scale(ratio, ratio);
        signaturePads[i].clear(); // otherwise isEmpty() might return incorrect value
    }
  }

  function clearCanvas() {
    for(var i = 0; i < canvases.length; i++) {
        signaturePads[i].clear(); // otherwise isEmpty() might return incorrect value
    }
  }

  window.addEventListener("resize", resizeCanvas);
  resizeCanvas();
})