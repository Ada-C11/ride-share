rideshare_info = {
  DR0001: [
    {date: "3rd Feb 2016", cost: 10, rider: "RD0022", rating: 5},
    {date: "3rd Feb 2016", cost: 30, rider: "RD0015", rating: 4},
    {date: "5th Feb 2016", cost: 45, rider: "RD0003", rating: 2},
  ],

  DR0002: [
    {date: "3rd Feb 2016", cost: 25, rider: "RD0073", rating: 5},
    {date: "4th Feb 2016", cost: 15, rider: "RD0013", rating: 1},
    {date: "5th Feb 2016", cost: 35, rider: "RD0066", rating: 3},
  ],

  DR0003: [
    {date: "4th Feb 2016", cost: 5, rider: "RD0066", rating: 5},
    {date: "5th Feb 2016", cost: 50, rider: "RD0003", rating: 2},
  ],

  DR0004: [
    {date: "3rd Feb 2016", cost: 5, rider: "RD0022", rating: 5},
    {date: "4th Feb 2016", cost: 10, rider: "RD0022", rating: 4},
    {date: "5th Feb 2016", cost: 20, rider: "RD0073", rating: 5},
  ],
}

rideshare_info.each do |driver, rides|
  ride_count = rides.count
  puts "#{driver} gave #{rides.count} rides"
end

def added_ride_info(mama_hash, key)
  new_hash = {}
  mama_hash.each do |driver, rides|
    total = rides.sum { |ride| ride[key] }
    new_hash[driver] = total
  end
  return new_hash
end

earnings_hash = added_ride_info(rideshare_info, :cost)
earnings_hash.each do |driver, earnings|
  puts "#{driver} made a total of $#{"%.2f" % earnings}"
end

ratings_hash = added_ride_info(rideshare_info, :rating)
ratings_hash.each do |driver, ratings|
  ratings_hash[driver] = (ratings.to_f) / (rideshare_info)[driver].length
  puts "#{driver} has an average rating of #{"%.1f" % ratings_hash[driver]}"
end

highest_earner = earnings_hash.max_by { |driver, earnings| earnings }

highest_rated = ratings_hash.max_by { |driver, rating| rating }

puts "================= THE WINNERS ================="
puts "#{highest_earner[0]} is the highest earner with $#{"%.2f" % highest_earner[1]}, and #{highest_rated[0]} 
is the highest rated with #{"%.1f" % highest_rated[1]}!"
