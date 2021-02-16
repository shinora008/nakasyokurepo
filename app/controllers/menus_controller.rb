# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :logged_in_user

  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def index
    @menus = Menu.all
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = 'メニュー登録完了しました'
      redirect_to menus_url
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update_attributes
      menu_params
      flash[:success] = 'メニューを更新しました'
      redirect_to @menu
    else
      render 'edit'
    end
  end

  def destroy; end

  private

  def menu_params
    params.require(:menu).permit(:dish_name, :price, :shop_id)
  end
end
