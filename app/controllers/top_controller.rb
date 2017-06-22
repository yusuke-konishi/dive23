class TopController < ApplicationController
  def index
    @questions = Question.all
  end
end
