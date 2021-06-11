class CardsController < ApplicationController
  def new
    @card = Card.new
    @list = List.find(params[:id])
  end

  def create
    @card = Card.new(crad_params)
    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def crad_params
      params.require(:card).permit(:title, :memo).merge(list_id: params[:list_id])
    end
end
