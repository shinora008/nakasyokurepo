require 'open-uri'
require 'nokogiri'
  
      url = 'https://demae-can.com/search/delivery/40133054005'
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)
      
      @shop_name = []
      @shop_img = []
      
      doc.css("#shop_list_area .shop").each do |node|
        @shop_name << node.css('.shop_name').text
        @shop_img << node.css('img').attribute('data-src')
      end

       @shop = [@shop_name,@shop_img].map{ |a,| a}

       p @shop