class Admin::WordsController < ApplicationController
  layout "admin"

  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find params[:category_id]
      @words = @category.words
    else
      @words = Word.all
    end
  end

  def new
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
