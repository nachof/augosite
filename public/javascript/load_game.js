$(document).ready(function() {
  $('tr.player td.hasgame').click(function() {
    viewsgfurl = $(this).attr('viewsgf');
    $.facebox('<iframe src="' + viewsgfurl + '" height="555" frameborder="0" width="424" scrolling="no" />')
    //$.facebox(function() {
    //  $.get(viewsgfurl, function(data) {
    //      $.facebox(data)
    //  })
    //})
  });
});

