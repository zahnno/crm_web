class Contact
	attr_accessor :first_name, :last_name, :email, :notes, :id

    #setting empty arrays
	@@contacts = []
	@@id = 1
    
    #initializing contact through first name, last name, email and notes
	def initialize(first_name, last_name, email, notes)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
		@id = @@id
		@@id += 1
	end
    
    #creating contacts
	def self.create(first_name, last_name, email, notes)
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    end
    
    #Prompting user of whether they are sure they would like to modify the contact"
    def self.modify_contact_check
        puts "Please provide ID for Contact."
        @id_check = gets.to_i
        puts "Are you sure? Y/N"
        conf = gets.chomp
        if conf == "y"
            Contact.modify_contact
        else
            return
        end
    end
    
    #modifying contact info by prompting user to chose which attr to change
    def self.modify_contact
        puts "1) Change first name."
        puts "2) Change last name."
        puts "3) Change email."
        puts "4) Change notes."
        puts "5) Quit."
        choice = gets.to_i
        if choice == 1
            Contact.change_first
        elsif choice == 2
            Contact.change_last
        elsif choice == 3
            Contact.change_email
        elsif choice == 4
            Contact.change_notes
        elsif choice == 5
            return
        end
    end
    
    #changing first name passed by modify_contact
    def self.change_first
        puts "Enter new first name."
        new_first_name = gets.chomp
        @@contacts.each do |contact|
            if contact.id == @id_check
                contact.first_name = new_first_name
            end
        end
    end
    
    #changing last name passed by modify_contact
    def self.change_last
        puts "Enter new last name."
        new_last_name = gets.chomp
        @@contacts.each do |contact|
            if contact.id == @id_check
                contact.last_name = new_last_name
            end
        end
    end
    
    #changing email passed by modify_contact
    def self.change_email
        puts "Enter new email."
        new_email = gets.chomp
        @@contacts.each do |contact|
            if contact.id == @id_check
                contact.email == new_email
            end
        end
    end

    #changing notes passed by modify_contact
    def self.change_notes
        puts "Enter new notes."
        new_notes = gets.chomp
        @@contacts.each do |contact|
            if contact.id == @id_check
                contact.notes = new_notes
            end
        end
    end
 
    #displaying all contacts
    def self.display_all_contact
        @@contacts.each do |contact|
            puts "#{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.notes}, #{contact.id}"
        end
    end

    #display specific contact using id
    def self.display_contact
        puts "Enter ID of contact you would like to display."
        id_check = gets.to_i
        @@contacts.each do |contact|
            if contact.id == id_check
                puts "#{contact.first_name}, #{contact.last_name}, #{contact.email}, #{contact.notes}, #{contact.id}"
            end
        end
    end

    #display attr by asking user which attr to chose then display attr for each contact
    def self.display_attribute
        puts "Enter the Information you would like to display for each contact."
        puts "first names, last names, emails, or notes"
        attribute = gets.chomp
        if attribute == "first names"
            @@contacts.each do |contact|
                puts contact.first_name
            end
        elsif attribute == "last names"
            @@contacts.each do |contact|
                puts contact.last_name
            end
        elsif attribute == "emails"
            @@contacts.each do |contact|
                puts contact.email
            end
        elsif attribute == "notes"
            @@contacts.each do |contact|
                puts contact.notes
            end
        end
    end

    #deleting contact based off of id selected
    def self.delete_contact
        puts "Please enter the ID of the contact you would like to delete."
        id_check = gets.to_i
        @@contacts.each do |contact|
            if contact.id == id_check
                @@contacts.delete(contact)
            end
        end
    end
    
    def self.all
        @@contacts
    end
end