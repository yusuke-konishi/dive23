class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_question_tags_to_gon, only: [:index, :show, :edit]
  before_action :set_available_tags_to_gon, only: [:index, :show, :new, :edit]
  helper_method :sort_column, :sort_direction

  def index
    @questions = Question.index_all.page(params[:page]).order(sort_column + ' ' + sort_direction).includes(:tags)
    gon.question_tags = @questions.map { |q| q.tag_list }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    authenticate_user!
    if params[:back]
      @question = Question.new(questions_params)
      @question_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
    else
      @question = Question.new
      gon.question_tags = ActsAsTaggableOn::Tag.all.pluck(:name)
    end
  end

  def create
    @question = Question.new(questions_params)
    @question.user_id = current_user.id
    @question.tag_list = params[:tags]
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
      params.require(:question).permit(:title, :content, :tag_list)
    end
    def set_question
      @question = Question.find(params[:id])
    end

    def sort_column
      Question.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def set_question_tags_to_gon
    #  gon.question_tags = @question.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Question.tags_on(:tags).pluck(:name)
    end
end
