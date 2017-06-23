class TopController < ApplicationController
  def index
    @questions =  Question.last(14)
    @questions_count = Question.count
    @answers_count = Answer.count
    @users_count = User.count
    @HasAnswer = (Answer.select(:question_id).uniq.count.to_f / Question.count.to_f * 100).floor
  end
end
