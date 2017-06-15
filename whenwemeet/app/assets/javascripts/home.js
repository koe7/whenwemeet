$(document).ready(function() {
  $("div.bhoechie-tab-menu>div.list-group>form").click(function(e) {
    e.preventDefault();
    $(this).siblings('form.active').removeClass("active");
    $(this).addClass("active");
    var index = $(this).index();
    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");

    if ($(this).data('groupid')) {
      $('<form action="/time/get_common" method="GET"/>')
          .append($('<input type="hidden" name="group_id" value="' + $(this).data('groupid') + '">'))
          .appendTo($(document.body)) //it has to be added somewhere into the <body>
          .submit();
    } else {
      window.location.replace('/')
    }

  });
});
