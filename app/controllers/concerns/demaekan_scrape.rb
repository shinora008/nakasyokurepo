require 'open-uri'
    require 'nokogiri'
  
    

      url = 'https://demae-can.com/search/delivery/40133054005'
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)

     
     @shop = doc.css(".shop_img > img > @src, @alt")

      p @shop
      
      # @shop = []
 
      # doc.css(".shop").each do |node|
      #   @shop << node.css('img')
      # end
      
      
      # p @shop[0].size
    