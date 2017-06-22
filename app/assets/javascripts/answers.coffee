# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#notLogin').click ->
    $('.editor').val('');
    alert 'ログインして下さい'
    return
  $('#myQuestion').click ->
    $('.editor').val('');
    alert '自分の投稿には回答できません'
    return
return
