require 'csv'

#untried.  a lot of things broke, after i started
# separating into methods.

  def parse_csv
    # parsed_file = {}
    csv_parser = CSV.open "2013_college_scorecards.csv", headers: true, header_converters: :symbol
    csv_parser.map do |row|
      @state_abbrv   = row[3]
      @state_college = row[1]
      @avg_salary = row ####
      #median debt to be added. row[:symbol] not working for me.
    end
  end

  def by_state(abbr)
    puts @college if @abbr == abbr
  end

  def top_average_faculty_salary(top_number)
    salary_sort.first(top_number)
   end

  def salary_sort
    #check to see whether this needs to be averaged out first
    @avg_salary.sort
  end

  def median_debt_between(a range)
    #use GRAD_DEBT_MDN header
    # Should return a list of colleges whose median
    # debt is between (exclusive) the two given numbers.
    # Next to each college should be the corresponding
    # median debt:
    #Automeca Technical($1750)
  end

#way unfinished. started as a pseudocode, and becoming more
# codish
