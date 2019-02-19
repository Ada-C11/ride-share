########################################################
# Step 1: Establish the layers

# Layer 1: All Driver's Data =>
# Layer 2: Driver 1, 2, 3, 4's separate data (4 layers next to each other) =>
# Layer 3: Data by ride for each driver (date, cost, rider id and rating of each ride)(each ride for each driver layered next to each other)

########################################################
# Step 2: Assign a data structure to each layer

# Layer 1: HASH -  All Driver's Data
# Layer 2: ARRAY - Driver 1, 2, 3, 4's separate data (4 layers next to each other)
# Layer 3: HASH - Data by ride for each driver (date, cost, rider id and rating of each ride)(each ride for each driver layered next to each other)

########################################################
# Step 3: Make the data structure!

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

rides =
  {"DR0001" => [{:date => "3rd Feb 2016", :cost => 10, :rider_id => "RD0003", :rating => 3},
                {:date => "3rd Feb 2016", :cost => 30, :rider_id => "RD0015", :rating => 4},
                {:date => "5th Feb 2016", :cost => 45, :rider_id => "RD0003", :rating => 2}],
   "DR0002" => [{:date => "3rd Feb 2016", :cost => 25, :rider_id => "RD0073", :rating => 5},
                {:date => "4th Feb 2016", :cost => 15, :rider_id => "RD0013", :rating => 1},
                {:date => "5th Feb 2016", :cost => 35, :rider_id => "RD0066", :rating => 3}],
   "DR0003" => [{:date => "4th Feb 2016", :cost => 5, :rider_id => "RD0066", :rating => 5},
                {:date => "5th Feb 2016", :cost => 50, :rider_id => "RD0003", :rating => 2}],
   "DR0004" => [{:date => "3rd Feb 2016", :cost => 5, :rider_id => "RD0022", :rating => 5},
                {:date => "4th Feb 2016", :cost => 10, :rider_id => "RD0022", :rating => 4},
                {:date => "5th Feb 2016", :cost => 20, :rider_id => "RD0073", :rating => 5}]}

puts "The Number of Rides Each Driver Has Given:\n"
number_of_rides = {}
rides.each do |drivers, rides|
  number_of_rides[drivers] = rides.length.to_f
end
number_of_rides.each do |drivers, rides|
  puts "#{drivers} has driven #{rides.to_i} rides"
end

puts "\nThe Total Amount of Money Each Driver Has Made:\n"
pay_hash = {}
rides.each do |drivers, rides|
  money_made = 0
  rides.each do |eachride|
    money_made += eachride[:cost]
  end
  pay_hash[drivers] = money_made
end

pay_hash.each do |drivers, pay|
  puts "The total amount of money Driver #{drivers} made was $#{pay}"
end

puts "\nThe Average Rating for Each Driver:\n"
rating_hash = {}
rides.each do |drivers, rides|
  rating = 0
  rides.each do |eachride|
    rating += eachride[:rating]
  end
  rating_hash[drivers] = rating
end

average_rating = {}
rating_hash.each do |drivers, rating|
  average_rating[drivers] = (rating / number_of_rides[drivers]).to_f
end
average_rating.each do |drivers, rating|
  puts "The average rating of #{drivers} is #{rating.round(2)}"
end

puts "\nWhich Driver Made the Most Money:\n"
most_money_driver = ""
highest_pay = pay_hash.values.max
pay_hash.each do |drivers, pay|
  if pay == highest_pay
    most_money_driver = drivers
  end
end
puts "#{most_money_driver} was the driver that made the most money. They made $#{highest_pay}."

puts "\nWhich Driver Had the Highest Average Rating:\n"
highest_rating_driver = ""
highest_rating = average_rating.values.max
average_rating.each do |drivers, rating|
  if highest_rating == rating
    highest_rating_driver = drivers
  end
end
puts "The driver with the highest rating is #{highest_rating_driver}, with an average rating of #{highest_rating.round(2)}"

puts "\nWhich Day the Drivers Made the Most Money:\n"
driver_rides_costs = 0
highest_day = {}
highest_cost_hash = {}
rides.each do |drivers, rides|
  drivers_rides = {}
  rides_day = {}
  rides.each do |eachride|
    rides_day[eachride[:date]] = eachride[:cost]
  end
  drivers_rides[drivers] = rides_day
  driver_rides_costs = drivers_rides

  driver_rides_costs.each do |drivers, rides|
    highest_cost = rides.values.max
    highest_cost_hash[drivers] = highest_cost
    rides.each do |date, cost|
      if highest_cost == cost
        highest_day[drivers] = date
      end
    end
  end
end

highest_day.each do |drivers, day|
  puts "#{drivers} made the most money on #{day}. They made $#{highest_cost_hash[drivers]}"
end
