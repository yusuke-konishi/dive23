class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    authenticate_user!
    if params[:back]
      @question = Question.new(questions_params)
      @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    else
      @question = Question.new
    end
  end

  def create
    @question = Question.new(questions_params)
    @question.user_id = current_user.id
    @question.tag_list = params[:question][:tag_list]
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    if @question.save
      redirect_to questions_path, notice:"投稿されました"
    else
      @question = Question.new(questions_params)
    end
  end

  def edit
  end

  def update
    @question.update(questions_params)
    redirect_to questions_path, notice:"投稿を更新しました"
  end

  def destroy
    @question.destroy
    redirect_to root_path, alert:"投稿を削除しました"
  end

  def show
    authenticate_user!
    @answer = @question.answers.build
    @answers = @question.answers
  end

  private
    def questions_params
      params.require(:question).permit(:title,:content,:tag_list)
    end
    def set_question
      @question = Question.find(params[:id])
    end
end
