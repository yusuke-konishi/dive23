class Counter
  attr_accessor :questions, :answers, :users, :HasAnswer
  def initialize
    @questions =  Question.count
    @answers =  Answer.count
    @users = User.count
    @HasAnswer = (Answer.select(:question_id).uniq.count.to_f / Question.count.to_f * 100).floor
  end
end
