########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# ANSWER: Drivers, Riders, Dates, Costs, and Ratings

# Which layers are nested in each other?
# ANSWER: Drivers =
#                   Driver ID#s
#                         rider ID#s
#                         date
#                         cost
#                         rating

# Which layers of data "have" within it a different layer?
# ANSWER: ID#'s has another layer within it, containing all
# of the details for each individual trip.

# Which layers are "next" to each other?
# rider ID#s, dates, costs, and ratings

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# data structure containing all driver details
drivers = {
  DR0001: [
    {
      rider: "RD0003",
      date: "3rd Feb 2016",
      cost: 10,
      rating: 3,
    },
    {
      rider: "RD0003",
      date: "5th Feb 2016",
      cost: 45,
      rating: 2,
    },
    {
      rider: "RD0015",
      date: "3rd Feb 2016",
      cost: 30,
      rating: 4,
    },
  ],
  DR0002: [
    {
      rider: "RD0013",
      date: "4th Feb 2016",
      cost: 15,
      rating: 1,
    },
    {
      rider: "RD0066",
      date: "5th Feb 2016",
      cost: 35,
      rating: 3,
    },
    {
      rider: "RD0073",
      date: "3rd Feb 2016",
      cost: 25,
      rating: 5,
    },
  ],
  DR0003: [
    {
      rider: "RD0003",
      date: "5th Feb 2016",
      cost: 50,
      rating: 2,
    },
    {
      rider: "RD0066",
      date: "4th Feb 2016",
      cost: 5,
      rating: 5,
    },
  ],
  DR0004: [
    {
      rider: "RD0022",
      date: "3rd Feb 2016",
      cost: 5,
      rating: 5,
    },
    {
      rider: "RD0022",
      date: "4th Feb 2016",
      cost: 10,
      rating: 4,
    },
    {
      rider: "RD0073",
      date: "5th Feb 2016",
      cost: 20,
      rating: 5,
    },
  ],
}

# method that returns the number of rides each driver has given
def number_of_trips(drivers)
  number_of_trips = {}
  drivers.each do |driver, trips|
    number_of_trips[driver] = trips.length
  end
  return number_of_trips
end

# method that returns the total for given values
def sum(drivers, key)
  total_costs = {}
  drivers.each do |driver, trips|
    cost = trips.sum { |details| details[key] }
    total_costs[driver] = cost
  end
  return total_costs
end

# method that returns the average for given values
def average(drivers, key)
  averages = {}
  drivers.each do |driver, trips|
    average = 0
    trips.each do |details|
      average += details[key].to_f
    end
    average /= trips.length
    averages[driver] = average.round(2)
  end
  return averages
end

# method that returns the max value given a set of values
def hash_max_value?(drivers)
  return drivers.max_by { |driver, max| max }
end

# method that returns output details
def output(drivers, unit)
  return drivers.each { |driver, detail| puts "#{driver}: #{detail} #{unit}" }
end

# outputs the following driver information to the console: total number of trips,
# total amount earned, total average rating, driver with max earnings, and driver
# with max rating
puts "TOTAL NUMBER OF TRIPS BY EACH DRIVER:"
output(number_of_trips(drivers), "trips")

puts "\nTOTAL AMOUNT EARNED BY EACH DRIVER:"
output(sum(drivers, :cost), "dollars")

puts "\nTOTAL AVERAGE RATING OF EACH DRIVER:"
output(average(drivers, :rating), "stars")

max_earnings = hash_max_value?(sum(drivers, :cost))
puts "\nDriver #{max_earnings[0]} made the most money, at $#{max_earnings[1]}!"

highest_average = hash_max_value?(average(drivers, :rating))
puts "Driver #{highest_average[0]} had the highest average rating, at #{highest_average[1]}!"
