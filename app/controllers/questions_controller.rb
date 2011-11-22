class QuestionsController < ApplicationController

  def index
   @questions = Question.hot 
  end
  
  def show
    @question = Question.find(params[:id])
    @question.views_count += 1
    @question.save
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
    if current_user.id != @question.user_id
      raise  # Nuh uh
    end
  end

  def create
    @question = Question.new(params[:question])
    @user     = current_user
    @question.tags = params[:tags] # Params tags should pass in a string (e.x "noisebridge, discuss, etc") 
    if @question.save
      redirect_to @question
    else
      redirect_to new_question_path 
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.user_id == current_user.id
      # I manually set everything as opposed to update_all
      # because I don't really trust my own attr_accessors
      @question.title = params[:question][:title]
      @question.content = params[:question][:content]
      @question.tags    = params[:question][:tags]
      @question.save
    else
      redirect_to '/'
    end
  end
end
