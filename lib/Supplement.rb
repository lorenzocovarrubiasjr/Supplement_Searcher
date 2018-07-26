class Supplement
  attr_accessor :name, :price, :description, :rating, :availability, :page, :rating_page
  @@all = []


  def initialize(availability="Not In Stock", price="Price Not Listed")
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

  def self.supplements_print
    puts "------------------------------------------"
    @@all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - #{s.price} - #{s.rating} - #{s.availability}"
    end
    puts "------------------------------------------"
  end

  def self.topten
    topten = @@all.sort_by {|supplement| supplement.rating}.reverse
    puts "Top 10 Products
    --------------------------------------------"
    n = 1
    topten[0..9].each do |s|
      puts "#{n}.  #{s.name} - Rating: #{s.rating}"
      n = n + 1
    end
  end

  def self.price_lowtohigh
    lowtohigh = @@all.sort_by {|supplement| supplement.price}
    puts "Products Sorted by Price: Low to High
    -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
    n = 1
    lowtohigh[0..-1].each do |s|
      puts "#{n}. #{s.name} - Price: #{s.price} - #{s.availability}"
      n = n + 1
    end
  end

  def self.display_product(users_choice)
    product = self.all[users_choice.to_i - 1]
    puts "  Product: #{product.name}
    Rating: #{product.rating}
    Price: #{product.price} - #{product.availability}
    Description: #{product.description}"
  end

end
