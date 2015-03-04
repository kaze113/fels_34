class LessonsController < ApplicationController
  before_action :check_correct, only: [:show]

  def show
    @lesson = Lesson.find params[:id]
    @category = Category.find @lesson.category_id
    @results = @lesson.results
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.create lesson_params
      ids = Word.create_20_questions(@category).pluck(:id)
      @lesson.update_attributes word_ids: ids     
    if @lesson.save
      redirect_to edit_lesson_path @lesson
    else
      render 'new' 
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
    @category = Category.find @lesson.category_id
    @results = @lesson.results
    @questions = @lesson.words.paginate page: params[:page], per_page: 1
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    @lesson = Lesson.find params[:id]
    @results = @lesson.results
    if @lesson.update_attributes result_params
      redirect_to lesson_path @lesson
    end
  end 

  private
    def lesson_params
      params.require(:lesson).permit :user_id
    end

    def result_params
      params.require(:lesson).permit results_attributes: [:id, :definition_id]
    end

    def check_correct
      @lesson = Lesson.find(params[:id])
      @results = @lesson.results
      @results.each do |result|
        if result.definition == result.word.definitions.correct
          result.update_attributes correct: true
        end
      end 
    end

end
