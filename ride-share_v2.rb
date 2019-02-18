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

# get_total adds up the totals for a specific key in an array of hashes
def get_total(rides, key)
  return rides.sum { |ride| ride[key].to_i }
end

def print_all_the_things(zipped_array)
  zipped_array.each do |driver|
    puts "\nDriver ID: #{driver[0]}\nNumber of rides: #{driver[1]}\n" +
           "Total money made: $#{driver[2]}\nAverage Rating: #{driver[3].round(2)}"
  end
end

# Add a layer of hashes to the data structure that uses driver ids as keys
rides_by_driver = rides.group_by { |ride| ride[:driver_id] }

# Create and sort an array that contains the ids of all drivers, to use for mapping and for print statements
drivers = rides_by_driver.keys.sort

# Perform calculations for each driver with map
num_rides = drivers.map { |driver| rides_by_driver[driver].length }
total_money = drivers.map { |driver| get_total(rides_by_driver[driver], :cost) }
average_rating = drivers.map { |driver| get_total(rides_by_driver[driver], :rating).to_f / rides_by_driver[driver].length }

# Calculate which driver made the most money and which has the highest average rating
driver_making_bank = drivers[total_money.index(total_money.max)]
the_charmer = drivers[average_rating.index(average_rating.max)]

print_all_the_things (drivers.zip(num_rides, total_money, average_rating))
puts "\n#{driver_making_bank} made the most money with $#{total_money.max}."
puts "#{the_charmer} had the highest average rating with a rating of" +
       " #{average_rating.max.round(2)}."

puts "\nOPTIONAL: For each driver, on which day did they make the most money?"
# Create and sort array that stores all the possible dates in which rides occured
dates = (rides.map { |ride| ride[:date] }.uniq).sort

# Add a layer of hashes to the data structure that uses dates as keys
rides_by_driver_date = drivers.reduce({}) do |memo, driver|
  memo.merge({ driver => rides_by_driver[driver].group_by { |ride| ride[:date] } })
end

# Create a nested array structure which stores the total money made by each driver on each date
date_totals = drivers.map do |driver|
  dates.map do |date|
    rides_by_driver_date[driver][date] ? get_total(rides_by_driver_date[driver][date], :cost) : 0
  end
end

date_totals.each_with_index do |driver, index|
  max_date = dates[driver.index(driver.max)]
  puts "#{drivers[index]} made the most money when they made $#{driver.max} on #{max_date}."
end
