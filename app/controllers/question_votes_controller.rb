class QuestionVotesController < ApplicationController
  before_action :check_question_vote

  def plus
    if @question_vote.blank?
      @question_vote = current_user.question_votes.build(question_id: params[:question_id])
      question_vote_save(1, 1)
    else
      if @question_vote.vote_state == 0
        question_vote_save(1, 1)
      elsif @question_vote.vote_state == -1
        question_vote_save(0, 1)
      else # @question_vote.vote_state == 1
        redirect_to question_path(@question), notice: "同じ質問に 2 回以上 +1 投票することはできません"
      end
    end
  end

  def minus
    if @question_vote.blank?
      @question_vote = current_user.question_votes.build(question_id: params[:question_id])
      question_vote_save(-1, -1)
    else
      if @question_vote.vote_state == 0
        question_vote_save(-1, -1)
      elsif @question_vote.vote_state == 1
        question_vote_save(0, -1)
      else # @question_vote.vote_state == -1
        redirect_to question_path(@question), notice: "同じ質問に 2 回以上 -1 投票することはできません"
      end
    end
  end

  private
    def check_question_vote
      @question = Question.find(params[:question_id])
      @question_vote = @question.question_votes.find_by(user_id: current_user.id)
      @user = @question.user
    end

    def question_vote_save(state, count)
      @question_vote.vote_state = state
      @question_vote.save

      @question.vote_count = @question.vote_count + count
      @question.save

      @user.reputation_count = @user.reputation_count + count
      @user.save

      if state == 0
        redirect_to question_path(@question), notice: "質問の投票をリセットしました"
      else
        redirect_to question_path(@question), notice: "質問に #{count == 1 ? "+1" : "-1"} 投票しました"
      end
    end
end
