# Ride Share Program
# Create an array of hashes for the rides given
rides = [ { 
    driver_id: "DR0004",
    date: "3rd Feb 2016",
    cost: "5",
    rider_id: "RD0022",
    rating: "5",
},
{  
driver_id: "DR0001",
date: "3rd Feb 2016",
cost: "10",
rider: "RD0003",
rating: "3",
},
{  
driver_id: "DR0002",
date: "3rd Feb 2016",
cost: "25",
rider: "RD0073",
rating: "5",
},
{  
driver_id: "DR0001",
date: "3rd Feb 2016",
cost: "30",
rider: "RD0015",
rating: "4",
},
{  
driver_id: "DR0003",
date: "4th Feb 2016	",
cost: "5",
rider: "RD0066",
rating: "5",
},
{  
driver_id: "DR0004",
date: "4th Feb 2016	",
cost: "10",
rider: "RD0022",
rating: "4",
},
{  
driver_id: "DR0002",
date: "4th Feb 2016",
cost: "15",
rider: "RD0013",
rating: "1",
},
{  
driver_id: "DR0003",
date: "5th Feb 2016",
cost: "50",
rider: "RD0003",
rating: "2",
},
{  
driver_id: "DR0002",
date: "5th Feb 2016",
cost: "35",
rider: "RD0066",
rating: "3",
},
{  
driver_id: "DR0004",
date: "5th Feb 2016",
cost: "20",
rider: "RD0073",
rating: "5",
},
{  
driver_id: "DR0001",
date: "5th Feb 2016",
cost: "45",
rider: "RD0003",
rating: "2",
},
]

drivers = ["DR0001", "DR0002", "DR0003", "DR0004"]

# Create  methods that calculate the number of rides given, the total amount of money each driver made, and the drivers average rating
def driver_rides(array, driver_id)
   @driver_rides = array.select do |ride| 
    ride[:driver_id] == driver_id 
   end
   return @driver_rides.length
end

def dollas
   driver_cost = @driver_rides.sum do |ride|
        ride[:cost].to_i
   end
    return driver_cost
end   

puts $/

def average_rating
  sum =  @driver_rides.sum do |ride|
    ride[:rating].to_i
  end
  average = (sum.to_f / @driver_rides.length).round(2)
  return average
end

total_earnings = []
total_rating = []

# iterate over the drivers array and print out results using created methods
drivers.each_with_index do |driver, i|
    puts "Driver #{i + 1} has driven #{driver_rides(rides, driver)} rides and has made $#{dollas}. Driver #{i + 1}'s rating is #{average_rating}."
    total_earnings << dollas
    total_rating << average_rating
end

puts $/

puts "The driver that made the most money is #{drivers[total_earnings.index(total_earnings.max)]}."

puts $/

puts "The driver that has the highest rating is #{drivers[total_rating.index(total_rating.max)]}."
