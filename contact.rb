class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1000

  def self.id
    @@id
  end

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    Contact.all.each do |contact|
      if id == contact.id
        return contact
      end
    end
    "No match for id ##{id}"
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    case attribute
      when "first_name"
        return @first_name = value
      when "last_name"
        return @last_name = value
      when "email"
        return @email = value
      when "note"
        return @note = value
      when "id"
        return "ID should not be changed"
      else
        return "Attribute does not exist"
    end
    "Contact does not exist"
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
    when "first_name"
      Contact.all.each do |contact|
        if value == contact.first_name
          return contact
        end
      end
      "No match for first name #{value}"
    when "last_name"
      Contact.all.each do |contact|
        if value == contact.last_name
          return contact
        end
      end
      "No match for last name #{value}"
    when "email"
      Contact.all.each do |contact|
        if value == contact.email
          return contact
        end
      end
      "No match for email #{value}"
    when "note"
      Contact.all.each do |contact|
        if value == contact.note
          return contact
        end
      end
      "No match for note #{value}"
    when "id"
      Contact.all.each do |contact|
        if value == contact.id
          return contact
        end
      end
      "No match for id ##{value}"
    end
    "#{attribute} is not a valid attribute"
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = [nil]
    Contact.all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(id)
    Contact.all.each do |contact|
      if id == contact.id
        @@contacts.delete(contact)
      end
      "no matching id"
    end
  end

  # Feel free to add other methods here, if you need them.

end
