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
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @course.update_attributes(course_params)
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def destroy
    if @course.destroy
      redirect_to courses_path, notice: 'Course successfully destroyed'
    end
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :night)
  end
end
