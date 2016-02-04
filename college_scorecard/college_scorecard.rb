require "csv"
require "pry"

class CollegeScorecard
  attr_reader :data

  def initialize
    @data = read_data_from_csv
  end

  def read_data_from_csv
    CSV.read("./2013_college_scorecards.csv",
             headers: true,
             header_converters: :symbol)
  end

  def by_state(state)
    data.map { |row| row[:instnm] if row[:stabbr] == state }.compact
  end

  def top_average_faculty_salary(num)
    sorted_data = data.sort_by { |row| row[:avgfacsal].to_i }
    sorted_data.map { |row| row[:instnm] }.last(num).reverse
  end

  def median_debt_between(low_value, high_value)
    ranged_data = data.select do |row|
      debt_is_within_range(row[:grad_debt_mdn].to_i, low_value, high_value)
    end
    ranged_data.map { |row| "#{row[:instnm]} ($#{row[:grad_debt_mdn]})" }
  end

  def debt_is_within_range(debt, low_value, high_value)
    debt > low_value && debt < high_value
  end
end

college_scorecard = CollegeScorecard.new

case ARGV[0]
when "by_state"
  puts college_scorecard.by_state(ARGV[1])
when "top_average_faculty_salary"
  puts college_scorecard.top_average_faculty_salary(ARGV[1].to_i)
when "median_debt_between"
  puts college_scorecard.median_debt_between(ARGV[1].to_i, ARGV[2].to_i)
end
