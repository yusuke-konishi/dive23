class TopController < ApplicationController
  def index
    @questions = Question.all
    @answers = Answer.all
    @users = User.all
  end
end
