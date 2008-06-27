function highlightPlayer(player) {
  setPlayerBack(player, "#FFFFCE");
}
function restorePlayer(player) {
  setPlayerBack(player, "");
}

function setPlayerBack(player, color) {
  element = document.getElementById("player_" + player);
  element.style.background= color;
}
