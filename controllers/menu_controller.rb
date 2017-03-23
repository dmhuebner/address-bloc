require_relative "../models/address_book"

class MenuController
    attr_reader :AddressBook

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu
        puts "\nMain menu - #{@address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View entry number n"
        puts "6 - Exit\n"
        print "Enter your selection: "

        selection = gets.to_i
        puts "You picked #{selection}"

        case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5
            system "clear"
            view_entry_num
            main_menu
        when 6
            puts "Good-bye!"
            exit(0)
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end

    end

    def view_all_entries
        @address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s

            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
    end

    def view_entry_num
        print "Enter an entry number to view:"
        entry_num = gets.chomp.to_i
        unless @address_book.entries[entry_num - 1]
            puts "That is not a valid entry number"
            view_entry_num
        else
            puts @address_book.entries[entry_num - 1]
        end
    end

    def create_entry
        system "clear"
        puts "New AddressBloc entry"
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp
        @address_book.add_entry(name, phone_number, email)
        system "clear"
        puts "New entry created!"
    end

    def search_entries
    end

    def read_csv
    end

    def entry_submenu(entry)
        puts "\nn - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        selection = gets.chomp

        case selection
        when "n"
        when "d"
        when "e"
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
        end
    end
end
