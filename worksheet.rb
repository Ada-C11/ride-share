
drivers = [
  {
    driver_id: "DR0001",
    rides: [
      {
        rider_id: "RD0003",
        date: "3rd Feb 2016",
        cost: 10,
        rating: 3,
      },
      {
        rider_id: "RD0003",
        date: "5th Feb 2016",
        cost: 45,
        rating: 2,
      },
      {
        rider_id: "RD0015",
        date: "3rd Feb 2016",
        cost: 30,
        rating: 4,
      },
    ],
  },
  {
    driver_id: "DR0002",
    rides: [
      {
        rider_id: "RD0073",
        date: "3rd Feb 2016",
        cost: 25,
        rating: 5,
      },
      {
        rider_id: "RD0013",
        date: "4th Feb 2016",
        cost: 15,
        rating: 1,
      },
      {
        rider_id: "RD0066",
        date: "5th Feb 2016",
        cost: 35,
        rating: 3,
      },
    ],
  },
  {
    driver_id: "DR0003",
    rides: [
      {
        rider_id: "RD0066",
        date: "4th Feb 2016",
        cost: 5,
        rating: 5,
      },
      {
        rider_id: "RD0003",
        date: "5th Feb 2016",
        cost: 50,
        rating: 2,
      },
    ],
  },
  {
    driver_id: "DR0004",
    rides: [
      {
        rider_id: "RD0022",
        date: "3rd Feb 2016",
        cost: 5,
        rating: 5,
      },
      {
        rider_id: "RD0022",
        date: "4th Feb 2016",
        cost: 10,
        rating: 4,
      },
      {
        rider_id: "RD0073",
        date: "5th Feb 2016",
        cost: 20,
        rating: 5,
      },
    ],
  },
]

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
puts "The number of rides each driver has given are: "
drivers.each do |driver|
  puts " Driver #{driver[:driver_id]} has given #{driver[:rides].length} rides."
end

# method to get the sum of all money earned for each driver
def each_driver_money(driver)
  money = driver[:rides].map.sum do |ride|
    ride[:cost]
  end
  return money
end

# method to get average rating for each driver
def driver_avg_rating(driver)
  all_ratings = driver[:rides].map { |ride| ride[:rating] }
  avg_rating = all_ratings.sum.to_f / all_ratings.length.to_f
  return avg_rating
end

# - the total amount of money each driver has made
puts "\nTotal amount of money each driver has made: "
drivers.each do |driver|
  money = each_driver_money(driver)
  puts " Driver #{driver[:driver_id]} has made $#{money}."
end

# - the average rating for each driver
puts "\nThe average rating for each driver:"
drivers.each do |driver|
  avg_rating = driver_avg_rating(driver)
  puts " Driver #{driver[:driver_id]}'s average rating is: #{avg_rating}."
end

# - Which driver made the most money?
drivers_money = drivers.map do |driver|
  money = each_driver_money(driver)
  {
    driver_id: driver[:driver_id],
    total_money: money,
  }
end
driver_max_money = drivers_money.max_by do |driver|
  driver[:total_money]
end
puts "Driver who made the most money is #{driver_max_money[:driver_id]}."

# - Which driver has the highest average rating?
avg_ratings = drivers.map do |driver|
  avg_rating = driver_avg_rating(driver)
  {
    driver_id: driver[:driver_id],
    avg_rating: avg_rating,
  }
end
driver_highest_rating = avg_ratings.max_by do |driver|
  driver[:avg_rating]
end
puts "Driver with the highest average rating is #{driver_highest_rating[:driver_id]}."
