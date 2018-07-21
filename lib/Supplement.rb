class Supplement
  attr_accessor :name, :price, :description, :rating, :availability, :page, :rating_page
  @@supplements = []


  def initialize
    self.save
  end

  def save
    @@supplements << self
  end

  def self.all
    @@supplements
  end 

  def self.supplements_print
    @@supplements.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - #{s.price} - #{s.rating} - #{s.availability}
      #{s.description}
      #{s.page} test"
    end
  end

end
