// JavaScript Document
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
  var msViewportStyle = document.createElement("style")
  msViewportStyle.appendChild(
    document.createTextNode(
      "@-ms-viewport{width:auto!important}"
    )
  )
  document.getElementsByTagName("head")[0].appendChild(msViewportStyle)
}

jQuery(document).ready(function($) {
    $('.carousel').carousel({
        interval:   5000,
        pause:      "hover",
        wrap:       true
  })
});

jQuery(document).ready(function($){
  $('#xoopsgrid').masonry({ singleMode: true });
});

/* Newbb Forms (Honestly hope this works well...) */
jQuery(document).ready(function($){
    /* Bootstrap Style: Horizontal Form */
    $(".xoopsform").find('form').addClass("form-inline");
    $(".xoopsform").find('select').addClass("form-control");
    $(".xoopsform").find('input[type="submit"]').addClass("btn btn-primary");
});
