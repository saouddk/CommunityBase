class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find_by_id(params[:id])
    @answers = @question.answers.order('upvotes DESC')

    @question.update_attribute :views, @question.views + 1
  end

  def similar_questions
    @questions = nil

    if params[:subject] && !params[:subject].strip.empty?
      questions_table = Question.arel_table
      @questions = Question.all
      @questions = @questions.where(questions_table[:keywords].matches("%#{params[:subject].to_s.downcase}%"))
    end

    render json: @questions
  end

  private

    def question_params
      params.require(:question).permit(:subject, :body)
    end

end