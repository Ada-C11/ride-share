rides = [
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

# find the number of rides each driver has given
# using @ allows me to shorthand use driver_rides in the other methods
def number_of_rides(rides_array, driver_id)
  @driver_rides = rides_array.select do |ride|
    ride[:driver_id] == driver_id
  end
  return @driver_rides.length
end

# find the total amount of money each driver has made
def money_earned
  driver_earned = @driver_rides.sum do |ride|
    ride[:cost]
  end
  return driver_earned
end

# find the average rating for each driver
def avg_rating
  sum_rating = @driver_rides.sum do |ride|
    ((ride[:rating].to_f) / @driver_rides.length).round(2)
  end
  return sum_rating
end

# (optional) for each driver, which day did they make the most money
def most_earnings_day
  most_earning = @driver_rides.max_by do |ride|
    ride[:cost]
  end
  return most_earning[:date]
end

# create an rides_array of driver ids, helpful to print statements below
drivers = rides.map do |ride|
  ride[:driver_id]
end
drivers = drivers.uniq.sort!

all_earnings = []
all_rating_averages = []

drivers.each do |driver|
  puts "\n~Driver #{driver}~"
  puts "Number of rides: #{number_of_rides(rides, driver)}"
  puts "Total earnings: $#{money_earned}"
  puts "Average rating: #{avg_rating}"
  puts "Day they earned the most money: #{most_earnings_day}"

  all_earnings << money_earned
  all_rating_averages << avg_rating
end

puts "\n#{drivers[all_earnings.index(all_earnings.max)]} made the most money with $#{all_earnings.max}"

puts "#{drivers[all_rating_averages.index(all_rating_averages.max)]} had the highest average rating of #{all_rating_averages.max}"
