class TopController < ApplicationController
  def index
    @questions =  Question.last(14)
    @counter = Counter.new
  end
end
