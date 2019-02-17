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
    date: "4th Feb 2016",
    cost: "5",
    rider_id: "RD0066",
    rating: "5",
  },
  {
    driver_id: "DR0004",
    date: "4th Feb 2016",
    cost: "10",
    rider_id: "RD0022",
    rating: "4",
  },
  {
    driver_id: "DR0002",
    date: "4th Feb 2016",
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
# Create and sort an array that contains the ids of all drivers, to use for mapping and for print statements
drivers = (rides.map { |ride| ride[:driver_id] }.uniq).sort

# get_driver_rides returns an array of hashes that contain information about rides for a specific driver
def get_driver_rides(rides, driverID)
  return rides.select { |ride| ride[:driver_id] == driverID }
end

# Add another layer to the original data structure by grouping the ride hashes into arrays that correspond with a driver
rides_by_driver = drivers.map { |driver| get_driver_rides(rides, driver) }

puts "\nThe number of rides each driver has given:"
num_rides = rides_by_driver.map { |driver| driver.length }
num_rides.each_with_index do |num, index|
  puts "#{drivers[index]}: #{num} rides"
end

puts "\nThe total amount of money each driver has made:"

def get_total(rides, key)
  return rides.sum { |ride| ride[key].to_i }
end

total_money = rides_by_driver.map { |driver| get_total(driver, :cost) }
total_money.each_with_index do |money, index|
  puts "#{drivers[index]}: $#{money} total"
end

puts "\nThe average rating for each driver:"

average_rating = rides_by_driver.map { |driver| (get_total(driver, :rating).to_f)/driver.length }
average_rating.each_with_index do |rating, index|
  puts "#{drivers[index]}:  #{rating.round(2)} average rating"
end

puts "\nWhich driver made the most money?"
driver_making_bank = drivers[total_money.index(total_money.max)]
puts "#{driver_making_bank} made the most money with $#{total_money.max}."

puts "\nWhich driver has the highest average rating?"
the_charmer = drivers[average_rating.index(average_rating.max)]
puts "#{the_charmer} had the highest rating with a rating of #{average_rating.max.round(2)}."

puts "\nOPTIONAL: For each driver, on which day did they make the most money?"
# Create and sort array that stores all the possible dates in which rides occured
dates = (rides.map { |ride| ride[:date] }.uniq).sort

# get_rides_by_date takes an array of hashes and a date as arguments, and returns an array
# of hashes where the trip date is equal to the date provided
def get_rides_by_date(rides, date)
  return rides.select { |ride| ride[:date] == date }
end

# get_rides_by_date is mapped to each driver array to add yet another layer to the data structure
# The hashes within each driver array are grouped into arrays corresponding to date.
rides_by_driver_date = rides_by_driver.map do |driver|
  dates.map do |date|
    get_rides_by_date(driver, date)
  end
end

# Create a nested array structure which stores the total money made by each driver on each date
date_totals = rides_by_driver_date.map do |driver|
  driver.map do |date|
    get_total(date, :cost)
  end
end

date_totals.each_with_index do |driver, index|
  max_date = dates[driver.index(driver.max)]
  puts "Driver #{drivers[index]} made the most money on #{max_date}, when they made $#{driver.max}."
end
