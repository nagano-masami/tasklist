class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def show
    @task=Task.find(params[:id])
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

  def edit
    @task=Task.find(params[:id])
  end

  def update
    @task=Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success]='Task は正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger]='Task は登録されませんでした'
      render :edit
    end
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy

    flash[:success]='Task は正常に削除されました'
    redairect_to tasks_url
  end
end

private

#Strong Parameter
def task_params
  params.require(:task).permit(:content)
end
