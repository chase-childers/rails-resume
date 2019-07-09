// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var contact_height = document.getElementById("contact_pos").getBoundingClientRect().top
  offset = contact_height - (document.body.getBoundingClientRect().top + screen.height)
  if (document.documentElement.scrollTop > offset) {
      console.log("Expand")
      document.getElementById("contact_bar").className = "non_contact"
  } else {
      console.log("Contract")
      document.getElementById("contact_bar").className = "contact"
  }
}