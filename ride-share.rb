drivers = {
  # Key: Driver ID, value: array of trips (hash)
  :DR0001 => [
    {:date => "3rd Feb 2016", :cost => 10, :rider_id => "RD0003", :rating => 3},
    {:date => "3rd Feb 2016", :cost => 30, :rider_id => "RD0015", :rating => 4},
    {:date => "5th Feb 2016", :cost => 45, :rider_id => "RD0003", :rating => 2},
  ],
  :DR0002 => [
    {:date => "3rd Feb 2016", :cost => 25, :rider_id => "RD0073", :rating => 5},
    {:date => "4th Feb 2016", :cost => 15, :rider_id => "RD0013", :rating => 1},
    {:date => "5th Feb 2016", :cost => 35, :rider_id => "RD0066", :rating => 3},
  ],
  :DR0003 => [
    {:date => "4th Feb 2016", :cost => 5, :rider_id => "RD0066", :rating => 5},
    {:date => "5th Feb 2016", :cost => 50, :rider_id => "RD0003", :rating => 2},
  ],
  :DR0004 => [
    {:date => "3rd Feb 2016", :cost => 5, :rider_id => "RD0022", :rating => 5},
    {:date => "4th Feb 2016", :cost => 10, :rider_id => "RD0022", :rating => 4},
    {:date => "5th Feb 2016", :cost => 20, :rider_id => "RD0073", :rating => 5},
  ],
}

highest_earner, highest_rated = 0, 0
everyones_earnings, everyones_ratings = [], []
daily_total = {}

drivers.each do |driver, trips|
  total_rides, total_earnings, avg_rating, highest_day = 0, 0, 0, 0

  puts
  puts "For driver #{driver}:"
  trips.each do |trip|
    total_rides = trips.length
    total_earnings += trip[:cost]
    avg_rating += trip[:rating].to_f / total_rides

    # Optional: On which day did each driver earn the most money?
    if daily_total[trip[:date]]
      daily_total[trip[:date]] += trip[:cost]
    else
      # Populate hash by assigning value: cost to key: date
      daily_total[trip[:date]] = trip[:cost]
    end
  end

  puts "Total rides: #{total_rides}, total money earned: #{total_earnings}, average rating: #{avg_rating.round(2)}"

  # highest_day: array of date & total earnings of that day
  highest_day = daily_total.max_by { |date, cost| cost }
  puts "Highest earning day: #{highest_day[0]}"

  # Push each driver's total earning into array of everyone's earning
  everyones_earnings << {:driver => driver, :earning => total_earnings}
  # Same with rating
  everyones_ratings << {:driver => driver, :rating => avg_rating}
end

puts
highest_earner = everyones_earnings.max_by { |drivers| drivers[:earning] }
puts "Highest earning driver: #{highest_earner[:driver]}"

highest_rated = everyones_ratings.max_by { |drivers| drivers[:rating] }
puts "Highest rated driver: #{highest_rated[:driver]}"
