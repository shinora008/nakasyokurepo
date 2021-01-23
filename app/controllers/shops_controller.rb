class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @shop = Shop.new
  end

  def show
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "店舗登録完了しました！"
      redirect_to @shop
    else
      render "new"
    end
  end

  def shop
    shop_id = params[:shop_id]
  end


  def update
  end


  def destroy
  end

  private
   
    def set_shop

    end

    def shop_params
      params.require(:shop).permit(:shopname, :shopaddress, :opening_hour, :service)
    end

end
