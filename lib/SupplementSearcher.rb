require "SupplementSearcher/version"

#module SupplementSearcher
#end


class SupplementSearcherController
  def initialize
    puts "___________________$
          __________________$$$
          ________________$$$$$$$$
          ______________$$$$$$$$$$$$$
          ___________$$$$$$$$$$$$$$$$$$
          ________$$$$$$$$$$$$$$$$$$$$$$$
          _____$$$$$$$$$___$$$$$$$$$$$$$$$$$
          _$$$$$$$$$$$$$$$___$$$$$$$$$$$$$$$$$$
          $$$$$$$$$$$$$$$$$$ _____$$$$$$$$$$$$$$$$
          ___$$$$$$$$$$$$$$$$$$_______$$$$$$$$
          ______$$$$$$$$$$$$$$$$$
          _________$$$$$$$$$$$$$$$$$
          ___________$$$$$$$$$$$$$$$$$$
          ______________$$$$$$$$$$$$$$$$$
          ____$$$$$$_______$$$$$$$$$$$$$$$$$
          $$$$$$$$$$$$$$_____$$$$$$$$$$$$$$$$$
          _$$$$$$$$$$$$$$$$$___$$$$$$$$$$$$$$$$
          ____$$$$$$$$$$$$$$$$$___$$$$$$$$$$$
          _______$$$$$$$$$$$$$$$$_$$$$$$$$
          _________$$$$$$$$$$$$$$$$$$$$
          ___________$$$$$$$$$$$$$$$
          ______________$$$$$$$$$$
          ________________$$$$$$
          __________________$$


               Welcome to Supplement Searcher!

              Your CLI Destination to shop and compare supplements!

      Would you like to:
      1) See all products?"


      users_choice = gets.chomp

        if users_choice == "1"
          s = SupplementScraper.new
          Supplement.supplements_print
        end
    end

  end
