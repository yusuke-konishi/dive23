# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
     $('.admin-questions #question-tags').tagit
       fieldName:   'question[tag_list]'
       singleField: true
     if gon.question_tags?
       baka = gon.question_tags
       $('#question-tags').tagit
          availableTags: baka
