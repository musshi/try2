class TasksController < ApplicationController
  def create
      @list = current_user.lists.find(params[:list_id])
      @task = @list.tasks.create(params[:task])
      # redirect_to list_path(@list)
      @tasks = @list.tasks.where(:completed => false)
      render "lists/tasks_not_completed", :layout => false
  end
  
  def destroy
      @list = current_user.lists.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
      @task.destroy
      redirect_to list_path(@list)
  end
  
  def update_status
    # if user_signed_in? 
    #       puts "okay"
    #     else
    #       puts "why not login"
    #     end    
    # @list = List.find(params[:list_id])
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.completed =  !@task.completed
    @task.save
    render :text => "successful"
  end  
end
