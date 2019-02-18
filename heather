

# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# top level = Array of drivers
# 2nd level = hash for each driver w/ unique trips (date + rider ID), amounts earned (cost of trips), rating
# 3rd level = array within each hash for each driver - arrays: unique trips, amounts earned, rating

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################

# Step 3: Make the data structure!

driver_data = [
  {
    driver_id: "DR0001",
    unique_trips: [("3rd Feb 2016" + "RD0003"), ("3rd Feb 2016" + "RD0015"), ("5th Feb 2016" + "RD0003")],  #tried to use this a proxy for a unique trip
    amount_earned: [10, 30, 45],
    ratings: [3, 4, 2],
  },
  {
    driver_id: "DR0002",
    unique_trips: [("3rd Feb 2016" + "RD0073"), ("4th Feb 2016" + "RD0013"), ("5th Feb 2016" + "RD0066")],
    amount_earned: [25, 15, 35],
    ratings: [5, 1, 3],
  },
  {
    driver_id: "DR0003",
    unique_trips: [("4th Feb 2016" + "RD0066"), ("5th Feb 2016" + "RD0003")],
    amount_earned: [5, 50],
    ratings: [5, 2],
  },
  {
    driver_id: "DR0004",
    unique_trips: [("3rd Feb 2016" + "RD0022"), ("4th Feb 2016" + "RD0022"), ("5th Feb 2016" + "RD0073")],
    amount_earned: [5, 10, 20],
    ratings: [5, 4, 5],
  },
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

rides_by_driver = []

driver_data.each do |number_rides|
  rides_by_driver << {
    driver_id: number_rides[:driver_id],
    number_rides: number_rides[:unique_trips].length,
  }
end

rides_by_driver.each do |list|
  puts "#{list[:driver_id]} was given #{list[:number_rides]} ride(s)."
end
puts "\n"

# - the total amount of money each driver has made

paid_to_driver = []

driver_data.each do |earned|
  paid_to_driver << {
    driver_id: earned[:driver_id],
    wages: earned[:amount_earned].sum,
  }
end

paid_to_driver.each do |money|
  puts "#{money[:driver_id]} made $#{money[:wages]}."
end
puts "\n"

# - the average rating for each driver

avg_rating = []

driver_data.each do |number_rides_ratings|
  avg_rating << {
    driver_id: number_rides_ratings[:driver_id],
    average_rating: (number_rides_ratings[:ratings].sum) / (number_rides_ratings[:unique_trips].length),
  }
end

avg_rating.each do |rating_list|
  puts "The average rating for driver #{rating_list[:driver_id]} was #{rating_list[:average_rating]}."
end

# - Which driver made the most money?

most_money = paid_to_driver.max_by { |earned| earned[:wages] }[:wages]

highest_paid_driver = paid_to_driver.select { |driver_earned| driver_earned[:wages] == most_money }.map { |driver_earned| driver_earned[:driver_id] }

puts "\nDriver who made the most money:"
puts highest_paid_driver

# - Which driver has the highest average rating?

highest_avg_rating = avg_rating.max_by { |rating| rating[:average_rating] }[:average_rating]

highest_avg_rated_driver = avg_rating.select { |driver_rating| driver_rating[:average_rating] == highest_avg_rating }.map { |driver_rating| driver_rating[:driver_id] }

puts "\nDriver who received the highest average rating: "
puts highest_avg_rated_driver

# puts "Driver #{highest_avg_rated_driver} received the highest average rating."
