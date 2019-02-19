# Create the data structure by starting with the outline. Then, assign this data structure to a variable. 
# Give the variable a good name that represents what the outermost layer is
@drivers_data = {
    DR001: [
    {trip_date: "2016-02-03", trip_cost: 10, rider_id: "RD0003", trip_rating: 3},
    {trip_date: "2016-02-03", trip_cost: 30, rider_id: "RD0015", trip_rating: 4},
    {trip_date: "2016-05-16", trip_cost: 45, rider_id: "RD0003", trip_rating: 2}
    ],
    DR002: [
    {trip_date: "2016-02-03", trip_cost: 25, rider_id: "RD0073", trip_rating: 5},
    {trip_date: "2016-02-04", trip_cost: 15, rider_id: "RD0013", trip_rating: 1},
    {trip_date: "2016-02-05", trip_cost: 35, rider_id: "RD0066", trip_rating: 3}
    ],
    DR003: [
    {trip_date: "2016-02-04", trip_cost: 5, rider_id: "RD0066", trip_rating: 5},
    {trip_date: "2016-02-05", trip_cost: 50, rider_id: "RD0003", trip_rating: 2}
    ],
    DR004: [
    {trip_date: "2016-02-03", trip_cost: 5, rider_id: "RD0022", trip_rating: 5},
    {trip_date: "2016-02-04", trip_cost: 10, rider_id: "RD0022", trip_rating: 4},
    {trip_date: "2016-02-05", trip_cost: 20, rider_id: "RD0073", trip_rating: 5}
    ]
}

puts "The number of rides each driver has given is:" 
@drivers_data.map do |driver, trips| 
    puts "Driver #{driver}: #{trips.length} rides" 
end 

# Totals method for total rides and rating
def total_of(key)
    total = {}
    @drivers_data.each do |driver, value|
    total_2 = []
    value.each do |value2|
            total_2 << value2[key]
        end 
    total_sum = total_2.sum 
    total[driver] = total_sum
    end 
    return total
end 

# max method for rides and rating
def max_total(hash)
    hash.each do |key,value|
    if value == hash.values.max
    return "#{key} with: #{value}"
end
end
end

puts "\n\The total earnings per driver is: " 
total_earnings = total_of(:trip_cost)
total_earnings.each do |driver, value| 
    puts "Driver #{driver}: #{value} dollars" 
end 

# Driver with most earnings 
puts "\n\The driver with most earnings is: #{max_total(total_earnings)} dollars"

# Average rating per each driver 
puts "\n\The average rating per driver is"
average_rating = total_of(:trip_rating)
rating = {}
average_rating.each do |driver, value| 
    rating[driver] = ('%.02f' % (value.to_f / @drivers_data[driver].size))
end 
rating.each do |driver, value|
    puts "Driver #{driver}: #{value} rating" 
end 

# The driver with best rating 
puts "\n\The driver with best rate is: #{max_total(rating)} rate" 
