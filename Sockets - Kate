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

most_earned = 0
top_earner = ""
top_rated = ""
highest_rating = 0

driver_rides = {}

rides.each do |ride|
  driver_id = ride[:driver_id]
  if driver_rides.key?(driver_id)
    driver_rides[driver_id] += 1
  else
    driver_rides[driver_id] = 1
  end
end

total_earnings = {}

rides.each do |ride|
  driver_id = ride[:driver_id]
  if total_earnings.key?(driver_id)
    total_earnings[driver_id] += ride[:cost].to_i
  else
    total_earnings[driver_id] = ride[:cost].to_i
  end
end

rating = {}

rides.each do |ride|
  driver_id = ride[:driver_id]
  if rating.key?(driver_id)
    rating[driver_id].push(ride[:rating].to_i)
  else
    rating[driver_id] = [ride[:rating].to_i]
  end
end

driver_rides.each do |driver_id, num_rides|
  rating_list = rating[driver_id]
  avg_rating = rating_list.sum().to_f() / rating_list.length()
  rating[driver_id] = avg_rating
  total_earned = total_earnings[driver_id]
  if total_earned > most_earned
    most_earned = total_earned
    top_earner = driver_id
  end
  if avg_rating > highest_rating
    highest_rating = avg_rating
    top_rated = driver_id
  end

  puts "Driver #{driver_id} has given #{num_rides} rides, has earned $#{total_earned}, and has an average rating of #{avg_rating.round(2)}."
end

#summaries
puts "Driver #{top_earner} earned the most money, with $#{most_earned}."

puts "Driver #{top_rated} has the highest rating, at #{highest_rating.round(2)}."
