# frozen_string_literal: true

class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]


  def index
    @shop = Shop.all
    @user = User.all
  end

  def new
    @shop = Shop.new
    2.times { @shop.reports.build}
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = '店舗登録完了しました！'
      redirect_to shop_path(@shop)
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = '店舗情報が更新されました！'
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def destroy; end

  private


    end

    def shop_params
      params.require(:shop).permit(:shopname, :shopaddress, :opening_hour, :service, reports_attributes:[:dishname, :price] )
    end

  def shop_params
    params.require(:shop).permit(:shopname, :shopaddress, :opening_hour, :service)
  end
end
