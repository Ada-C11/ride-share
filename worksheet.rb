########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# drivers, ride info
# Which layers are nested in each other?
# Ride info (date, cost, rider_id, rating) is nested in each driver_id value
# Which layers of data "have" within it a different layer?
# The driver_id values have a layer of hashes within an array.
# Which layers are "next" to each other?
# The driver_ids are next to each other, and the ride info associated with
# each driver are next to each other: date, cost, rider_id, rating

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
# The top most layer will is a hash which will contain the driver_ids as the
# key and the value will be an array which stores a hash of ride info for
# each ride

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

driver_rides = {
  "DR0001": [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2,
    },
  ],
  "DR0002": [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3,
    },
  ],
  "DR0003": [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2,
    },
  ],
  "DR0004": [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5,
    },
  ],
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:

puts
puts "The number of rides each driver has given:"
driver_rides.each do |driver, values|
  puts "#{driver}: #{values.count}"
end
puts

puts "The total amount of money each driver has made:"
total_money = driver_rides.map do |driver, values|
  money = values.map do |ride|
    ride[:cost]
  end
  money_total = money.sum
  puts "#{driver}: $#{money_total}"
  {:driver => driver, :money => money_total}
end
puts

puts "The average rating for each driver:"
average_ratings = driver_rides.map do |driver, values|
  ratings = values.map do |ride|
    ride[:rating]
  end
  average_rating = (ratings.sum.to_f / ratings.length).round(1)
  puts "#{driver}: #{average_rating}"
  {:driver => driver, :rating => average_rating}
end
puts

puts "Which driver made the most money?"
max_money = total_money.max_by do |driver|
  driver[:money]
end

puts "#{max_money[:driver]}"
puts

puts "Which driver has the highest average rating?"
max_rating = average_ratings.max_by do |driver|
  driver[:rating]
end

puts "#{max_rating[:driver]}"
puts

puts "For each driver, on which day did they make the most money?"
driver_rides.each do |driver, values|
  rides_by_date = values.group_by do |ride|
    ride[:date]
  end

  dates = rides_by_date.map do |date, values|
    date
  end

  cost_per_day = []
  dates.length.times do |i|
    current_cost = 0
    rides_by_date.each do |ride|
      if ride[1][0][:date] == dates[i]
        current_cost += ride[1][0][:cost]
      end
    end
    cost_per_day.push({:date => dates[i], :cost => current_cost})
  end

  max_cost_date = cost_per_day.max_by do |date|
    date[:cost]
  end

  puts "#{driver} made the most money on #{max_cost_date[:date]}."
end
puts
