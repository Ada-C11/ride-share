
########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# I dentified two layers
# 1. The first one is trips
# 2. The second one is every ride information

# Which layers are nested in each other?
# Trips contains all the rides information

# Which layers of data "have" within it a different layer?
# I believe just trips

# Which layers are "next" to each other?
# each ride is next to each other

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# 1. The first one is trips -> should be an array to store the rides in order

# 2. The second one is every ride information -> each ride should
# be a hash containing driver_id, date, cost, rider_id, and rating.

########################################################
# Step 3: Make the data structure!

trips = [{driver_id: "DR0004",
          date: "3rd Feb 2016",
          cost: 5,
          rider_id: "RD0022",
          rating: 5},
         {driver_id: "DR0001",
          date: "3rd Feb 2016",
          cost: 10,
          rider_id: "RD0003",
          rating: 3},
         {driver_id: "DR0002",
          date: "3rd Feb 2016",
          cost: 25,
          rider_id: "RD0073",
          rating: 5},
         {driver_id: "DR0001",
          date: "3rd Feb 2016",
          cost: 30,
          rider_id: "RD0015",
          rating: 4},
         {driver_id: "DR0003",
          date: "4th Feb 2016",
          cost: 5,
          rider_id: "RD0066",
          rating: 5},
         {driver_id: "DR0004",
          date: "4th Feb 2016",
          cost: 10,
          rider_id: "RD0022",
          rating: 4},
         {driver_id: "DR0002",
          date: "4th Feb 2016",
          cost: 15,
          rider_id: "RD0013",
          rating: 1},
         {driver_id: "DR0003",
          date: "5th Feb 2016",
          cost: 50,
          rider_id: "RD0003",
          rating: 2},
         {driver_id: "DR0002",
          date: "5th Feb 2016",
          cost: 35,
          rider_id: "RD0066",
          rating: 3},
         {driver_id: "DR0004",
          date: "5th Feb 2016",
          cost: 20,
          rider_id: "RD0073",
          rating: 5},
         {driver_id: "DR0001",
          date: "5th Feb 2016",
          cost: 45,
          rider_id: "RD0003",
          rating: 2}]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:

# 1. Find the unique values for driver_id -> returns an array of hashes
# the hashes have the same key-value pairs as in trips
unique_driver_id_array = trips.uniq do |driver|
  driver[:driver_id]
end

# 2. Create a new array of hashes with the four driver_id
unique_driver_id = unique_driver_id_array.map do |hash|
  hash_new = {driver_id: hash[:driver_id],
              driver_rides: 0,
              driver_money: 0.0,
              driver_average_rating: 0.0}
end

# Calculations
unique_driver_id.each_with_index do |hash, index|
  # - the number of rides each driver has given
  unique_driver_id[index][:driver_rides] = trips.count do |hash_trips|
    hash_trips[:driver_id] == hash[:driver_id]
  end

  # Create and array of hashes per each driver_id
  driver_info = trips.select do |hash_trips|
    hash_trips[:driver_id] == hash[:driver_id]
  end

  # - the total amount of money each driver has made
  # plus, addition of the ratings per driver (will use for average)
  driver_info.each_with_index do |hash, inde|
    unique_driver_id[index][:driver_money] += driver_info[inde][:cost]
    unique_driver_id[index][:driver_average_rating] += driver_info[inde][:rating]
  end

  # - the average rating per driver
  average = unique_driver_id[index][:driver_average_rating] / unique_driver_id[index][:driver_rides]
  unique_driver_id[index][:driver_average_rating] = average.round(2)
  # - optional: on which day did they make the most money?
  more_money_day = driver_info.max_by { |k| k[:cost] }[:date]

  puts "\n\nDriver #{unique_driver_id[index][:driver_id]}"
  puts "a. Number of rides: #{unique_driver_id[index][:driver_rides]}"
  puts "b. Money made: #{unique_driver_id[index][:driver_money]}"
  puts "c. Average rating: #{unique_driver_id[index][:driver_average_rating]}"
  puts "d. The date when the driver made more money is: #{more_money_day}"
end

puts "\n\n************ Summary ************"

# - Which driver made the most money?
money_more = unique_driver_id.max_by { |k| k[:driver_money] }[:driver_id]
puts "- The driver that made the most money is: #{money_more}."

# - Which driver has the highest average rating?
maximun = unique_driver_id.max_by { |k| k[:driver_average_rating] }[:driver_id]
puts "- The driver with the highest average rating is: #{maximun}.\n\n"
