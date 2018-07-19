 class SupplementScraper
   attr_accessor :doc, :supplement


   def initialize
     @supplement = Supplement.new
     @doc = Nokogiri::HTML(open("https://www.globalhealingcenter.com/supplements.html"))
   end

   def scrape_supplements
     @doc.search(doc.search("#products-list div.clearfix"))[0..-1].each do |supplement_tab|
       s = Supplement.new
       s.name = supplement_tab.search("div h4 a").text
       s.price = supplement_tab.search("span.regular-price").text.strip
       s.description = supplement_tab.search("div.sm-col p")[1].text.strip
       s.page = supplement_tab.search("div.sm-col b a").attr("href").text
       s.rating_page = Nokogiri::HTML(open(s.page)).search("#product_addtocart_form > div.product-name.sm-hide.md-hide.lg-hide.px2 > a:nth-child(4)").attr("href").text
       s.rating = Nokogiri::HTML(open(s.rating_page)).search("#product-reviews-info > div > p span.review-rating-literal").text.gsub(/[()]/,"")
       s.availability = Nokogiri::HTML(open(s.page)).search("#product_addtocart_form > div.product-shop.sm-col.sm-col-8.md-col-7.px2 > p.availability.in-stock.m0 > span").text

   end

 end
