########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

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

rides = [
    # Ride 0
    {
        driver_id: "DR0004", 
        date: { 
                    day: "3rd",
                    month: "Feb",
                    year: 2016
                },
        cost: 5,
        rider_id: "RD0022",
        rating: 5
    },
    # Ride 1
    {
        driver_id: "DR0001", 
        date: { 
                    day: "3rd",
                    month: "Feb",
                    year: 2016
                },
        cost: 10,
        rider_id: "RD0003",
        rating: 3
    },
    # Ride 2
    {
        driver_id: "DR0002",
        date: {
            day: "3rd",
            month: "Feb",
            year: 2016
        },
        cost: 25,
        rider_id: "RD0073",
        rating: 5
    },
    # Ride 3
    {
        driver_id: "DR0001",
        date: {
            day: "3rd",
            month: "Feb",
            year: 2016
        },
        cost: 30,
        rider_id: "RD0015",
        rating: 4
    },
    # Ride 4
    {
        driver_id: "DR0003",
        date: {
            day: "4th",
            month: "Feb",
            year: 2016
        },
        cost: 5,
        rider_id: "RD0066",
        rating: 5
    },
    # Ride 5
    {
        driver_id: "DR0004",
        date: {
            day: "4th",
            month: "Feb",
            year: 2016
        },
        cost: 10,
        rider_id: "RD0022",
        rating: 4
    },
    # Ride 6
    {
        driver_id: "DR0002",
        date: {
            day: "4th",
            month: "Feb",
            year: 2016
        },
        cost: 15,
        rider_id: "RD0013",
        rating: 1
    },
    # Ride 7
    {
        driver_id: "DR0003",
        date: {
            day: "5th",
            month: "Feb",
            year: 2016
        },
        cost: 50,
        rider_id: "RD0003",
        rating: 2
    },
    # Ride 8
    {
        driver_id: "DR0002",
        date: {
            day: "5th",
            month: "Feb",
            year: 2016
        },
        cost: 35,
        rider_id: "RD0066",
        rating: 3
    },
    # Ride 9
    {
        driver_id: "DR0004",
        date: {
            day: "5th",
            month: "Feb",
            year: 2016
        },
        cost: 20,
        rider_id: "RD0073", 
        rating: 5
    },
    # Ride 10
    {
        driver_id: "DR0001",
        date: {
            day: "5th",
            month: "Feb",
            year: 2016
        },
        cost: 45,
        rider_id: "RD0003", 
        rating: 2
    }
]

# Analysis data structure

drivers = Array.new

for i in (0..rides.length - 1)
  if (i < 10)
    id = "DR000" + i.to_s
  elsif (i >= 10) && (i < 100)
    id = "DR00" + i.to_s
  elsif (i >= 100) && (i < 1000)
    id = "DR0" + i.to_s
  else
    id = "DR" + i.to_s
  end

  if(rides.any? { |h| h.has_value?(id)})
    if !(drivers.any? { |h| h.has_value?(id)})
      drivers << {
        driver_id: id,
        ride_count: 0,
        earnings: 0.0,
        avg_rating: 0.0
      }
    end
  end
end

########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:
puts "~`~`~`~`~`~`~`~`~ OUTPUT ~`~`~`~`~`~`~`~`~`~"
# Total number of rides each driver has given
puts "\nThe number of rides each driver has given."
for i in (0..drivers.length - 1) do
    for j in (0..rides.length - 1) do
        if drivers[i][:driver_id] == rides[j][:driver_id] 
            drivers[i][:ride_count] += 1
        end
    end
    puts "#{drivers[i][:driver_id]} has given #{drivers[i][:ride_count]} rides."
end

# Total earnings for each driver
puts "\nThe total amount of money each driver has made"
for i in (0..drivers.length - 1) do
    for j in (0..rides.length - 1) do
        if drivers[i][:driver_id] == rides[j][:driver_id]
            drivers[i][:earnings] += rides[j][:cost]
        end
    end
    puts "#{drivers[i][:driver_id]} has earned $#{drivers[i][:earnings]}"
end

# Average ratings for each driver
for i in (0..drivers.length - 1) do
  for j in (0..rides.length - 1) do
    if drivers[i][:driver_id] == rides[j][:driver_id]
      drivers[i][:avg_rating] += rides[j][:rating]
    end
  end
end 
drivers.length.times do |i|
    drivers[i][:avg_rating] = (drivers[i][:avg_rating] / drivers[i][:ride_count]).round(1)
end
puts "\nThe average rating for each driver"
drivers.length.times do |i|
    puts "#{drivers[i][:driver_id]}'s average rating is #{drivers[i][:avg_rating]}."
end

# Driver with most earnings
winner = drivers[0][:driver_id]
winner_earnings = drivers[0][:earnings]
(drivers.length - 1).times do |i|
    if (winner_earnings < drivers[i+1][:earnings])
        winner_earnings = drivers[i+1][:earnings]
        winner = drivers[i+1][:driver_id]
    end
end
puts "\nWhich driver made the most money?"  
puts "#{winner} made the most money."

# Highest rated driver
highest_rated_driver = drivers[0][:driver_id]
highest_rating = drivers[0][:avg_rating]
(drivers.length - 1).times do |i|
    if (highest_rating < drivers[i+1][:avg_rating])
        highest_rating = drivers[i+1][:avg_rating]
        highest_rated_driver = drivers[i+1][:driver_id]
    end
end
puts "\nWhich driver has the highest average rating?"
puts "#{highest_rated_driver} has the highest average rating."

# Most money earned by each driver
puts "\nFor each driver, on which day did they make the most money?"
for i in (0..drivers.length - 1) do
    max_cost = 0
    day = ""
    for j in (0..rides.length - 1) do
        if drivers[i][:driver_id] == rides[j][:driver_id]
            if max_cost < rides[j][:cost]
                max_cost = rides[j][:cost]
                day = rides[j][:date][:day]
            end
        end
    end
    puts "Driver #{i + 1} earned a maximum amount of $#{max_cost} on the #{day} day."
end        
