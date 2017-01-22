require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    puts "Enter First Name:"
    first_name = gets.chomp

    puts "Enter Last Name:"
    last_name = gets.chomp

    puts "Enter Email:"
    email = gets.chomp

    puts "Enter a Note:"
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "Please enter ID of contact you would like to update"
    id = gets.to_i

    puts "Please enter attibute you like to update"
    attribute = gets.chomp

    puts "Please enter your update value"
    value = gets.chomp

    Contact.update(id, attribute, value)
  end

  def delete_contact
    puts "Please enter ID of contact you wish to delete or write \"all\" if you wish to delete all contacts"
    id = gets.to_i
    if id == "all"
      Contact.delete_all
    else
      Contact.delete(id)
    end
    Contact.all
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    puts "Enter an attribute to search by"
    attribute = gets.chomp

    puts "Enter the value of that attribute"
    value = gets.chomp

    Contact.find_by(attribute, value)
  end


end
