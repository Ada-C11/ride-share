# An array of hashes, the array containing all instances of rides, and hashes being those instances with indentifying keys (symbols) and values (kept as strings).
rides = [
  {
    driver_id: "DR0004",
    date: "3rd Feb 2016",
    cost: "5",
    rider_id: "RD0022",
    rating: "5",
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: "10",
    rider_id: "RD0003",
    rating: "3",
  },
  {
    driver_id: "DR0002",
    date: "3rd Feb 2016",
    cost: "25",
    rider_id: "RD0073",
    rating: "5",
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: "30",
    rider_id: "RD0015",
    rating: "4",
  },
  {
    driver_id: "DR0003",
    date: "4rd Feb 2016",
    cost: "5",
    rider_id: "RD0066",
    rating: "5",
  },
  {
    driver_id: "DR0004",
    date: "4rd Feb 2016",
    cost: "10",
    rider_id: "RD0022",
    rating: "4",
  },
  {
    driver_id: "DR0002",
    date: "4rd Feb 2016",
    cost: "15",
    rider_id: "RD0013",
    rating: "1",
  },
  {
    driver_id: "DR0003",
    date: "5th Feb 2016",
    cost: "50",
    rider_id: "RD0003",
    rating: "2",
  },
  {
    driver_id: "DR0002",
    date: "5th Feb 2016",
    cost: "35",
    rider_id: "RD0066",
    rating: "3",
  },
  {
    driver_id: "DR0004",
    date: "5th Feb 2016",
    cost: "20",
    rider_id: "RD0073",
    rating: "5",
  },
  {
    driver_id: "DR0001",
    date: "5th Feb 2016",
    cost: "45",
    rider_id: "RD0003",
    rating: "2",
  },
]

# An array of driver ids only, for string interpolation later on.
# drivers = ["DR0001", "DR0002", "DR0003", "DR0004"]
drivers = rides.map do |ride|
  ride[:driver_id]
end
drivers = drivers.uniq!.sort!

# Method with iteration gathering each drivers instances of rides and placing into a new array.
def number_rides(array, driver_id)
  @driver_rides = array.select do |ride|
    ride[:driver_id] == driver_id
  end
  return @driver_rides.length
end

# The sum of all money made for each driver, placed into a new array.
def income
  driver_cost = @driver_rides.sum do |ride|
    ride[:cost].to_i
  end
  return driver_cost
end

# The average rating for each driver, placed into a new array.
def rating
  sum = @driver_rides.sum do |rate|
    rate[:rating].to_i
  end
  average = (sum.to_f / @driver_rides.length).round(2)
  return average
end

driver_money = []
driver_rating = []

# Iteration loop outputting all data for each driver within one sentence for each. All adds values to arrays.
drivers.each_with_index do |driver, i|
  puts "Driver ##{i + 1} has driven #{number_rides(rides, driver)} rides, has made $#{income} total, and their average rating is #{rating}."
  driver_money << income
  driver_rating << rating
end

# Outputs driver who made the most.
puts "The driver that made the most money is #{drivers[driver_money.index(driver_money.max)]}."

# Outputs driver with highest rating.
puts "The driver that has the highest rating is #{drivers[driver_rating.index(driver_rating.max)]}."

# OLD PROGRAM DRAFT

# The number of rides each driver has given

# driver1_ride = rides.select { |ride| ride[:DRIVER_ID] == "DR0001" }
# driver2_ride = rides.select { |ride| ride[:DRIVER_ID] == "DR0002" }
# driver3_ride = rides.select { |ride| ride[:DRIVER_ID] == "DR0003" }
# driver4_ride = rides.select { |ride| ride[:DRIVER_ID] == "DR0004" }

# puts "Driver 1 has driven #{driver1_ride.length} rides."
# puts "Driver 2 has driven #{driver2_ride.length} rides."
# puts "Driver 3 has driven #{driver3_ride.length} rides."
# puts "Driver 4 has driven #{driver4_ride.length} rides."

# driver1_cost = driver1_ride.sum { |ride| ride[:COST].to_i }
# driver2_cost = driver2_ride.sum { |ride| ride[:COST].to_i }
# driver3_cost = driver3_ride.sum { |ride| ride[:COST].to_i }
# driver4_cost = driver4_ride.sum { |ride| ride[:COST].to_i }

# puts "Driver 1 has made a total of $#{driver1_cost}."
# puts "Driver 2 has made a total of $#{driver2_cost}."
# puts "Driver 3 has made a total of $#{driver3_cost}."
# puts "Driver 4 has made a total of $#{driver4_cost}."

# driver1_rating = driver1_ride.map { |ride| ride[:RATING].to_f }
# driver2_rating = driver2_ride.map { |ride| ride[:RATING].to_f }
# driver3_rating = driver3_ride.map { |ride| ride[:RATING].to_f }
# driver4_rating = driver4_ride.map { |ride| ride[:RATING].to_f }

# driver1_rating_avg = (driver1_rating.sum / driver1_rating.length).round(2)
# driver2_rating_avg = (driver2_rating.sum / driver2_rating.length).round(2)
# driver3_rating_avg = (driver3_rating.sum / driver3_rating.length).round(2)
# driver4_rating_avg = (driver4_rating.sum / driver4_rating.length).round(2)

# puts "Driver 1 has an average rating of #{driver1_rating_avg}."
# puts "Driver 2 has an average rating of #{driver2_rating_avg}."
# puts "Driver 3 has an average rating of #{driver3_rating_avg}."
# puts "Driver 4 has an average rating of #{driver4_rating_avg}."

# drivers_money = [driver1_cost, driver2_cost, driver3_cost, driver4_cost]
# puts "The driver that made the most money is #{drivers[drivers_money.index(drivers_money.max)]}."

# drivers_rating_avgs = [driver1_rating_avg, driver2_rating_avg, driver3_rating_avg, driver4_rating_avg]
# puts "The driver that has the highest rating is #{drivers[drivers_rating_avgs.index(drivers_rating_avgs.max)]}."
