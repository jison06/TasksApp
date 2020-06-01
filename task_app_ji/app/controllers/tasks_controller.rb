class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  # POST
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Successfully created a new task'
      redirect_to root_path
    else
      flash[:danger] = 'Failed to create task'
      render 'new'
    end
  end

  # GET
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Successfully updated a new task'
      redirect_to root_path
    else
      flash[:danger] = 'Failed to update task'
      render 'edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion)
  end
end
