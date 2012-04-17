# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#search_btn').click ->
    window.location.href="/chronicles/"+ $("#search").val();
$ ->  
  $('#search').keypress ->
    code = 0
    code = event.keyCode
    if code == 13 
      window.location.href="/chronicles/"+ $("#search").val();