class AnswersController < ApplicationController

  def upvote_answer
    @answer = Answer.find_by_id(params[:id])
    @answer.update_attribute :upvotes, @answer.upvotes + 1
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:body, :question_id)
    end

end