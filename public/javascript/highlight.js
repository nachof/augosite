$(document).ready(function() {
  $('tr.player td.round').mouseover(function() {
    if ((other_id = parseInt($(this).text())) != 'NaN') {
      $('tr#player_' + other_id).addClass('highlighted');
    }
    $(this).parent().addClass('highlighted');
  });
  $('tr.player td.round').mouseout(function() {
    if ((other_id = parseInt($(this).text())) != 'NaN') {
      $('tr#player_' + other_id).removeClass('highlighted');
    }
    $(this).parent().removeClass('highlighted');
  });
});
