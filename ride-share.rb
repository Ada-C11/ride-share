drivers_log = {      
    DR0001: [
        {
            rating_of_driver: 3,
            rider: "RD0003",
            cost_of_ride: 10,
            date_of_ride: "3rd Feb 2016"
        }, 
        {
            rating_of_driver: 2,
            rider: "RD0003",
            cost_of_ride: 45,
            date_of_ride: "5th Feb 2016"
        }, 
        {
            rating_of_driver: 4,
            rider: "RD0015",
            cost_of_ride: 30,
            date_of_ride: "3rd Feb 2016"
        }
    ], 
    DR0002: [
        {
            rating_of_driver: 5,
            rider: "RD0073",
            cost_of_ride: 25,
            date_of_ride: "3rd Feb 2016"
        }, 
        {
            rating_of_driver: 1,
            rider: "RD0013",
            cost_of_ride: 15,
            date_of_ride: "4th Feb 2016"
        }, 
        {
            rating_of_driver: 3,
            rider: "RD0066",
            cost_of_ride: 35,
            date_of_ride: "5th Feb 2016"
        }
    ], 
    DR0003: [
        {
            rating_of_driver: 5,
            rider: "RD0066",
            cost_of_ride: 5,
            date_of_ride: "4th Feb 2016"
        }, 
        {
            rating_of_driver: 2,
            rider: "RD0003",
            cost_of_ride: 50,
            date_of_ride: "5th Feb 2016"
        }
    ], 
    DR0004: [ 
        {
            rating_of_driver: 5,
            rider: "RD0022",
            cost_of_ride: 5,
            date_of_ride: "3rd Feb 2016"
        }, 
        {
            rating_of_driver: 4,
            rider: "RD0022",
            cost_of_ride: 10,
            date_of_ride: "4th Feb 2016"
        }, 
        {
            rating_of_driver: 5,
            rider: "RD0073",
            cost_of_ride: 20,
            date_of_ride: "5th Feb 2016"
        }
    ]
}

# The number of rides each driver has given
def number_of_rides(drives)
    drives.each { |driver_id, length_of_hash|
        puts "Driver: #{ driver_id } has given #{ length_of_hash.length } rides."
    }
end

number_of_rides(drivers_log)

# the total amount of money each driver has made
def driver_total(trips)
    total_amount = trips.map { |drivers_id, cost|
        [drivers_id, cost.sum {
            |cost| cost[:cost_of_ride]
            }
        ]
    }
    index = 0
    trips.length.times {
        puts "Driver: #{ total_amount[index][0] } earned a total of $#{ total_amount[index][1] }."
        index += 1
    }
end

driver_total(drivers_log)

# The average rating for each driver
def driver_rating(ratings)
    average_rating = ratings.map { |drivers_id, rating|
        [drivers_id, rating.sum {
            |rating| rating[:rating_of_driver]
            } / rating.length.to_f
        ]
    }

    index = 0
    ratings.length.times {
        puts "Driver: #{ average_rating[index][0] } has an average rating of %.1f. " % [ average_rating[index][1] ]
        index += 1
    }
end

driver_rating(drivers_log)

# Which driver made the most money?
def largest_sum(sum_money)
    most_money = sum_money.map { |drivers_id, money| [
            drivers_id, money.sum {
            |money| money[:cost_of_ride]
            }
        ]
    }
    index = 0
    highest_earner = 0
    driver = 0
    most_money.length.times {
        if most_money[index][1] > highest_earner
            highest_earner = most_money[index][1]
            driver = most_money[index][0]
            index += 1
        elsif  most_money[index][1] < highest_earner
            highest_earner = most_money[index][1]
            index += 1
        else
            highest_earner = most_money[index][1]
            index += 1
        end
    }
    puts "\nDriver ID - #{ driver } earned the most money."
end

largest_sum(drivers_log)

# Which driver has the highest average rating?
def highest_driver_rating(driver_ratings)
    highest_rating = driver_ratings.map { |drivers_id, ratings|
        [drivers_id, ratings.sum {
            |ratings| ratings[:rating_of_driver]
            } / ratings.length.to_f
        ]
    }
    index = 0
    number_one = 0
    driver = 0
    highest_rating.length.times {
        if highest_rating[index][1] > number_one
            number_one = highest_rating[index][1]
            driver = highest_rating[index][0]
            index += 1
        elsif highest_rating[index][1] < number_one
            number_one = highest_rating[index][1]
            index += 1
        else
            number_one = highest_rating[index][1]
            index += 1
        end
    }
    puts "\nDriver ID: #{ driver } has the highest rating."
end

highest_driver_rating(drivers_log)
