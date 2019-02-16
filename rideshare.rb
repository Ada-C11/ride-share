drivers = [
  {driver_id: "DR0001",
   trips: [
    {date: "3rd Feb 2016",
     cost: 5,
     rider_id: "RD0003",
     rating: 3},
    {date: "3rd Feb 2016",
     cost: 30,
     rider_id: "RD0015",
     rating: 4},
    {date: "5th Feb 2016",
     cost: 45,
     rider_id: "RD0003",
     rating: 2},
  ]},
  {driver_id: "DR0002",
   trips: [
    {date: "3rd Feb 2016",
     cost: 25,
     rider_id: "RD0073",
     rating: 5},
    {date: "4th Feb 2016",
     cost: 15,
     rider_id: "RD0013",
     rating: 1},
    {date: "5th Feb 2016",
     cost: 35,
     rider_id: "RD0066",
     rating: 3},
  ]},
  {driver_id: "DR0003",
   trips: [
    {date: "4th Feb 2016",
     cost: 5,
     rider_id: "RD0066",
     rating: 5},
    {date: "5th Feb 2016",
     cost: 50,
     rider_id: "RD0003",
     rating: 2},
  ]},
  {driver_id: "DR0004",
   trips: [
    {date: "3rd Feb 2016",
     cost: 5,
     rider_id: "RD0022",
     rating: 5},
    {date: "4th Feb 2016",
     cost: 10,
     rider_id: "RD0022",
     rating: 4},
    {date: "5th Feb 2016",
     cost: 20,
     rider_id: "RD0073",
     rating: 5},
  ]},
]

def print_summary(drivers, relevant_array, units_string)
  ids = drivers.map do |driver|
    driver[:driver_id]
  end
  return ids.zip(relevant_array).map do |pair|
           puts "#{pair[0]}: #{pair[1]} #{units_string}"
         end
end

def numbers_of_rides(drivers)
  return drivers.map do |driver|
           driver[:trips].length
         end
end

def total_moneys(drivers)
  return drivers.map do |driver|
           driver[:trips].sum do |trip|
             trip[:cost]
           end
         end
end

def average_ratings(drivers)
  return drivers.map do |driver|
           total_rating = driver[:trips].sum do |trip|
             trip[:rating]
           end
           (total_rating * 1.0 / driver[:trips].length).round(2)
         end
end

def top_earner(drivers)
  drivers_by_money = drivers.sort_by do |driver|
    -driver[:total_money]
  end
  return drivers_by_money.first[:driver_id]
end

def top_rated(drivers)
  drivers_by_rating = drivers.sort_by do |driver|
    -driver[:average_rating]
  end
  return drivers_by_rating.first[:driver_id]
end

i = 0
drivers.each do |driver|
  driver[:total_money] = total_moneys(drivers)[i]
  driver[:average_rating] = average_ratings(drivers)[i]
  i += 1
end

puts "NUMBER OF RIDES EACH DRIVER HAS GIVEN:"
print_summary(drivers, numbers_of_rides(drivers), "rides")

puts "TOTAL AMOUNT OF MONEY EACH DRIVER HAS MADE:"
print_summary(drivers, total_moneys(drivers), "dollars")

puts "AVERAGE RATING FOR EACH DRIVER:"
print_summary(drivers, average_ratings(drivers), "stars")

puts "WHICH DRIVER MADE THE MOST MONEY?"
puts top_earner(drivers)

puts "WHICH DRIVER HAS THE HIGHEST AVERAGE RATING?"
puts top_rated(drivers)
