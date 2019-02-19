rides = []

rides.push(
  {
    driver_id: "DR0004", 
    date: "3rd Feb 2016", 
    cost: 5, 
    rider_id: "RD0022", 
    rating: 5
    }, 
  {
    driver_id: "DR0001",
    date:	"3rd Feb 2016", 
    cost:	10, 
    rider_id: "RD0003", 
    rating:	3
    },
  {
    driver_id: "DR0002", 
    date:	"3rd Feb 2016", 
    cost:	25, 
    rider_id: "RD0073", 
    rating:	5
    },
  {
    driver_id: "DR0001", 
    date:	"3rd Feb 2016", 
    cost:	30, 
    rider_id: "RD0015", 
    rating:	4
    }, 
  {
    driver_id: "DR0003", 
    date:	"4th Feb 2016", 
    cost:	5, 
    rider_id: "RD0066", 
    rating:	5
    },
  {
    driver_id: "DR0004", 
    date:	"4th Feb 2016", 
    cost:	10, 
    rider_id: "RD0022", 
    rating:	4
    },
  {
    driver_id: "DR0002", 
    date:	"4th Feb 2016", 
    cost:	15, 
    rider_id: "RD0013", 
    rating:	1
    },
  {
    driver_id: "DR0003", 
    date:	"5th Feb 2016", 
    cost:	50, 
    rider_id: "RD0003", 
    rating:	2},
  {
    driver_id: "DR0002", 
    date:	"5th Feb 2016", 
    cost:	35, 
    rider_id: "RD0066", 
    rating:	3
    },
  {
    driver_id: "DR0004", 
    date:	"5th Feb 2016", 
    cost:	20, 
    rider_id: "RD0073", 
    rating:	5
    },
  {
    driver_id: "DR0001", 
    date:	"5th Feb 2016", 
    cost:	45, 
    rider_id: "RD0003", 
    rating:	2}
  )

# Group rides info by driver
drivers_info = rides.group_by { |ride| ride[:driver_id] }


puts "---------Summary---------"
most_money = 0
better_earning = ''
best_rating = 0
best_driver = ''

drivers_info.each do |driver,info|
  puts "Driver #{driver} has given #{info.size} rides."
    earned = info.map{|ride| (ride[:cost])}.sum
    if earned > most_money
      most_money = earned
      better_earning = driver
    end
  puts "Driver #{driver} has earned $#{earned}."
    
    rating = (info.map{|ride| ride[:rating]}.sum.to_f/info.size).round(2)
    if rating > best_rating
      best_rating = rating
      best_driver = driver
    end
  puts "Driver #{driver} has an average rating of #{rating}.\n\n"
end

puts "Driver #{better_earning} is the better earning driver with $#{most_money}."

puts "Driver #{best_driver} is the best rated driver with an average rating of #{best_rating}."
