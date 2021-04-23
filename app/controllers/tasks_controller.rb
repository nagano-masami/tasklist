class TasksController < ApplicationController
  before_action :set_task,only: [:show, :edit, :update, :destroy]
  def index
    @tasks=Task.all
  end

  def show
    set_task
  end

  def new
    @task=Task.new(content:'今日が人生で一番若い日')
  end

  def create
    @task=Task.new(task_params)

    if @task.save
      flash[:success]='task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger]='task が登録されませんでした'
      render :new
    end
  end

  def edit
    set_task
  end

  def update
    set_task
    
    if @task.update(task_params)
      flash[:success]='Task は正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger]='Task は登録されませんでした'
      render :edit
    end
  end

  def destroy
    set_task
    @task.destroy

    flash[:success]='Task は正常に削除されました'
    redirect_to tasks_url
  end

  private
  #Strong Parameter

  def set_task
    @task=Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end

end
