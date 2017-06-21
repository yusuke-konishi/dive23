class AnswerVotesController < ApplicationController

  def plus
    answer = Answer.find(params[:answer_id])
    answer_vote = answer.answer_votes.find_by(user_id: current_user.id)

    if answer_vote.blank?
      answer_vote = current_user.answer_votes.build(answer_id: params[:answer_id])
      answer_vote.vote_state = 1
      answer_vote.save

      answer.vote_count = answer.vote_count + 1
      answer.save

      redirect_to question_path(answer.question), notice: "回答に +1 投票しました"
    else
      if answer_vote.vote_state == 0
        answer_vote.vote_state = 1
        answer_vote.save

        answer.vote_count = answer.vote_count + 1
        answer.save

        redirect_to question_path(answer.question), notice: "回答に +1 投票しました"
      elsif answer_vote.vote_state == -1
        answer_vote.vote_state = 0
        answer_vote.save

        answer.vote_count = answer.vote_count + 1
        answer.save

        redirect_to question_path(answer.question), notice: "回答の投票をリセットしました"
      else # answer_vote.vote_state == 1
        redirect_to question_path(answer.question), notice: "同じ回答に 2 回以上 +1 投票することはできません"
      end
    end
  end

  def minus
    answer = Answer.find(params[:answer_id])
    answer_vote = answer.answer_votes.find_by(user_id: current_user.id)

    if answer_vote.blank?
      answer_vote = current_user.answer_votes.build(answer_id: params[:answer_id])
      answer_vote.vote_state = -1
      answer_vote.save

      answer.vote_count = answer.vote_count - 1
      answer.save

      redirect_to question_path(answer.question), notice: "回答に -1 投票しました"
    else
      if answer_vote.vote_state == 0
        answer_vote.vote_state = -1
        answer_vote.save

        answer.vote_count = answer.vote_count - 1
        answer.save

        redirect_to question_path(answer.question), notice: "回答に -1 投票しました"
      elsif answer_vote.vote_state == 1
        answer_vote.vote_state = 0
        answer_vote.save

        answer.vote_count = answer.vote_count - 1
        answer.save

        redirect_to question_path(answer.question), notice: "回答の投票をリセットしました"
      else # answer_vote.vote_state == -1
        redirect_to question_path(answer.question), notice: "同じ回答に 2 回以上 -1 投票することはできません"
      end
    end
  end
end
