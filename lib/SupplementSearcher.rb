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
  ╔══════════════════════════════════════════════════╗

                  ╔╦╦╦═╦╗╔═╦═╦══╦═╗
                  ║║║║╩╣╚╣═╣║║║║║╩╣
                  ╚══╩═╩═╩═╩═╩╩╩╩═╝
            Welcome to Supplement Searcher!
          "
          sleep(0.5)
  puts "Your CLI Destination to shop and compare supplements!

  ╚══════════════════════════════════════════════════╝
          "
          sleep(0.5)
          puts "              Loading..."

        s = SupplementScraper.new

        self.users_options
      end


      def users_options
        puts "
============= Would you like to: =============

        1) See all products
        2) See top 10 rated products
        3) List products by price - low to high

===============================================
        "

        users_choice = gets.chomp

          if users_choice == "1"
            Supplement.supplements_print
            self.like_to_know_more("all")
            self.like_to_do_more
          elsif users_choice == "2"
            Supplement.create_topten
            self.like_to_know_more("topten")
            self.like_to_do_more
          elsif users_choice == "3"
            Supplement.create_price_lowtohigh
            self.like_to_know_more("price_lowtohigh")
            self.like_to_do_more
          else
            puts "
            Please select from the options provided
            "
            self.users_options
          end
      end

      def like_to_do_more
        puts "＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
| Windows Dialog　　　　　　　　　　　　　　 [－] [口] [×]   |
| ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
|       　Would you like to do something else?
|
|　 　　   ＿＿＿＿＿＿　　　　　　　　  ＿＿＿＿＿＿　　
| 　 　   ｜　 Y　　 |　　　 　         |　   N    |
|　 　　   ￣￣￣￣￣￣　　　　　　　　  ￣￣￣￣￣￣　
|＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿|"
        users_choice = gets.chomp.capitalize
        if users_choice == "Y"
          self.users_options
        elsif users_choice == "N"
          puts "Thank you come again!"
          sleep(0.5)
          abort("
✄╔═══╦═╗╔═╦══╦════╗
✄║╔══╩╗╚╝╔╩╣╠╣╔╗╔╗║
✄║╚══╗╚╗╔╝─║║╚╝║║╚╝
✄║╔══╝╔╝╚╗─║║──║║
✄║╚══╦╝╔╗╚╦╣╠╗─║║
✄╚═══╩═╝╚═╩══╝─╚╝

")
        else
          exit
        end
      end

      def like_to_know_more(array)
        puts "
        Which product would you like to know more about?
        "
        users_choice = gets.chomp
        if array == "all" && Supplement.all[users_choice.to_i-1] != nil
              Supplement.display_product("all", users_choice)
        elsif array == "topten" && Supplement.topten[users_choice.to_i-1] != nil
              Supplement.display_product("topten", users_choice)
        elsif array == "price_lowtohigh" && Supplement.price_lowtohigh[users_choice.to_i-1] != nil
              Supplement.display_product("price_lowtohigh", users_choice)
        else
              puts "
              Please make a selection from the options provided!
              "
              self.like_to_know_more(array)
        end

      end

  end
