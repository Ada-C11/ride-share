########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# MY ANSWER:
# Layer 1 - one variable to hold the entire data structure
# Layer 2 - all of the data about all of the rides
# Layer 3 - all the data about a single ride
# Layer 4 - the individual pieces of data for a single ride
# RIDE NUMBER
# DRIVER_ID
# DATE
# COST
# RIDER_ID
# RATING
# Layer 5 - components of the date (year, month, day)

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Layer 1 - variable - one variable to hold the entire data structure
# Layer 2 - array - one array to hold data about all rides
# Layer 3 - hash - all the data about a single ride
# Layer 4 - key-value pairs - the individual pieces of data for
#           the single ride that this hash represents
# RIDE NUMBER - a key-value pair
# DRIVER_ID - key-value pair
# DATE - key-value pair where the value is an array

# COST - key-value pair
# RIDER_ID - key-value pair
# RATING - key-value pair
# Layer 5 - array - components of the date (year, month, day)
#           stored as integers

# I'll use an array for the date components because it would use
# less characters than a hash, which would require repeated instances of
# the keys :year, :month, :day. Using an array instead would
# make the file size smaller, which could be
# significant with lots of lines of data.

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# The date is stored in an array formatted as [YYYY, MM, DD].
# Each element is an integer

rides = [
  {
    driver_id: "DR0004",
    date: [2016, 02, 03],
    cost: 5.00,
    rider_id: "RD0022",
    rating: 5.0,
  },

  {
    driver_id: "DR0001",
    date: [2016, 02, 03],
    cost: 10.00,
    rider_id: "RD0003",
    rating: 3.0,
  },

  {
    driver_id: "DR0002",
    date: [2016, 02, 03],
    cost: 25.00,
    rider_id: "RD0073",
    rating: 5.0,
  },

  {
    driver_id: "DR0001",
    date: [2016, 02, 03],
    cost: 30.00,
    rider_id: "RD0015",
    rating: 4.0,
  },

  {
    driver_id: "DR0003",
    date: [2016, 02, 04],
    cost: 5.00,
    rider_id: "RD0066",
    rating: 5.0,
  },

  {
    driver_id: "DR0004",
    date: [2016, 02, 04],
    cost: 10.00,
    rider_id: "RD0022",
    rating: 4.0,
  },

  {
    driver_id: "DR0002",
    date: [2016, 02, 04],
    cost: 15.00,
    rider_id: "RD0013",
    rating: 1.0,
  },

  {
    driver_id: "DR0003",
    date: [2016, 02, 05],
    cost: 50.00,
    rider_id: "RD0003",
    rating: 2.0,
  },

  {
    driver_id: "DR0002",
    date: [2016, 02, 05],
    cost: 35.00,
    rider_id: "RD0066",
    rating: 3.0,
  },

  {
    driver_id: "DR0004",
    date: [2016, 02, 05],
    cost: 20.00,
    rider_id: "RD0073",
    rating: 5.0,
  },

  {
    driver_id: "DR0001",
    date: [2016, 02, 05],
    cost: 45.00,
    rider_id: "RD0003",
    rating: 2.0,
  },
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

# Make a hash to hold a hash for each driver's stats.

drivers_data = {}

rides.each do |ride|
  if !drivers_data.has_key?(ride[:driver_id])
    drivers_data[ride[:driver_id]] = {
      # ASK ABOUT THIS SYNTAX
      # WHY NO COLON HERE BEFORE RIDE???
      # I EXPECT TO WRITE: drivers_data[:(ride[:driver_id])]
      # BECAUSE: "ride" is a variable name now (iterator variable)
      driver_id: ride[:driver_id],
      ride_count: 0,
      total_earned: 0.00,
      total_ratings: 0.0,
      ratings_count: 0,
    }
  end
end

# To find the number of rides each driver has given:
# Loop through each ride in the rides array. Find the driver_id that matches the key
# in the drivers_data array and add one the ride count in that corresponding hash.
rides.each do |this_ride|
  current_driver_id = this_ride[:driver_id]
  driver = drivers_data[current_driver_id]
  driver[:ride_count] += 1
end

puts "Here are the number of rides each driver provided."
drivers_data.keys.each do |key|
  puts "Driver #{key}: #{drivers_data[key][:ride_count]}"
end

# - the total amount of money each driver has made

# Loop through each ride. For each ride's loop, find the drivers_data hash with
# the matching driver id number and add the cost of this ride to
# the driver's total earned.
rides.each do |this_ride|
  current_driver_id = this_ride[:driver_id]
  driver = drivers_data[current_driver_id]
  driver[:total_earned] += this_ride[:cost]
end

puts "Here's how much each driver earned."
drivers_data.keys.each do |key|
  puts "Driver #{key}: #{drivers_data[key][:total_earned]}"
end

# - the average rating for each driver

rides.each do |this_ride|
  current_driver_id = this_ride[:driver_id]
  driver = drivers_data[current_driver_id]
  driver[:total_ratings] += this_ride[:rating]
  driver[:ratings_count] += 1
end

drivers_data.keys.each do |driver|
  # current_driver_id = driver[:driver_id]
  driver_avg_rating = drivers_data[driver][:total_ratings] / drivers_data[driver][:ratings_count]
  drivers_data[driver][:avg_rating] = driver_avg_rating
end

puts "Here's each driver's average rating."
drivers_data.keys.each do |key|
  puts "Driver #{key}: #{drivers_data[key][:avg_rating]}"
end

# - Which driver made the most money?
all_drivers_earnings = []
drivers_data.keys.each do |key|
  all_drivers_earnings << drivers_data[key][:total_earned]
end

most_earned = all_drivers_earnings.max
top_earners = []
drivers_data.keys.each do |key|
  if drivers_data[key][:total_earned] == most_earned
    top_earners << drivers_data[key][:driver_id]
  end
end

puts "Driver(s) who earned the most:"
puts top_earners

# - Which driver has the highest average rating?
all_drivers_ratings = []
drivers_data.keys.each do |key|
  all_drivers_ratings << drivers_data[key][:avg_rating]
end

top_rating = all_drivers_ratings.max
top_rated_drivers = []
drivers_data.keys.each do |key|
  if drivers_data[key][:avg_rating] == top_rating
    top_rated_drivers << drivers_data[key][:driver_id]
  end
end

puts "Highest rated driver(s):"
puts top_rated_drivers

# Optionally, print in the terminal:
# For each driver, on which day did they make the most money?

# NOTES:
# I chose to use an array of hashes for the ride data because (a) the rides happen 
#   in order and (b) looping through a hash of hashes had me stumped. I may go 
#   back and refactor for a challenge.
# Update: I went back and refactored my drivers data to use a hash of hashes instead. 
#   It was definitely a challenge!
# It would have been easier to do the calculations if the data were by driver. However, 
#   I thought that creating a hash for each ride would allow for more flexibility to 
#   access non-driver-centric infomration in the future.
