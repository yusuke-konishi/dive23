class TopController < ApplicationController
  def index
    
    @questions =  Question.last(14)
    @counter = Counter.new
    @question = Question.new
    gon.question_tags = @question.tag_list

  end
end
