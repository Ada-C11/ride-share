##### RIDE SHARE PROGRAM #####

# place to store all ride data
rides = {
    DR0001: 
    [
        {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
        {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
        {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
    ],

    DR0002:
    [
        {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
        {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
        {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}
    ],

    DR0003:
    [
        {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
        {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
    ],

    DR0004:
    [
        {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
        {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
        {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
    ]
}

# counts total number of rides complete per driver
def total_rides_by_driver(rides)
    total_rides = {}

    rides.each do |driver, ride_data|
        total_rides[driver] = ride_data.length
    end
    return total_rides
end

# sums total amount of money made per driver
def total_money_by_driver(rides)
    total_money = {}
    
    rides.each do |driver, ride_data| 
        ride_cost = ride_data.map { |hash| hash[:cost] }
        total_money[driver] = ride_cost.sum
    end
    return total_money
end

# averages ratings per driver
def average_rating_by_driver(rides)
    average_rating = {}

    rides.each do |driver, ride_data| 
        ride_rating = ride_data.map { |hash| hash[:rating] }
        rating_average = ride_rating.sum.to_f / total_rides_by_driver(rides)[driver].to_f
        average_rating[driver] = rating_average.round(1)
    end
    return average_rating
end

# finds driver who made the most money
def driver_with_most_money(rides)
    driver_with_max_money = total_money_by_driver(rides).max_by {|k, v| v}
    return driver_with_max_money
end

# finds driver who has the highest average rating
def driver_with_highest_rating(rides)
    driver_with_highest_average_rating = average_rating_by_driver(rides).max_by {|k, v| v}
    return driver_with_highest_average_rating
end

# displays driver summary
def print_driver_summary(total_rides,total_money, average_rating,driver_with_max_money, driver_with_highest_average_rating)
    # displays total number of rides complete per driver to the user
    puts "\nTotal number of rides given:"
    total_rides.each do |driver, rides| 
        puts "Driver #{driver} drove a total of #{rides} rides."
    end

    # displays total amount of money made per driver to the user
    puts "\nTotal amount of money made:"
    total_money.each do |driver, money|
        puts "Driver #{driver} made $#{money}."
    end

    # displays average ratings per driver to the user
    puts "\nAverage ride rating:"
    average_rating.each do |driver, rating|
        puts "Driver #{driver} has an average rating of #{rating} out of 5 stars."
    end

    # displays driver who made the most money to the user
    puts "\nMost money earned:"
    puts "The driver who made the most money is #{driver_with_max_money[0]}." 

    # displays driver who has the highest average rating to the user
    puts "\nHighest average rating awarded:"
    puts "The driver with the highest average rating is #{driver_with_highest_average_rating[0]}."
end

print_driver_summary(total_rides_by_driver(rides), total_money_by_driver(rides), average_rating_by_driver(rides), driver_with_most_money(rides), driver_with_highest_rating(rides))
