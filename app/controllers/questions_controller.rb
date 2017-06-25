class QuestionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_question_tags_to_gon, only: [:index, :show, :edit]
  before_action :set_available_tags_to_gon, only: [:index, :show, :new, :edit]

  def index
    @questions = Question.all
    @questions = Question.all.includes(:tags)
    gon.question_tags = @questions.map { |q| q.tag_list }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    if params[:back]
      @question = Question.new(questions_params)
      @question_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    else
      @question = Question.new
      @question_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
      gon.question_tags = ActsAsTaggableOn::Tag.all.pluck(:name)
    end
  end

  def create
    @question = Question.new(questions_params)
    @question.user_id = current_user.id
    @question.tag_list = params[:question][:tag_list]
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    binding.pry
    if @question.save
      redirect_to root_path, notice:"投稿されました"
    else
      redirect_to root_path, alert:"未入力の項目があります"
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
    @answer = @question.answers.build
    @answers = @question.answers
  end

  private
    def questions_params
      params.require(:question).permit(:title, :content, :tag_list)
    end
    def set_question
      @question = Question.find(params[:id])
    end

    def set_question_tags_to_gon
    #  gon.question_tags = @question.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Question.tags_on(:tags).pluck(:name)
    end
end
