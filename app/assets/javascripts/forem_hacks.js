function foremHacks(){
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
}