class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update]

  def new
    @card = Card.new
    @list = List.find(params[:list_id])
  end

  def create
    @card = Card.new(crad_params)
    if @card.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(crad_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def crad_params
      params.require(:card).permit(:title, :memo).merge(list_id: params[:list_id])
    end

    def set_card
      @card = Card.find(params[:id])
    end
end
