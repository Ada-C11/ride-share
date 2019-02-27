rides = [
  {driver_id: 'DR0004', date: '3rd Feb 2016', cost: 5 , rider_id: 'RD0022', rating: 5},
  {driver_id: 'DR0001', date: '3rd Feb 2016', cost: 10, rider_id: 'RD0003', rating: 3},
  {driver_id: 'DR0002', date: '3rd Feb 2016', cost: 25, rider_id: 'RD0073', rating: 5},
  {driver_id: 'DR0001', date: '3rd Feb 2016', cost: 30, rider_id: 'RD0015', rating: 4},
  {driver_id: 'DR0003', date: '4th Feb 2016', cost: 5 , rider_id: 'RD0066', rating: 5},
  {driver_id: 'DR0004', date: '4th Feb 2016', cost: 10, rider_id: 'RD0022', rating: 4},
  {driver_id: 'DR0002', date: '4th Feb 2016', cost: 15, rider_id: 'RD0013', rating: 1},
  {driver_id: 'DR0003', date: '5th Feb 2016', cost: 50, rider_id: 'RD0003', rating: 2},
  {driver_id: 'DR0002', date: '5th Feb 2016', cost: 35, rider_id: 'RD0066', rating: 3},
  {driver_id: 'DR0004', date: '5th Feb 2016', cost: 20, rider_id: 'RD0073', rating: 5},
  {driver_id: 'DR0001', date: '5th Feb 2016', cost: 45, rider_id: 'RD0003', rating: 2}
]

driver_rides = {}

rides.each do |ride|
    driver_id = ride[:driver_id]
    if driver_rides.key?(driver_id)
        driver_rides[driver_id] += 1
    else
        driver_rides[driver_id] = 1
    end
end

driver_rides.each do |driver_id, num_rides|
  puts "driver #{driver_id} has given #{num_rides} rides"
end

total_earnings = {}

rides.each do |ride|
    driver_id = ride[:driver_id]
    if total_earnings.key?(driver_id)
        total_earnings[driver_id] += ride[:cost]
    else
        total_earnings[driver_id] = ride[:cost]
    end
end

total_earnings.each do |driver_id, earnings|
    puts "driver #{driver_id} has earned $ #{earnings}"
end

ratings = {}

rides.each do |ride|
    driver_id = ride[:driver_id]
    if ratings.key?(driver_id)
        ratings[driver_id].push(ride[:rating])
    else
        ratings[driver_id] = [ ride[:rating], ]
    end
end

ratings.each do |driver_id, rating_list|
    average_rating = rating_list.sum().to_f() / rating_list.length()
    ratings[driver_id] = average_rating
    puts "driver #{driver_id} has an average rating of #{average_rating.round(2)}"
end

best_driver_earning = total_earnings.max_by{ |k, v| v }
puts "driver #{best_driver_earning[0]} earned the most at $#{best_driver_earning[1]}"

best_driver_average_rating = ratings.max_by{ |k, v| v }
puts "driver #{best_driver_average_rating[0]} has the highest average rating of #{best_driver_average_rating[1].round(2)}"
