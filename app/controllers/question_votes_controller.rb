class QuestionVotesController < ApplicationController
  def plus
    @question_vote = current_user.question_votes.build(question_id: params[:question_id])
    @question_vote.vote_state = 1
    @question_vote.save

    @question_vote.question.vote_count = @question_vote.question.vote_count + 1
    @question_vote.question.save

    redirect_to question_path(@question_vote.question), notice: "#{@question_vote.question.user.name} さんの質問に +1 投票しました"
  end

  def minus
  end
end
