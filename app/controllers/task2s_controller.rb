class Task2sController < ApplicationController
 def index
  @task2s=Task2.all
 end
 def new
  @task2=Task2.new
 end
 def show
     @task2=Task2.find(params[:id])
 end
 def edit
 end
 def create
   @task2 = Task2.new(task2_params)
     if @task2.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task2
     else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
     end
 end
 def update
   @task2 = Task2.find(params[:id])

    if @task2.update(task2_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task2
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
 end
 def destroy
  @task2=Task2.find(params[:id])
  @task2.destroy
  flash[:success] = 'Taskは正常に削除されました'
  redirect_to task2s_url
  
 end
 private

  # Strong Parameter
  def task2_params
    params.require(:task2).permit(:content)
  end
end
