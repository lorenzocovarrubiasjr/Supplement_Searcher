class Supplement
  attr_accessor :name, :price, :description, :rating, :availability, :page, :rating_page
  @@all = []
  @@topten = []
  @@price_lowtohigh = []



  def initialize(availability="Out of Stock", price="Price Not Listed")
    self.save
    @availability = availability
    @price = price
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.topten
    @@topten
  end

  def self.price_lowtohigh
    @@price_lowtohigh
  end

  def self.supplements_print
    puts "
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
              Product List
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

"
    @@all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - $#{s.price} - #{s.rating} - #{s.availability}"
      sleep(0.1)
    end
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
  end

  def self.create_topten
    @@topten = @@all.sort_by {|supplement| supplement.rating}.reverse[0..9]
    puts "
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
              Top 10 Products
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"
    n = 1
    @@topten[0..9].each do |s|
      puts "#{n}.  #{s.name} - Rating: #{s.rating}"
      n = n + 1
      sleep(0.1)
    end
  end

  def self.create_price_lowtohigh
    price_not_listed = []
    price_listed = []
    @@all.each {|supplement| if supplement.price == "Price Not Listed"
    price_not_listed << supplement
    else
    price_listed << supplement
    end}
    price_listed = price_listed.sort_by {|supplement| supplement.price}

    @@price_lowtohigh = price_listed + price_not_listed
    puts "
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
    Products Sorted by Price: Low to High
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
"
    n = 1
    @@price_lowtohigh [0..-1].each do |s|
      if s.price == "Price Not Listed"
        puts "#{n}. #{s.name} - Price: Not Listed - #{s.availability}"
      else
      puts "#{n}. #{s.name} - Price: $#{s.price} - #{s.availability}"
      end
      n = n + 1
      sleep(0.1)
    end
  end

  def self.display_product(array, users_choice)
    if array == "topten"
      product = self.topten[users_choice.to_i - 1]
    elsif array == "all"
      product = self.all[users_choice.to_i - 1]
    elsif array == "price_lowtohigh"
      product = self.price_lowtohigh[users_choice.to_i - 1]
    end
    puts "  -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
    sleep(0.2)
    puts "
    --------------- #{product.name} ---------------"
    sleep(0.2)
    puts "Rating:     #{product.rating}"
    sleep(0.2)
    puts "Price:    $#{product.price}"
    sleep(0.2)
    puts "Availability:    #{product.availability}"
    sleep(0.2)
    puts "URL:   #{product.page}"
    sleep(0.2)
    puts "
    -------------- Description --------------
    #{product.description}
    "
    sleep(0.2)
    puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_--_-_-_-_-

    "
  end

end
