ride_share = [
    DR0001 = [{driver_id: "DR0001", date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3 }, 
             {driver_id: "DR0001", date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4 },
            {driver_id: "DR0001", date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2 }
 ],
    DR0002 = [{driver_id: "DR0002", date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5 }, 
            {driver_id: "DR0002", date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1 },
            {driver_id: "DR0002", date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3 }
 ],
    DR0003 = [{driver_id: "DR0003", date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5 }, 
            {driver_id: "DR0003", date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2 }
 ],
    DR0004 = [{driver_id: "DR0004", date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5 }, 
            {driver_id: "DR0004", date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4 },
            {driver_id: "DR0004", date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5 }
 ]

]

#collected driver ids for easier recall later
driver_ids = ride_share.map do |driver|
    driver[0][:driver_id]
end

#Number of rides
puts "Total number of rides:"

total_rides = ride_share.map do |driver|
    driver.length
end

ride_share.each do |driver|
    puts "#{driver[0][:driver_id]}: #{driver.length}"
end

#Total amount earned
puts "\nTotal amount earned:"

totals_earned = []
total_earned = 0
ride_share.each do |driver|
    driver.each do |ride|
        total_earned = total_earned + ride[:cost]
    end
    totals_earned.push(total_earned)
    puts "#{driver[0][:driver_id]}: #{total_earned}"
    total_earned = 0
end

#Average Ratings
puts "\nAverage Ratings"

rating_sum = ride_share.map do |driver|
    driver.map{|ride| ride[:rating]}.sum
end

average_ratings = []
i = 0
while i < rating_sum.length
    average_rating = rating_sum[i].to_f/total_rides[i].to_f
    average_ratings.push(average_rating)
    puts "#{driver_ids[i]}: #{average_rating}"
    i = i + 1
end


#Driver that earned the most
puts "\nDriver that earned the most:"
most_earned = driver_ids[totals_earned.find_index(totals_earned.max)]
puts most_earned
    
#Driver Highest Average Rating
puts "\nDriver with the highest average rating:"
highest_average = driver_ids[average_ratings.find_index(average_ratings.max)]
puts highest_average

