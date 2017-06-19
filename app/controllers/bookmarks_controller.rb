class BookmarksController < ApplicationController
  before_action :set_question

  def create
    @bookmark = current_user.bookmarks.build(question_id: @question.id)
    @question = @bookmark.question
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private
    def set_question
      @question = Question.find(params[:bookmark][:question_id])
    end
end
