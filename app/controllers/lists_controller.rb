class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @list.update(list_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def list_params
      params.require(:list).permit(:title).merge(user_id: current_user.id)
    end

    def set_list
      @list = List.find_by(id: params[:id])
    end
end