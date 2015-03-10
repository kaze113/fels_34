class Admin::WordsController < ApplicationController
  layout "admin"

  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @words = @category.words
      if params[:status].present?
        if params[:status] == "learned"
          @words = @words.learned current_user
        elsif params[:status] == "not_learned" 
          @words = @words.not_learned current_user
        end
      end
    
    elsif params[:status].present? && params[:category_id].nil?
      if params[:status] == "learned"
        @words = Word.learned current_user
      elsif params[:status] == "not_learned" 
        @words = @words.not_learned current_user
      end

    else params[:status].nil? && params[:category_id].nil?
      @words = Word.all 
    end
    
  end

  def new
    @category = Category.find params[:category_id]
    @word = Word.new
    4.times {
      @word.definitions.build
    }
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Word created!"   
      redirect_to admin_words_path
    else
      render 'new'
    end
  end

  def destroy
    @word.destroy
    flash[:success] = "Word deleted!"
    redirect_to admin_words_path
  end

  def edit
  end

  def update
  end

  private

    def word_params
      params.require(:word).permit(:content, :category_id, definitions_attributes: [:word_def, :value])
    end  

end
