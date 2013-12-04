class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(params[:list]) 
    
    if @list.save 
      redirect_to @list
    else
      render 'new'
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(params[:list])
      redirect_to @list
    else
      render 'edit'
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to @list
  end
  
end
