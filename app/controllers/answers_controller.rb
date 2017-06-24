class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question
    respond_to do |format|
      if @answer.save
        format.js { render :index }
      else
        format.js { render :new }
      end
    end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render :index
  end
  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end
end
