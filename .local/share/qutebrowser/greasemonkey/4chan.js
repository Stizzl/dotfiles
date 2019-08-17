// ==UserScript==
// @name        4chan
// @namespace   273465789236458792
// @include     https://boards.4chan.org/*
// @version     1
// @grant       none
// ==/UserScript==

// window.addEventListener('load', function() {
//      var elem = document.getElementsByTagName("iframe")
//      for (index = elem.length - 1; index >= 0; index--) {
//      elem[index].style.display = "none";
//    }
// }, false);

var elem = document.getElementsByTagName("iframe")
    for (index = elem.length - 1; index >= 0; index--) {
    elem[index].style.display = "none";
}

// document.body.style.background = "#F0F"
document.getElementById("bannerCnt").remove();
document.getElementsByClassName("middlead center")[0].remove();
