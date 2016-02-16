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
end

if __FILE__ == $0
  people = [Person.new(first_name: "Toni",
                       last_name:  "Rib",
                       email:      "toni@example.com",
                       state:      "CO"),
            Person.new(first_name: "Admir",
                       last_name:  "Draganovic",
                       email:      "admir@example.com",
                       state:      "CO")]
  people_db = PeopleDatabase.new(people)

  people_db.add(first_name: "Tess",
                last_name:  "Griffin",
                email:      "tess@turing.io",
                state:      "CO")
  binding.pry
end
