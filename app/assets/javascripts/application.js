// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require coin-slider.min
//= require_tree .

$(document).ready(function(){
  var isForums = window.location.pathname.match(/^\/forums/);
  if(isForums){
    $(".centered_content").addClass("forem_hacks");
    $(".centered_content table").addClass("table table-striped");
    $(".centered_content input[type='submit']").addClass("btn btn-primary").wrap("<div class='form-actions'/>");
    $(".centered_content form").addClass("form-horizontal span7 well").wrap("<div class='row-fluid'/>");;

    $(".centered_content menu a").addClass("btn btn-primary");

    $(".centered_content #posts .post").addClass("row-fluid");
    $(".centered_content #posts .post .user").addClass("span1");
    $(".centered_content #posts .post .contents").addClass("span10");
    $(".centered_content #posts .post .contents ul.actions li").addClass("btn btn-mini");
  }
});