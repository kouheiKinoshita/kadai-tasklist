class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in
  
  def index
    @tasks = Task.all.page(params[:page]).per(6)
  end
  
  def show
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "課題が正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "課題が投稿されませんでした"
      render :new
    end
  end
  
  def edit
   
  end
  
  def update
    
    if @task.update(task_params)
      flash[:success] = "課題は正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "課題は更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "課題は正常に削除されました"
    redirect_to tasks_url
  end
  
  private

  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end


  




  



