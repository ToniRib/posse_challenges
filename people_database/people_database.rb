require "pry"
require_relative "person"

class PeopleDatabase
  def initialize(people)
    @people = people
  end

  def add(first_name:, last_name:, email:, state:)
    @people << Person.new(first_name: first_name,
                          last_name:  last_name,
                          email:      email,
                          state:      state)
  end

  def remove_by_email(email_address)
    @people.delete_if { |person| person.email == email_address }
  end

  def lives_in_state(state)
    @people.select { |person| person.state == state }
  end
end

if __FILE__ == $0
  people = [Person.new(first_name: "Toni",
                       last_name:  "Rib",
                       email:      "toni@example.com",
                       state:      "CA"),
            Person.new(first_name: "Admir",
                       last_name:  "Draganovic",
                       email:      "admir@example.com",
                       state:      "CO")]
  people_db = PeopleDatabase.new(people)

  people_db.add(first_name: "Tess",
                last_name:  "Griffin",
                email:      "tess@turing.io",
                state:      "CO")
  p people_db
  people_db.remove_by_email("tess@turing.io")
  p people_db
  p people_db.lives_in_state("CA")
  p people_db.lives_in_state("CO")
end
