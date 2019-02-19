########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,

# Create a list of the layers you identify.
# Overall rideshare info --> driver ID --> info related to the ride such as cost and rating

# Which layers are nested in each other?
# The detailed ride information is nested within the driver ID, which is nested within an overarching "ride_share_info" variable

# Which layers of data "have" within it a different layer?
# the rideshare information has the drivers within it which has the ride information within it

# Which layers are "next" to each other?
# cost, rating, rider_ID, and date for each driver; driver IDs are "next to each other" as well
########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# cost, rating, rider_ID, date stored as individual hashes
# individual hashes just defined stored within an array corresponding to unique driver ID
# driver IDs stored within a hash; driver ID is a symbol (key) with value of array described in prior line
#
########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"
drivers = {
  DR0004: [{DATE: "3rd Feb 2016", COST: 5, RIDER_ID: "RD0022", RATING: 5},
           {DATE: "4th Feb 2016", COST: 10, RIDER_ID: "RD0022", RATING: 4},
           {DATE: "5th Feb 2016", COST: 20, RIDER_ID: "RD0073", RATING: 5}],
  DR0001: [{DATE: "3rd Feb 2016", COST: 10, RIDER_ID: "RD0003", RATING: 3},
           {DATE: "3rd Feb 2016", COST: 30, RIDER_ID: "RD0015", RATING: 4},
           {DATE: "5th Feb 2016", COST: 45, RIDER_ID: "RD0003", RATING: 2}],
  DR0002: [{DATE: "3rd Feb 2016", COST: 25, RIDER_ID: "RD0073", RATING: 5},
           {DATE: "4th Feb 2016", COST: 15, RIDER_ID: "RD0013", RATING: 1},
           {DATE: "5th Feb 2016", COST: 35, RIDER_ID: "RD0066", RATING: 3}],
  DR0003: [{DATE: "4th Feb 2016", COST: 10, RIDER_ID: "RD0022", RATING: 4},
           {DATE: "5th Feb 2016", COST: 35, RIDER_ID: "RD0066", RATING: 3}],

}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

drivers.each do |driver, records|
  puts "Driver #{driver} gave #{records.count} total rides"
end

# - the total amount of money each driver has made
drivers.each do |driver, records|
  sum_driver = records.sum { |x| x[:COST] }
  puts "Driver #{driver} made a total of $#{sum_driver}"
end

# - the average rating for each driver
drivers.each do |driver, records|
  avg_rating_driver = ((records.sum { |x| x[:RATING] }).to_f / records.length).round(2)
  puts "Driver #{driver} has an average rating of #{avg_rating_driver}"
end

# - Which driver made the most money?
dd = drivers.map do |driver, records|
  {name: driver, totalcost: records.sum { |x| x[:COST] }}
end
max = dd.max_by { |x| x[:totalcost] }
puts "Driver that made the most money: #{max[:name]}"

# - Which driver has the highest average rating?
dd = drivers.map do |driver, records|
  {name: driver, rating: (records.sum { |x| x[:RATING] }).to_f / records.length}
end
max = dd.max_by { |x| x[:rating] }
puts "Driver that had the highest rating: #{max[:name]}"

#----OPTIONAL--------
# - Which day did they make the most money?
# this code assumes that a driver may have given multiple rides during one date
drivers.each do |driver, records|
  hash = {}
  records.each do |val|
    hash.has_key?(val[:DATE]) ? (hash[val[:DATE]] = hash[val[:DATE]] + val[:COST]) : hash.merge!(val[:DATE] => val[:COST])
  end
  #   date_max_rides = hash.max_by { |key, val| val }[0]
  date_max_rides = hash.key(hash.values.max)
  puts "Driver #{driver} made the most money on #{date_max_rides}"
end

# this code assumes that one ride was given per date
drivers.each do |drivers, records|
  date_max_rides = (records.max_by { |x| x[:COST] })[:DATE]
  p date_max_rides
end
