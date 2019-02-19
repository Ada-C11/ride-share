ride_share = {
  DR0001: [
    {
      date: "3rd Feb 2016", cost: 10, rider_id: "RD0022", rating: 5,
    },
    {
      date: "3rd Feb 2016", cost: 30, rider_id: "RD00015", rating: 4,
    },
    {
      date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2,
    },
  ],
  DR0002: [
    {
      date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5,
    },
    {
      date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1,
    },
    {
      date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3,
    },
  ],
  DR0003: [
    {
      date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5,
    },
    {
      date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2,
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5,
    },
    {
      date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4,
    },
    {
      date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5,
    },
  ],
}

#1. How many Rides has each driver given?
puts "Driver amount of rides"
ride_share.each do |driver, rides|
  print "#{driver}: "
  puts rides.count
end

#2. Total amount of money each driver has made
puts "Total amount earned by each driver"
ride_share.each do |driver, rides|
  money = rides.sum do |record|
    record[:cost]
  end
  puts "#{driver}: $#{money}"
end

#3. # - the average rating for each driver
ride_share.each do |driver, rides|
  average_rating = rides.sum do |record|
    ((record[:rating].to_f) / rides.length).round(2)
  end
  puts "The average rating of #{driver} is #{average_rating}"
end

#4.- Which driver made the most money?
highest_earnings = ride_share.map do |driver, rides|
  { name: driver, total: rides.sum do |record|
    record[:cost]
  end }
end

richest_driver = highest_earnings.max_by do |driver|
  driver[:total]
end

puts "The driver who made the most money: #{richest_driver[:name]}."

#5. # - Which driver has the highest average rating? (Just like previous one)
all_averages = ride_share.map do |driver, rides|
  { name: driver, average: rides.sum do |record|
    ((record[:rating].to_f) / rides.length).round(2)
  end }
end

#  puts all_averages
highest_rated_driver = all_averages.max_by do |element|
  element[:average]
end

puts "The driver with the highest rating is #{highest_rated_driver[:name]}."

# Optional: On which day did each driver make the most money?
most_money_day = ride_share.map do |driver, array|
  { name: driver, most_money_day: array.max_by do |record|
    record[:cost]
    end }
  end

most_money_day.each do |element|
  puts "#{element[:name]} made the most money on #{element[:most_money_day][:date]}"
end
