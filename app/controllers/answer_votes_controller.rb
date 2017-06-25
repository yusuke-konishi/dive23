class AnswerVotesController < ApplicationController
  before_action :check_answer_vote

  def plus
    if @answer_vote.blank?
      @answer_vote = current_user.answer_votes.build(answer_id: params[:answer_id])
      answer_vote_save(1, 1)
    else
      if @answer_vote.vote_state == 0
        answer_vote_save(1, 1)
      elsif @answer_vote.vote_state == -1
        answer_vote_save(0, 1)
      else # @answer_vote.vote_state == 1
        redirect_to question_path(@answer.question), notice: "同じ回答に 2 回以上 +1 投票することはできません"
      end
    end
  end

  def minus
    if @answer_vote.blank?
      @answer_vote = current_user.answer_votes.build(answer_id: params[:answer_id])
      answer_vote_save(-1, -1)
    else
      if @answer_vote.vote_state == 0
        answer_vote_save(-1, -1)
      elsif @answer_vote.vote_state == 1
        answer_vote_save(0, -1)
      else # @answer_vote.vote_state == -1
        redirect_to question_path(@answer.question), notice: "同じ回答に 2 回以上 -1 投票することはできません"
      end
    end
  end

  private
    def check_answer_vote
      @answer = Answer.find(params[:answer_id])
      @answer_vote = @answer.answer_votes.find_by(user_id: current_user.id)
      @user = @answer.user
    end

    def answer_vote_save(state, count)
      @answer_vote.vote_state = state
      @answer_vote.save

      @answer.vote_count = @answer.vote_count + count
      @answer.save

      @user.reputation_count = @user.reputation_count + count
      @user.save

      if state == 0
        redirect_to question_path(@answer.question), notice: "回答の投票をリセットしました"
      else
        redirect_to question_path(@answer.question), notice: "回答に #{count ==1 ? "+1" : "-1" } 投票しました"
      end
    end
end
