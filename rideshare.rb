

trip_array = [
  {
    driver_id: "DR0004",
    date: "3rd Feb 2016",
    cost: 5,
    rider_id: "RD0022",
    rating: 5,
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 10,
    rider_id: "RD0003",
    rating: 3,
  },
  {
    driver_id: "DR0002",
    date: "3rd Feb 2016",
    cost: 25,
    rider_id: "RD0073",
    rating: 5,
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 30,
    rider_id: "RD0015",
    rating: 4,
  },
  {
    driver_id: "DR0003",
    date: "4th Feb 2016",
    cost: 5,
    rider_id: "RD0066",
    rating: 5,
  },
  {
    driver_id: "DR0004",
    date: "4th Feb 2016",
    cost: 10,
    rider_id: "RD0022",
    rating: 4,
  },
  {
    driver_id: "DR0002",
    date: "4th Feb 2016",
    cost: 15,
    rider_id: "RD0013",
    rating: 1,
  },
  {
    driver_id: "DR0003",
    date: "5th Feb 2016",
    cost: 50,
    rider_id: "RD0003",
    rating: 2,
  },
  {
    driver_id: "DR0002",
    date: "5th Feb 2016",
    cost: 35,
    rider_id: "RD0066",
    rating: 3,
  },
  {
    driver_id: "DR0004",
    date: "5th Feb 2016",
    cost: 20,
    rider_id: "RD0073",
    rating: 5,
  },
  {
    driver_id: "DR0001",
    date: "5th Feb 2016",
    cost: 45,
    rider_id: "RD0003",
    rating: 2,
  },
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

def print_hashes_nicely(array_of_hashes)
  array_of_hashes.each do |item|
    puts "\t#{item.keys[0]}: #{item.values[0]}"
  end
end

def get_drivers(trip_array)
  all_drivers = trip_array.map do |hash|
    hash.values_at(:driver_id)
  end
  return all_drivers
end

def get_trip_number(unique_drivers, all_drivers)
  number_trips = unique_drivers.map do |driver|
    {driver => all_drivers.count(driver)}
  end

  return number_trips
end

def find_cost(array, driver)
  all_costs = array.map do |hash|
    hash.values_at(:driver_id) == [driver] ? hash[:cost] : 0
  end

  return all_costs
end

def find_ratings_average(array, driver)
  all_ratings = array.map do |hash|
    hash.values_at(:driver_id) == [driver] ? hash[:rating] : 0
  end
  all_ratings.reject! do |item|
    item == 0
  end

  ratings_average = format("%.2f", ((all_ratings.sum).to_f / all_ratings.size))
  return ratings_average
end

def get_earnings(unique_drivers, trip_array)
  drivers_earnings = unique_drivers.map do |driver|
    {driver => "$#{find_cost(trip_array, driver).sum}.00"}
  end
  return drivers_earnings
end

def get_average_rating(unique_drivers, trip_array)
  drivers_average_rating = unique_drivers.map do |driver|
    {driver => "#{find_ratings_average(trip_array, driver)}"}
  end
  return drivers_average_rating
end

def get_merged_hash(array)
  merged_hash = array.reduce do |memo, hash|
    memo.merge(hash)
  end
  return merged_hash
end

def largest_hash_key(hash)
  return hash.max_by { |k, v| v }[0]
end

def driver_highest_pay(unique_drivers, trip_array)
  highest_pay = unique_drivers.map do |driver|
    {driver: driver,
     cost: find_cost(trip_array, driver).max}
  end

  biggest_day = []

  highest_pay.each do |hash|
    trip_array.each do |hash2|
      if hash2[:driver_id] == hash[:driver] && hash2[:cost] == hash[:cost]
        biggest_day << {hash[:driver] => hash2[:date]}
      end
    end
  end

  return biggest_day
end

# - the number of rides each driver has given

all_drivers = get_drivers(trip_array).flatten

unique_drivers = all_drivers.uniq.sort

number_trips = get_trip_number(unique_drivers, all_drivers)

puts "Each driver's trips: "
print_hashes_nicely(number_trips)

# - the total amount of money each driver has made

drivers_earnings = get_earnings(unique_drivers, trip_array)
puts "Earnings:"
print_hashes_nicely(drivers_earnings)

# - the average rating for each driver

drivers_average_rating = get_average_rating(unique_drivers, trip_array)
puts "Average ratings:"
print_hashes_nicely(drivers_average_rating)

# - Which driver made the most money?

earnings_hash = get_merged_hash(drivers_earnings)

puts "Driver with the highest earnings: #{largest_hash_key(earnings_hash)}"

# - Which driver has the highest average rating?

ratings_hash = get_merged_hash(drivers_average_rating)

puts "Driver with the highest average rating: #{largest_hash_key(ratings_hash)}"

#  - On which day did each driver make the most money?

biggest_day = driver_highest_pay(unique_drivers, trip_array)

puts "The date on which each driver made the most money: "
print_hashes_nicely(biggest_day)
