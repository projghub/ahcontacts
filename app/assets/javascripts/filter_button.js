var addInputButton = function(toggle_div, id, txt, clk) {
    var btn = $('<a>')
        .text(txt)
        .attr("id", id)
        .addClass("btn")
        .click(clk);
    $("#" + toggle_div).append(btn);
    return btn;
};

$(function() {
  var toggle_id = "toggle_button";
  var box = $("#filter");

  var showBox = function() {
    $("#" + toggle_id).addClass("active");
    box.show();
  };

  var hideBox = function() {
    $("#" + toggle_id).removeClass("active");
    box.hide();
  };

  addInputButton("filter_toggle", toggle_id, "Filter", function(event) {
    if ($('#' + toggle_id).hasClass("active") === false) {
      showBox();
    } else {
      hideBox();
    }
  });

  hideBox();

});
