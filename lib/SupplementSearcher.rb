require "SupplementSearcher/version"

#module SupplementSearcher
#end


class SupplementSearcherController

    def initialize
      puts "___________________$"
      sleep(0.5)
      puts "__________________$$$
  ________________$$$$$$$$"
      sleep(0.5)
      puts "______________$$$$$$$$$$$$$
  ___________$$$$$$$$$$$$$$$$$$
  ________$$$$$$$$$$$$$$$$$$$$$$$
  _____$$$$$$$$$___$$$$$$$$$$$$$$$$$"
      sleep(0.5)
      puts " _$$$$$$$$$$$$$$$___$$$$$$$$$$$$$$$$$$
  $$$$$$$$$$$$$$$$$$ _____$$$$$$$$$$$$$$$$
  ___$$$$$$$$$$$$$$$$$$_______$$$$$$$$
  ______$$$$$$$$$$$$$$$$$
  _________$$$$$$$$$$$$$$$$$
  ___________$$$$$$$$$$$$$$$$$$"
      sleep(0.5)
        puts "______________$$$$$$$$$$$$$$$$$
  ____$$$$$$_______$$$$$$$$$$$$$$$$$
  $$$$$$$$$$$$$$_____$$$$$$$$$$$$$$$$$
  _$$$$$$$$$$$$$$$$$___$$$$$$$$$$$$$$$$"
      sleep(0.5)
        puts "____$$$$$$$$$$$$$$$$$___$$$$$$$$$$$
  _______$$$$$$$$$$$$$$$$_$$$$$$$$
  _________$$$$$$$$$$$$$$$$$$$$"
      sleep(0.5)
        puts "___________$$$$$$$$$$$$$$$
  ______________$$$$$$$$$$"
      sleep(0.5)
        puts"________________$$$$$$"
        sleep(0.5)
        puts "__________________$$"
        sleep(0.5)

  puts "

          Welcome to Supplement Searcher!
          "
          sleep(0.5)
  puts "Your CLI Destination to shop and compare supplements!
          "
          sleep(0.5)
          puts "Loading..."

        s = SupplementScraper.new

        self.users_options
      end


      def users_options
        puts "Would you like to:
        1) See all products
        2) See top 10 rated products
        3) List products by price - low to high "

        users_choice = gets.chomp

          if users_choice == "1"
            Supplement.supplements_print
            self.like_to_know_more
            self.like_to_do_more
          elsif users_choice == "2"
            Supplement.topten

          elsif users_choice == "3"
            Supplement.price_lowtohigh

          else
            self.users_options
          end
      end

      def like_to_do_more
        puts "Would you like to do something else?
(Y/N)"
        users_choice = gets.chomp
        if users_choice == "Y"
          self.users_options
        else
          exit
        end
      end

      def like_to_know_more
        puts "Which product would you like to know more about?"
        users_choice = gets.chomp
        if Supplement.all[users_choice.to_i-1] != nil
            Supplement.display_product(users_choice)
        else
          self.like_to_know_more
        end
      end

  end
