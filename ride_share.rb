driver = {
  DR0004: [{
    rider_id: 'RD0022',
    cost: 5,
    date: '3rd Feb 2016',
    rating: 5
  }, {
    rider_id: 'RD0022',
    cost: 10,
    date: '4th Feb 2016',
    rating: 4
  }, {
    rider_id: 'RD0073',
    cost: 20,
    date: '5th Feb 2016',
    rating: 5
  }],

  DR0001: [{
    rider_id: 'RD0003',
    cost: 10,
    date: '3rd Feb 2016',
    rating: 3
  }, {
    rider_id: 'RD0015',
    cost: 30,
    date: '3rd Feb 2016',
    rating: 4
  }, {
    rider_id: 'RD0003',
    cost: 45,
    date: '5th Feb 2016',
    rating: 2
  }],

  DR0002: [{
    rider_id: 'RD0073',
    cost: 25,
    date: '3rd Feb 2016',
    rating: 5
  }, {
    rider_id: 'RD0013',
    cost: 15,
    date: '4th Feb 2016',
    rating: 1
  }, {
    rider_id: 'RD0066',
    cost: 35,
    date: '5th Feb 2016',
    rating: 3
  }],

  DR0003: [{
    rider_id: 'RD0066',
    cost: 5,
    date: '4th Feb 2016',
    rating: 5
  }, {
    rider_id: 'RD0003',
    cost: 50,
    date: '5th Feb 2016',
    rating: 2
  }]
}

# The number of rides each driver has given

def determine_rides(driver)
  driver.each do |driver_id, rides|
    puts "Driver ID: #{driver_id} has completed #{rides.length} rides"
  end
end

determine_rides(driver)

# The total amount of money each driver has made

driver.each do |driver_id, rides|
  total = rides.map { |rider| rider[:cost] }
  puts "Driver ID: #{driver_id} has earned $#{total.sum} dollars for all rides"
end

# The average rating for each driver

driver.each do |driver_id, rides|
  rating = rides.map { |rider| rider[:rating] }
  puts "The average rating for Driver ID: #{driver_id} is #{format('%.2f', rating.sum.to_f / rides.length)}"
end

# Which driver made the most money?

most_money = 0
most_driver_money = ''
driver.each do |driver_id, rides|
  total = rides.map { |rider| rider[:cost] }.sum
  if total > most_money
    most_money = total
    most_driver_money = driver_id
  end
end
puts "DRIVER: #{most_driver_money} made $#{most_money} dollars which is the most money of all the drivers."

# Which driver has the highest average rating?

highest_rating = 0
driver_highest_rating = ''

driver.each do |driver_id, rides|
  rating = rides.map { |rider| rider[:rating] }
  average = rating.sum.to_f / rating.length
  if average > highest_rating
    highest_rating = average
    driver_highest_rating = driver_id
  end
end
puts "DRIVER: #{driver_highest_rating} has an average rating of #{format('%.2f',highest_rating)} which is the highest rating."

# For each driver, on which day did they make the most money?

driver.each do |driver_id, rides|
  highest_cost = 0
  best_day = ''
  rides.each do |rider|
    if rider[:cost] > highest_cost
      highest_cost = rider[:cost]
      best_day = rider[:date]
    end
  end
  puts "DRIVER: #{driver_id} made the most money $#{highest_cost} dollars on #{best_day}."
end
