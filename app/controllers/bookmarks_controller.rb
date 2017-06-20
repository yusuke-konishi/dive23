class BookmarksController < ApplicationController

  def create
    @question = Question.find(params[:bookmark][:question_id])
    @bookmark = Bookmark.new(user_id: current_user.id, question_id: @question.id)
    respond_to do |format|
      if @bookmark.save
         @question.reload
         format.js
      else
         format.html { redirect_to question_path(@question) }
      end
    end
  end

  def destroy
    @question = Question.find(params[:bookmark][:question_id])
    @bookmark = Bookmark.find_by(user_id: current_user.id, question_id: @question.id)
    respond_to do |format|
      if @bookmark.destroy
         @question.reload
         format.js
      else
         format.html { redirect_to question_path(@question) }
      end
    end
  end
end
