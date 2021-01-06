require 'open-uri'
require 'nokogiri'
  
    

      url = 'https://www.ubereats.com/jp/feed?pl=JTdCJTIyYWRkcmVzcyUyMiUzQSUyMiVFNSU4RCU5QSVFNSVBNCU5QSVFOSVBNyU4NSUyMiUyQyUyMnJlZmVyZW5jZSUyMiUzQSUyMkNoSUpkYlA1NXNlUlFUVVJrSXU1UlQwcjRpNCUyMiUyQyUyMnJlZmVyZW5jZVR5cGUlMjIlM0ElMjJnb29nbGVfcGxhY2VzJTIyJTJDJTIybGF0aXR1ZGUlMjIlM0EzMy41OTA0OTU2JTJDJTIybG9uZ2l0dWRlJTIyJTNBMTMwLjQxOTUwODklN0Q%3D'

      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)

     
      doc.css(".shop_img > img > @src, @alt")

      
     
    