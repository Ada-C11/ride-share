@big_hash = {
  DR001: [{date: "2 / 3 / 16", money: 10, id: "RD0003", rating: 3},
          {date: "2 / 3 / 16", money: 30, id: "RD0015", rating: 4},
          {date: "2 / 5 / 16", money: 45, id: "RD0003", rating: 2}],
  DR002: [{date: "2 / 3 / 16", money: 25, id: "RD0073", rating: 5},
          {date: "2 / 4 / 16", money: 15, id: "RD0013", rating: 1},
          {date: "2 / 5 / 16", money: 35, id: "RD0066", rating: 3}],
  DR003: [{date: "2 / 4 / 16", money: 5, id: "RD0066", rating: 5},
          {date: "2 / 5 / 16", money: 50, id: "RD0003", rating: 2}],
  DR004: [{date: "2 / 3 / 16", money: 5, id: "RD0022", rating: 5},
          {date: "2 / 4 / 16", money: 10, id: "RD0022", rating: 4},
          {date: "2 / 5 / 16", money: 20, id: "RD0073", rating: 5}],
}

def sum_individual_hashes(key)
  hash = {}
  @big_hash.each do |driver, ride_hashes|
    metric = ride_hashes.inject(0) do |sum, individual_ride|
      sum + individual_ride[key]
    end
    hash[driver] = metric
  end
  return hash
end

def print_hash_data(message1, hash, variable, message2)
  puts message1
  hash.each do |driver, value|
    puts "Driver #{driver}: #{value} #{variable}"
  end
  max_value = hash.values.max
  puts message2
  puts "Driver #{hash.key(max_value)}: #{max_value} #{variable}"
end

puts "Number of rides each driver has given:"
@big_hash.each { |driver, ride_hashes| puts "Driver #{driver}: #{ride_hashes.count} rides" }

total_money = sum_individual_hashes(:money)
print_hash_data("\nMoney earned:", total_money, "dollars", "Highest Earner:")

summed_ratings = sum_individual_hashes(:rating)
average_ratings = {}
summed_ratings.each do |driver, ratings|
  average_ratings[driver] = (ratings.to_f / @big_hash[driver].length).round(2)
end

print_hash_data("\nRatings:", average_ratings, "stars", "Highest Rated:")
