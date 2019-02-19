rideshare_info = [
  {
    driver: "DR0001",
    rides: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    cost: [10, 30, 45],
    ratings: [3, 4, 2],
    riders: ["RD0003", "RD0015", "RD0003"],
  },
  {
    driver: "DR0002",
    rides: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [25, 15, 35],
    ratings: [5, 1, 3],
    riders: ["RD0073", "RD0013", "RD0066"],
  },
  {
    driver: "DR0003",
    rides: ["4th Feb 2016", "5th Feb 2016"],
    cost: [5, 50],
    ratings: [5, 2],
    riders: ["RD0066", "RD0003"],
  },
  {
    driver: "DR0004",
    rides: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [5, 10, 20],
    ratings: [5, 4, 5],
    riders: ["RD0022", "RD0022", "RD0073"],
  },
]

def driver_rides(info)
  ride_nums = info.map do |driver|
    rides = driver[:rides].length
  end
  return ride_nums
end

number_of_rides = driver_rides(rideshare_info)

puts "Total number of rides for each driver:"
i = 0
rideshare_info.each do |driver|
  puts "Driver #{(driver[:driver])[-1]}: #{number_of_rides[i]}"
  i += 1
end

def driver_pay(info)
  paychecks = info.map do |driver|
    (driver[:cost]).reduce(:+)
  end
  return paychecks
end

all_paychecks = driver_pay(rideshare_info)

puts "\nTotal paycheck for each driver:"
i = 0
rideshare_info.each do |driver|
  puts "Driver #{(driver[:driver])[-1]}: $#{all_paychecks[i]}"
  i += 1
end

def avg_rating(info)
  avgs = info.map do |driver|
    ((driver[:ratings]).reduce(:+) / driver[:ratings].length.to_f).round(2)
  end
  return avgs
end

all_avgs = avg_rating(rideshare_info)

puts "\nAverage rating for each driver:"
i = 0
rideshare_info.each do |driver|
  puts "Driver #{(driver[:driver])[-1]}: #{all_avgs[i]}"
  i += 1
end

def biggest_paycheck(info)
  paycheck = info.map do |driver|
    [(driver[:cost]).reduce(:+), driver[:driver]]
  end
  most_cash = paycheck.max
  return most_cash[1]
end

puts "\nDriver #{biggest_paycheck(rideshare_info)[-1]} made the most money."

def highest_rating(info)
  rating_avgs = info.map do |driver|
    [(driver[:ratings]).reduce(:+) / driver[:ratings].length.to_f, driver[:driver]]
  end
  max_avg_rating = rating_avgs.max
  return max_avg_rating[1]
end

puts "\nDriver #{highest_rating(rideshare_info)[-1]} has the highest average rating."
