# Rideshare Program
# by Hana C

# 1. What things (objects, nouns) are represented or described in this file? We can think of at least six different things.
## DRIVER_ID, DATE, COST, RIDER_ID, RATING

# 2. From the things you listed in the previous question, all of those things have relationships to each other. (an ID belongs to a person, for instance. As an abstract, unrelated example a VIN belongs to a vehicle, and a vehicle has a VIN.) Consider the relationships between the pieces of data.
## Rating is related to the Driver_ID.
##

# 3. Lastly, in this assignment, we will rearrange all of the data into one data structure (with a lot of nested layers), that can be held in one variable. List some ideas: considering all of the relationships listed in the last question, what piece of data can contain the others at the top-most level? (Compared to the json example before, think about what the top-most layer of the hash and what that represented.) There is more than one correct answer, so just list out the options at this moment.
## Organize by Driver_ID
## Nest date
## Then: cost, rating, rider_id (not in any particular order)

# DATA STRUCTURE
# drivers hash {
#     each_driver [
#       { info_hash }
#     ]
# }

drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      rider_id: "RD0003",
      cost: 10,
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      rider_id: "RD0015",
      cost: 30,
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      rider_id: "RD0003",
      cost: 45,
      rating: 2,
    },
  ],
  DR0002: [
    {
      date: "3th Feb 2016",
      rider_id: "RD0073",
      cost: 25,
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      rider_id: "RD0013",
      cost: 15,
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      rider_id: "RD0066",
      cost: 35,
      rating: 3,
    },
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      rider_id: "RD0066",
      cost: 5,
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      rider_id: "RD0003",
      cost: 50,
      rating: 2,
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      rider_id: "RD0022",
      cost: 5,
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      rider_id: "RD0022",
      cost: 10,
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      rider_id: "RD0073",
      cost: 20,
      rating: 5,
    },
  ],
}

highest_earner = {
  driver: nil,
  earnings: 0,
}

highest_rated = {
  driver: nil,
  ratings: 0,
}

# method for each driver's earnings
def driver_earnings(input_data)
  driver_earnings = input_data.map do |ride|
    ride[:cost]
  end

  return driver_earnings
end

# method for each driver's ratings
def driver_ratings(input_data)
  driver_ratings = input_data.map do |ride|
    ride[:rating]
  end

  return driver_ratings
end

# Welcome message
puts "Welcome to the Rideshare Data Program!"
puts "by Hana C\n"

# loop to access nested information
drivers.each do |driver, rides|
  puts "\nDriver: #{driver}"

  # number of rides for each driver
  puts " Total amount of rides: #{rides.length}"

  # total amount of money earned for each driver
  earnings = driver_earnings(rides).sum
  puts " Total amount of earnings: \$#{earnings}"

  ## conditional for highest earner
  if earnings > highest_earner[:earnings]
    highest_earner[:driver] = driver
    highest_earner[:earnings] = earnings
  end

  # average rating for each driver
  ratings = driver_ratings(rides).sum / driver_ratings(rides).length
  puts " Average rating: #{ratings}"

  ## conditional for highest ratings
  if ratings > highest_rated[:ratings]
    highest_rated[:driver] = driver
    highest_rated[:ratings] = ratings
  end
end

puts "------------------------------"

# display highest earnings
puts "Highest Total Earnings"
puts " Driver: #{highest_earner[:driver]}"
puts " Amount: \$#{highest_earner[:earnings]}"

# display highest rating
puts "\nHighest Average Rating"
puts " Driver: #{highest_rated[:driver]}"
puts " Amount: #{highest_rated[:ratings]}"
