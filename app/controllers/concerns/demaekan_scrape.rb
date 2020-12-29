  require 'open-uri'
  require 'nokogiri'



    url = 'https://demae-can.com/search/delivery/40133054005'

    doc = Nokogiri::HTML(open(url))

    
    # doc.css('p.shop_name').each do |link|
    #   p link.content
    # end

  doc.css('.shop').each do |node|
      p node.css('.shop_name').inner_text
      p node.css('img').attribute('src').value
  end