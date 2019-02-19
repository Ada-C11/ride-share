# def num_rides(database, driver_id)
# end
# num_rides(drivers_db, "DR0001")
# {
#     markers: [
#     ]
# }
# h[:markers]

# def total_num_rides(drivers_db) 
# #num of rides for each driver

# end

#                  hhhk,k       

drivers_db = {
    DR001: [
      {
        date: "2016-02-03",
        cost: 10,
        rating: 3,
        rider_id: "RD0003",
      },
      {
        date: "2016-02-03",
        cost: 30,
        rating: 4,
        rider_id: "RD0015",
      },
      {
        date: "2016-02-05",
        cost: 45,
        rating: 2,
        rider_id: "RD0003",
      }
    ],
    DR002: [
        {
          date: "2016-02-03",
          cost: 25,
          rating: 5,
          rider_id: "RD0073",
        },
        {
          date: "2016-02-04",
          cost: 15,
          rating: 1,
          rider_id: "RD0013",
        },
        {
          date: "2016-02-05",
          cost: 35,
          rating: 3,
          rider_id: "RD0066",
        }
      ],
      DR003: [
        {
          date: "2016-02-04",
          cost: 5,
          rating: 5,
          rider_id: "RD0066",
        },
        {
          date: "2016-02-05",
          cost: 50,
          rating: 2,
          rider_id: "RD0003",
        }
      ],
      DR004: [
        {
          date: "2016-02-03",
          cost: 5,
          rating: 5,
          rider_id: "RD00722",
        },
        {
          date: "2016-02-04",
          cost: 10,
          rating: 4,
          rider_id: "RD0022",
        },
        {
          date: "2016-02-05",
          cost: 20,
          rating: 5,
          rider_id: "RD0073",
        }
      ]
}

driver1_rides = drivers_db[:DR001]
driver2_rides = drivers_db[:DR002]
driver3_rides = drivers_db[:DR003]
driver4_rides = drivers_db[:DR004]

allrides = [driver1_rides, driver2_rides, driver3_rides, driver4_rides]

allrides.each_with_index do |rides, i|
    puts "Driver ##{i+1} #{rides.length} rides"
end

puts ""

# - the total amount of money each driver has made
# using map (on all rides variable)
# 
# allrides.map do |sum, i|
#     puts  "Driver ##{i+1} #{sum} rides"
# end

driver1_total = driver1_rides.sum{|ride| ride[:cost].to_i }
driver2_total = driver2_rides.sum{|ride| ride[:cost].to_i }
driver3_total = driver3_rides.sum{|ride| ride[:cost].to_i }
driver4_total = driver4_rides.sum{|ride| ride[:cost].to_i }

# puts blocks, each with index
puts "The total amount of money Driver 1 made was $#{driver1_total}."
puts "The total amount of money Driver 2 made was $#{driver2_total}."
puts "The total amount of money Driver 3 made was $#{driver3_total}."
puts "The total amount of money Driver 4 made was $#{driver4_total}."

puts ""

# - the average rating for each driver
# map
average1 = driver1_rides.map {|ride| ride[:rating].to_f} 
average2 = driver2_rides.map {|ride| ride[:rating].to_f} 
average3 = driver3_rides.map {|ride| ride[:rating].to_f} 
average4 = driver4_rides.map {|ride| ride[:rating].to_f} 

driver1_avg = (average1.sum / driver1_rides.length).round(2)
driver2_avg = (average2.sum / driver2_rides.length).round(2)
driver3_avg = (average3.sum / driver3_rides.length).round(2)
driver4_avg = (average4.sum / driver4_rides.length).round(2)
#end
#total_averages = []

puts ""

puts "Average Ratings"

# EWI

puts "Driver 1: #{driver1_avg}"
puts "Driver 2: #{driver2_avg}"
puts "Driver 3: #{driver3_avg}"
puts "Driver 4: #{driver4_avg}"

total_averages.each_with_index do |rides, i|
    puts "Driver ##{i+1} #{rides.length} rides"
end

# - Which driver made the most money?

puts ""

#alltotalsarray
drivers_money = [driver1_total, driver2_total, driver3_total, driver4_total]

puts "Driver #{drivers_db[drivers_money.index(drivers_money.max)]} made the most money." 

puts $/

# - Which driver has the highest average rating?

drivers_rating = [driver1_avg, driver2_avg, driver3_avg, driver4_avg ]

puts "Driver #{drivers_db[drivers_rating.index(drivers_rating.max)]} has the highest rating average." 
