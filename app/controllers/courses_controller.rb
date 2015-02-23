class CoursesController < ApplicationController
  before_action :authenticate
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :night)
  end
end
