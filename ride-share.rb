info = [
  {
    driver: ["DR0001"],
    rider: ["RD0003", "RD0015", "RD0003"],
    date: ["02.03.16", "02.03.16", "02.05.16"],
    cost: [10, 30, 45],
    rating: [3, 4, 2],
  },

  {
    driver: ["DR0002"],
    rider: ["RD0073", "RD0013", "RD0066"],
    date: ["02.03.16", "02.04.16", "02.05.16"],
    cost: [25, 15, 35],
    rating: [5, 1, 3],
  },

  {
    driver: ["DR0003"],
    rider: ["RD0066", "RD0003"],
    date: ["02.04.16", "02.05.16"],
    cost: [5, 50],
    rating: [5, 2],
  },

  {
    driver: ["DR0004"],
    rider: ["RD0022", "RD0022", "RD0073"],
    date: ["02.03.16", "02.03.16", "02.05.16"],
    cost: [5, 10, 20],
    rating: [5, 4, 5],
  },
]

i = 1
max_array = []
max_rating = []
day_with_most_money = []
info.each do |driver_info|
# Number of rides eachd driver has given.
  riders_for_this_driver_info = driver_info[:rider].count

# I put the total amount of money made for each driver in an array so I can access individual data for each driver.
  max_array << cost_for_this_driver_info = driver_info[:cost].sum

# The average rating for each driver, put into an array to get highest rating.
  max_rating << average_rating = (driver_info[:rating].sum.to_f.round(2)) / driver_info[:rating].length

# Answer to Qs 1 and 2.
  puts "Driver #{i} has given #{riders_for_this_driver_info} rides and has made $#{cost_for_this_driver_info}. Average rating: #{average_rating.round(2)}"
  i += 1
end
# Answer to Qs 3 and 4
puts "The Driver at index #{max_array.each_with_index.max[1]} made the most money $#{max_array.max}."
puts "The Driver at index #{max_rating.each_with_index.max[1]} has the highest average rating at: #{max_rating.max.round(2)}."

