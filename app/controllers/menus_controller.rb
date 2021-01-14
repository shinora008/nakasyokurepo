class MenusController < ApplicationController
  def new
  end

  def show
  endq

  def index
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
end
