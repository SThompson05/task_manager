class Api::V1::TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def show
    render json: Task.find(params[:id])
  end

  def create
    render json: Task.create(task_params)
  end

  def update
    render json: Task.update(params[:id], task_params)
  end

  def destroy
    render json: Task.delete(params[:id])
  end

  def index
    tasks = Task.all
    render json: TaskSerializer.format_tasks(tasks)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

end