// ==UserScript==
// @name        youtube
// @namespace   3895476298789253247
// @include     https://www.youtube.com/
// @include     https://www.youtube.com/?disable_polymer=1
// @version     1
// @grant       none
// ==/UserScript==

document.getElementById("header").remove();
document.getElementById("masthead-positioner").remove();
document.getElementById("content").style.top = "-50px"
document.getElementById("footer-container").remove();
// document.body.style.background = "#111"
// document.getElementsByClassName("   yt-card  clearfix")[0].style.background = "#1a1a1a"
//
// var lockup = document.getElementsByClassName("yt-lockup")
// for (index = lockup.length - 1; index >= 0; index--) {
// 	lockup[index].style.color = "#fff";
// }	
//
// var ellipsis = document.getElementsByClassName("yt-ui-ellipsis")
// for (index = ellipsis.length - 1; index >= 0; index--) {
// 	ellipsis[index].style.background = "#1a1a1a";
// 	ellipsis[index].style.color = "#fff";
// }	
//
// var button = document.getElementsByClassName("yt-uix-button")
// for (index = button.length - 1; index >= 0; index--) {
//     button[index].style.background = "#1a1a1a";
// }
//
// var button = document.getElementsByClassName("yt-uix-button-icon yt-uix-button-icon-dismissal yt-sprite")
// for (index = button.length - 1; index >= 0; index--) {
//     button[index].style.background = "#1a1a1a";
// }

// yt-lockup-byline yt-ui-ellipsis yt-ui-ellipsis-2 -- the same as yt-lockup color

// yt-lockup color: #fff
// yt-ui-ellipsis background-color: #1a1a1a
// yt-lockup-title  color: #af5fd7;
//
// .yt-uix-shelfslider .yt-uix-shelfslider-prev, .yt-uix-shelfslider .yt-uix-shelfslider-next background: #1a1a1a;
