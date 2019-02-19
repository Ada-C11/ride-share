# set up nested data structure
rideshare = {
    DR0001: [
        {:date => "3rd Feb 2016", :cost => 10, :rider_id => "RD0003", :rating => 3},
        {:date => "3rd Feb 2016", :cost => 30, :rider_id => "RD0015", :rating => 4},
        {:date => "5th Feb 2016", :cost => 45, :rider_id => "RD0003", :rating => 2}
    ],
    DR0002: [
        {:date => "3rd Feb 2016", :cost => 25, :rider_id => "RD0073", :rating => 5},
        {:date => "4th Feb 2016", :cost => 15, :rider_id => "RD0013", :rating => 1},
        {:date => "5th Feb 2016", :cost => 35, :rider_id => "RD0066", :rating => 3}
    ],
    DR0003: [
        {:date => "4th Feb 2016", :cost => 5, :rider_id => "RD0066", :rating => 5},
        {:date => "5th Feb 2016", :cost => 50, :rider_id => "RD0003", :rating => 2}
    ],
    DR0004: [
        {:date => "3rd Feb 2016", :cost => 5, :rider_id => "RD0022", :rating => 5},
        {:date => "4th Feb 2016", :cost => 10, :rider_id => "RD0022", :rating => 4},
        {:date => "5th Feb 2016", :cost => 20, :rider_id => "RD0073", :rating => 5}
    ]
}
# count each driver's rides
rideshare.each {|key, value| puts "Driver #{key} went on a total of #{value.count} rides."}

# sum each driver's income
rideshare.each do |key, value|
    income = value.sum do |ride|
        ride[:cost]
    end
puts "Driver #{key} made a total of $#{income}."
end

# return each driver's avg rating
rideshare.each do |key, value|
    avg_rating = value.sum do |record|
        ((record[:rating].to_f) / value.length).round(2)
    end
puts "Driver #{key} has an average rating of #{avg_rating}."
end

# find which driver made the most money
highest_income = rideshare.map do |key, value|
    { name: key, total: value.sum do |record|
      record[:cost]
    end }
  end
  
  richest_driver = highest_income.max_by do |key|
    key[:total]
  end
  
  puts "Driver #{richest_driver[:name]} made the most amount of money."
  

# find which driver has the highest avg rating
all_averages = rideshare.map do |key, value|
    { name: key, average: value.sum do |record|
      ((record[:rating].to_f) / value.length).round(2)
    end }
  end
  
  highest_rated_driver = all_averages.max_by do |element|
    element[:average]
  end
  
  puts "Driver #{highest_rated_driver[:name]} had the highest average rating."
  
  # find on wbich days each driver made the most money
  most_income_day = rideshare.map do |key, array|
    { name: key, most_income_day: array.max_by do |record|
      record[:cost]
      end }
    end
  
  most_income_day.each do |element|
    puts "#{element[:name]} made the most money on #{element[:most_income_day][:date]}."
  end
  