class WordsController < ApplicationController

  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @words = @category.words
      if params[:status].present?
        if params[:status] == "learned"
          @words = @words.learned current_user
        else params[:status] == "not_learned" 
          @words = @words.not_learned current_user
        end
      end
    
    elsif params[:status].present? && params[:category_id].nil?
      if params[:status] == "learned"
        @words = Word.learned current_user
      else params[:status] == "not_learned" 
        @words = @words.not_learned current_user
      end

    else params[:status].nil? && params[:category_id].nil?
      @words = Word.all 
    end

  end

end
