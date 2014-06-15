

$( document ).ready(function() {

$("h5").on("click", function() {
  var el = $(this);
    // $( this ).effect( "slide", 90 );
      if (el.text() == el.data("text-swap")) {
        el.text(el.data("text-original"));
      } else {
        el.data("text-original", el.text());
        el.text(el.data("text-swap"));
      }
  });
});