drivers = [
  {id: "DR0004", trips: [ # driver
    {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5}, #trip
    {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4}, # trip
    {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}, # trip
  ]},
  {id: "DR0001", trips: [ # driver
    {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},  # trip
    {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},  # trip
    {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2},  # trip
  ]},
  {id: "DR0002", trips: [ # driver
    {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},  # trip
    {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},  # trip
    {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3},  # trip
  ]},
  {id: "DR0003", trips: [ # driver
    {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5}, # trip
    {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2},  # trip
  ]},
]

puts "\nNumber of rides each driver has given:"
drivers.each do |driver|
  puts "Driver #{driver[:id]} gave this many rides: #{driver[:trips].length}"
end

puts "\nTotal amount of money each driver has made:"
drivers.each do |driver|
  trip_costs = driver[:trips].map do |trip|
    trip[:cost]
  end
  total_earned = trip_costs.reduce(:+)
  puts "Driver #{driver[:id]} made a total of $#{total_earned}"

  driver[:total_earned] = total_earned
end

puts "\nAverage rating for each driver:"
drivers.each do |driver|
  ratings = driver[:trips].map do |trip|
    trip[:rating]
  end
  average_rating = "%.1f" % (ratings.reduce(:+) / ratings.length.to_f)
  puts "Driver #{driver[:id]} has an average raging of #{average_rating}"

  driver[:average_rating] = average_rating
end

# Which driver made the most money?
highest_earning_driver = drivers.max_by { |driver| driver[:total_earned] }[:id]
puts "\nCongratulations, #{highest_earning_driver}!  You earned the most money."

# Which driver has the highest average rating?
highest_rated_driver = drivers.max_by { |driver| driver[:average_rating] }[:id]
puts "Congratulations, #{highest_rated_driver}!  You have the highest average rating."

# Optional enhancement
puts "\nOn which day(s) did each driver make the most money?"
drivers.each do |driver|
  dates_and_earnings = {}

  driver[:trips].each do |trip|
    if !dates_and_earnings.include?(trip[:date])
      dates_and_earnings.store(trip[:date], trip[:cost])
    else
      dates_and_earnings[trip[:date]] += trip[:cost]
    end
  end

  most_lucrative_days = []

  dates_and_earnings.each do |date, earnings|
    most_lucrative_days << date if earnings == dates_and_earnings.values.max
  end

  puts "#{driver[:id]} earned the most on #{most_lucrative_days}."
end
