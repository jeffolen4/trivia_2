// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", function () {

  $("#index-select").on("change", function (e) {
    document.location.href = "/categories/" + e.currentTarget.selectedOptions[0].value + "/questions"
  });

})
