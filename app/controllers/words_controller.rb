class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @words = @category.words
    else
      @words = Word.all
    end
  end

end
