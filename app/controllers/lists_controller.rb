class ListsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:tasks_is_completed, :tasks_not_completed]
  
  def index
    @lists = current_user.lists
  end
  
  def new
    @list = current_user.lists.new

  end
    
  def create
    @list = current_user.lists.new(params[:list]) 
    
    if @list.save 
      redirect_to @list
    else
      render 'new'
    end
  end
  
  def show
    @list = current_user.lists.find(params[:id])
    @reorder = false
  end
  
  def edit
    @list = current_user.lists.find(params[:id])
  end
  
  def update
    @list = current_user.lists.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render 'edit'
    end
  end
  
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to @list
  end
  
  def tasks_is_completed
    @list = List.find(params[:id])
    @tasks = @list.tasks.where(:completed => true)
    render :layout => false
  end  
  
  def tasks_not_completed
    @list = List.find(params[:id])
    @tasks = @list.tasks.where(:completed => false)
    render :layout => false
  end  
  
  def tasks_not_completed_reorder
    @list = List.find(params[:id])
    @tasks = @list.tasks.where(:completed => false)
    @reorder = true
    render "lists/show"
  end  
  
  def update_position_tasks
    tasks_attributes = {}
    @list = current_user.lists.find(params[:id].to_i)
    puts params.inspect
    # params.delete("id")
    # params.delete("action")
    # params.delete("controller")
    # tasks_attributes["tasks_attributes"] = params[:list]    
    @list.update_attributes(params[:list])
    render :text => "successful"
  end
end
