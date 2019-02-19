rides = [
  {
    "driver_id": "DR0004",
    "date": "3rd Feb 2016",
    "cost": 5,
    "rider_id": "RD0022",
    "rating": 5
  }, 
  {
    "driver_id": "DR0001",
    "date": "3rd Feb 2016",
    "cost": 10,
    "rider_id": "RD0003",
    "rating": 3
  }, 
  {
    "driver_id": "DR0002",
    "date": "3rd Feb 2016",
    "cost": 25,
    "rider_id": "RD0073",
    "rating": 5
  }, 
  {
    "driver_id": "DR0001",
    "date": "3rd Feb 2016",
    "cost": 30,
    "rider_id": "RD0015",
    "rating": 4
  }, 
  {
    "driver_id": "DR0003",
    "date": "4th Feb 2016",
    "cost": 5,
    "rider_id": "RD0066",
    "rating": 5
  }, 
  {
    "driver_id": "DR0004",
    "date": "4th Feb 2016",
    "cost": 10,
    "rider_id": "RD0022",
    "rating": 4
  }, 
  {
    "driver_id": "DR0002",
    "date": "4th Feb 2016",
    "cost": 15,
    "rider_id": "RD0013",
    "rating": 1
  }, 
  {
    "driver_id": "DR0003",
    "date": "5th Feb 2016",
    "cost": 50,
    "rider_id": "RD0003",
    "rating": 2
  }, 
  {
    "driver_id": "DR0002",
    "date": "5th Feb 2016",
    "cost": 35,
    "rider_id": "RD0066",
    "rating": 3
  }, 
  {
    "driver_id": "DR0004",
    "date": "5th Feb 2016",
    "cost": 20,
    "rider_id": "RD0073",
    "rating": 5
  }, 
  {
    "driver_id": "DR0001",
    "date": "5th Feb 2016",
    "cost": 45,
    "rider_id": "RD0003",
    "rating": 2
  }
] 

# The number of rides each driver has given

ride_drivers = rides.map do |ride|
  ride[:driver_id]
end

ride_counts = Hash.new(0)
ride_drivers.each do |driver|
  ride_counts[driver] += 1
end
ride_counts.sort.each do |key, value|
  puts "Driver #{key} has given #{value} rides."
end

# The total amount of money each driver has made

ride_costs = rides.map do |ride|
  {ride[:driver_id] => ride[:cost]}
end

total_earnings = Hash.new(0)
ride_costs.each do |x|
  x.each do |key, value|
    total_earnings[key] += value
  end
end
total_earnings.sort.each do |key, value|
  puts "Driver #{key} has made total $#{value}."
end

#  Which driver made the most money?
largest_earning = total_earnings.max_by{|key, value| value}
puts "Driver #{largest_earning[0]} made the most money."

# The average rating for each driver 
ride_ratings = rides.map do |ride|
  {ride[:driver_id] => ride[:rating]}
end
total_ratings = Hash.new(0)
average_ratings = Hash.new(0)

ride_ratings.each do |x|
  x.map do |key, value|
    average_ratings[key] = (total_ratings[key] += value).to_f/ ride_counts[key]
  end
end
average_ratings.sort.each do |key, value|
  puts "Driver #{key} has average rating of #{'%.2f' %value}."
end

# Which driver has the highest average rating?
highest_rating = average_ratings.max_by{|key, value| value}
puts "Driver #{highest_rating[0]} has the highest average rating."

# For each driver, on which day did they make the most money?
ride_stats = Hash.new
rides.each do |ride|
  ride_stats[ride[:driver_id]] ||= {}
  ride_stats[ride[:driver_id]][ride[:date]] ||= 0
  ride_stats[ride[:driver_id]][ride[:date]] += ride[:cost]
end

ride_stats.sort.each do |driver_id, driver_stats|
  profitable_day, amount_earned = driver_stats.max_by{|k,v| v}
  puts "Driver #{driver_id} made the most money on #{profitable_day} with $#{amount_earned} earning."
end
