

rides_info = [
  {
    driver: "DR0002",
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [25, 15, 35],
    rider: ["RD0073", "RD0013", "RD0066"],
    rating: [5, 1, 3],
  },
  {
    driver: "DR0003",
    date: ["4th Feb 2016", "5th Feb 2016"],
    cost: [5, 50],
    rider: ["RD0066", "RD0003"],
    rating: [5, 2],
  },
  {
    driver: "DR0004",
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [5, 10, 20],
    rider: ["RD0022", "RD0022", "RD0073"],
    rating: [5, 4, 5],
  },
  {
    driver: "DR0001",
    date: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    cost: [10, 30, 45],
    rider: ["RD0003", "RD0015", "RD0003"],
    rating: [3, 4, 2],
  },
]

# Use an iteration blocks to print the following answers:

# 1 the number of rides each driver has given

rides_info.each do |driver_info|
  puts "Driver #{driver_info[:driver]} drove #{driver_info[:rider].length} rides"
end

# 2 the total amount of money each driver has made

rides_info.each do |driver_info|
  puts "Driver #{driver_info[:driver]} made $#{"%.2f" % driver_info[:cost].reduce(:+)}"
end

# 3 the average rating for each driver

rides_info.each do |driver_info|
  puts "Driver #{driver_info[:driver]} had an average rating of #{driver_info[:rating].reduce(:+) / driver_info[:rating].length}"
end

# 4 Which driver made the most money?
# Accounts for ties

driver_earnings = rides_info.map do |driver_info|
  [driver_info[:driver], driver_info[:cost].reduce(:+)]
end

driver_earnings.to_h.each do |driver, earnings|
  if earnings == driver_earnings.to_h.values.max
    puts "Driver #{driver} earned the most ($#{"%.2f" % earnings})"
  end
end

# 5 Which driver has the highest average rating?
# Accounts for ties

driver_ratings = rides_info.map do |driver_info|
  [driver_info[:driver], driver_info[:rating].reduce(:+) / driver_info[:rating].length]
end

driver_ratings.to_h.each do |driver, rating|
  if rating == driver_ratings.to_h.values.max
    puts "Driver #{driver} had the highest average rating (#{rating})"
  end
end
