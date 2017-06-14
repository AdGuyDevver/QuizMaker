class QuestionsController < ApplicationController
# See also QuestionsHelper

  layout "admin"
  before_action :find_quiz
  before_action :authorize

  def index
    @questions = Question.sorted
  end

  def new
    @question = Question.new(:quiz_id => @quiz.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.create(question_params)

    if @question.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Question created successfully."
      redirect_to user_quiz_path(:id => @quiz.id, :user_id => current_user.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated successfully"
      redirect_to user_quiz_questions_path
    else
      flash[:notice] = "Something went wrong"
      render 'edit'
    end
  end

  def delete
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question has been deleted"
    redirect_to user_quiz_path(:id => @quiz.id)
  end

  private

    def question_params
      params.require(:question).permit(:number, :question_text, :question_type, :answer, :quiz_id)
    end

    def find_quiz
      if params[:quiz_id]
        @quiz = Quiz.find(params[:quiz_id])
      end
    end

end
