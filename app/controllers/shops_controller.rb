class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    require 'open-uri'
    require 'nokogiri'


      url = 'https://demae-can.com/search/delivery/40133054005'
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      

      doc = Nokogiri::HTML.parse(html, nil, charset)   
      @shops = []
      @shop_link = []

      
      doc.css("#shop_list_area .shop_img > img").each do |shop_list|
              @shops << shop_list.attributes
      end
      doc.css("#shop_list_area .shop > a").each do |link|
              @shop_link << link.attributes
      end
  end

  def shop
    shop_id = params[:shop_id]
  end

  def menu
    require 'open-uri'
    require 'nokogiri'

#ここのURLは出前館のそれぞれのお店のhrefから取得
      url = 'https://demae-can.com/shop/menu/3004200'
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      

      doc = Nokogiri::HTML.parse(html, nil, charset)   
      @menus = []
      
      doc.css(".item_list > .item > a").each do |menu|
              @menus << menu
      end
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end


  def shop
    shop_id = params[:shop_id]
  end

  
  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      # @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:shopneme, :shopaddress, :opening_hour)
    end

end
