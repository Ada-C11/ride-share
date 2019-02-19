# organizing my data structure
driver_info = [
      { driver_id: "DR0001",
        trips: [
          {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 5.to_f
          },
        {
          date: "3rd Feb 2016",
          cost: 30,
          rider_id: "RD0015",
          rating: 4.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 45,
          rider_id: "RD0003",
          rating: 2.to_f
        },
    ]},
    { driver_id: "DR0002",
      trips: [
        {
          date: "3rd Feb 2016",
          cost: 25,
          rider_id: "RD0073",
          rating: 5.to_f
       },
        {
          date: "4th Feb 2016",
          cost: 15,
          rider_id: "RD0013",
          rating: 1.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 35,
          rider_id: "RD0066",
          rating: 3.to_f
        },
    ]},
    
    { driver_id: "DR0003",
      trips: [
        {
          date: "4th Feb 2016",
          cost: 5,
          rider_id: "RD0066",
          rating: 5.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 20,
          rider_id: "RD0003",
          rating: 2.to_f
        },
      ]},

    { driver_id: "DR0004", 
      trips: [
        {
          date: "3rd Feb 2016",
          cost: 5,
          rider_id: "RD0022",
          rating: 5.to_f
        },
        {
          date: "4th Feb 2016",
          cost: 10,
          rider_id: "RD0022",
          rating: 4.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 20,
          rider_id: "RD0073",
          rating: 5.to_f
        },
      ]},
  ]

# defining my methods to use later

def get_earnings_and_id(driver_info)
  # creating empty hash to pass the values I need later
  driver_totals = {}
  
  # passing keys and values to the driver_totals hash
  driver_info.each_with_index do |driver, i|

    driver_totals[driver[:driver_id]] = {}

    total = 0
    rating = 0

    driver_totals[driver[:driver_id]][:trips] = driver[:trips].length
    
    # calculating best date per driver, total ratings (to average later), and total_earnings
    driver[:trips].each_with_index do |trip, i|   

        max = 0
        if trip[:cost] > max
          driver_totals[driver[:driver_id]][:best_date] = trip[:date]
        end

      rating += trip[:rating]
    
      total += trip[:cost]

      driver_totals[driver[:driver_id]][:total_earned] = total
      driver_totals[driver[:driver_id]][:total_ratings] = rating
      
    end
  end

  return driver_totals
end 

driver_totals = get_earnings_and_id(driver_info)




most_earned_per_driver = []
total_earned_per_driver = []
best_average_all_drivers = []

# Answer 1 - calculate total number of trips per driver

def sum_of_trips(driver_totals)
  driver_totals.each do |driver_id, driver_hash|
    puts "#{driver_id} gave #{driver_hash[:trips]} rides."
  end
end



# Answer 2 - calculate total money earned per driver
def calculate_total_per_driver(driver_totals)
  driver_totals.each  do | driver_id, driver_hash |
  
    puts "#{driver_id} earned $#{driver_hash[:total_earned]}"
  end
end

# Answer 3 - calculate average rating per driver
def calculate_average_rating(driver_totals)
    best_average_all_drivers = []
    driver_totals.each do |driver_id, driver_hash|

      average = (driver_hash[:total_ratings] / driver_hash[:trips])
      puts "#{driver_id} earned an average rating of #{average.round(2)}"
      best_average_all_drivers << average
    end

    puts "\nDriver #{best_average_all_drivers.each_with_index.max[1] + 1} has the best average rating."
end

# Answer 4 - which driver made the most money?
def calculate_most_earned(driver_totals)
  richest_driver = driver_totals.max_by { |driver_id, driver_hash| driver_hash[:total_earned]}
  puts "#{richest_driver[0]} earned the most money - $#{richest_driver[1][:total_earned]}"
end


# Optional - which day was each driver's best day?
def find_best_date(driver_totals)
    driver_totals.each do |driver_id, driver_hash|
        puts "#{driver_id}'s best day was #{driver_hash[:best_date]}"
    end

end

# CALLING ALL METHODS

sum_of_trips(driver_totals)

puts "\n"

calculate_total_per_driver(driver_totals)

puts "\n"

calculate_most_earned(driver_totals)

puts "\n"

calculate_average_rating(driver_totals)

puts "\n"

find_best_date(driver_totals)

