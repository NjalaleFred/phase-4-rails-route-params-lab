class StudentsController < ApplicationController

  def index
    if params[:name].present?
      students = Student.where("first_name LIKE :name OR last_name LIKE :name", name: "#{params[:name]}")
    else
      students = Student.all
    end

    render json: students
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

end
