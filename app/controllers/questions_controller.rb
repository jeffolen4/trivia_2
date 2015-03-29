require 'form_helper'

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @categories = Category.all.map{|u| [ u.name, u.id ] }
    if params[:category_id] == nil
      @category = Category.first
    else
      @category = Category.find(params["category_id"])
    end
    # raise "category: #{@categories.first.inspect}"
    @questions = Question.includes(:answers, :hints, :category).where("category_id = ?", @category ).page params[:page]
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @categories = Category.all.map{|u| [ u.name, u.id ] }
    @question = Question.new
    # raise "question: #{@question.inspect}"
  end

  # GET /questions/1/edit
  def edit
    @categories = Category.all.map{|u| [ u.name, u.id ] }
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    # @question.category_id =
    respond_to do |format|
      if @question.save
        format.html { redirect_to category_questions_path(@category.id), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to category_questions_path(@category.id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to category_questions_path(@category.id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit( :id, :question, :category_id, :active, answers_attributes: [:answer, :is_correct, :id ], hints_attributes: [:hint, :id] )
    end
end
