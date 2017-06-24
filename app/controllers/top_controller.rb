class TopController < ApplicationController
  def index
    @question = Question.new
    gon.question_tags = @question.tag_list
  end
end
