class QuizzesController < ApplicationController

  layout "admin"
  before_action :find_user
  before_action :authorize

  def index
    @quizzes = Quiz.where(:user_id => current_user.id).sorted
  end

  def show
     @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new({:title => "New Quiz", :user_id => current_user.id})
  end

  def create

    @quiz = Quiz.new(quiz_params)
    # @quiz.number_of_questions += 1
    if @quiz.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Quiz created successfully."
      #redirect_to user_quizzes_path(:user_id => @user.id)
      redirect_to user_quiz_path(:id => @quiz.id, :user_id => current_user.id)
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:notice] = "Oops! Something went wrong. Please try again."
      render('new')
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(quiz_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Quiz updated successfully."
      redirect_to user_quiz_path(@user, :id => @quiz.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @quiz = Quiz.find(params[:id])
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:notice] = "Quiz destroyed successfully."
    redirect_to user_quizzes_path
  end

  def next_questnum(quiz) # to be deleted if not used
    next_questnum = @quiz.questions.count + 1
  end

  private

    def quiz_params
      # same as using "params[:quiz]", except that it:
      # - raises an error if :quiz is not present
      # - allows listed attributes to be mass-assigned
      params.require(:quiz).permit(:title, :number_of_questions, :difficulty_level, :question_text, :answer, :id, :user_id)
    end

    def find_user
      if params[:user_id]
        @user = User.find(current_user.id)
      end
    end



end
