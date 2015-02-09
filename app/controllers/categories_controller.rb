class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category created!"
      redirect_to @category
    else
      render 'new'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted!"
    redirect_to root_url
  end

  private
  
    def category_params
      params.require(:category).permit(:title, :intro)
    end

end
