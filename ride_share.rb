# Data
driver_info =
  {
    DR0001: [
      {
        date: "3rd Feb 2016",
        cost: 10,
        rider_ID: "RD0003",
        driver_rating: 3,
      },
      {
        date: "3rd Feb 2016",
        cost: 30,
        rider_ID: "RD0015",
        driver_rating: 4,

      },
      {
        date: "5th Feb 2016",
        cost: 45,
        rider_ID: "RD0003",
        driver_rating: 2,
      },
    ],

    DR0002: [
      {
        date: "3rd Feb 2016",
        cost: 25,
        rider_ID: "RD0073",
        driver_rating: 5,

      },
      {
        date: "4th Feb 2016",
        cost: 15,
        rider_ID: "RD0013",
        driver_rating: 1,
      },
      {
        date: "5th Feb 2016",
        cost: 35,
        rider_ID: "RD0066",
        driver_rating: 3,
      },
    ],
    DR0003: [
      {
        date: "4th Feb 2016",
        cost: 5,
        rider_ID: "RD0066",
        driver_rating: 5,

      },
      {
        date: "5th Feb 2016",
        cost: 50,
        rider_ID: "RD0003",
        driver_rating: 2,
      },
    ],
    DR0004: [
      {
        date: "3rd Feb 2016",
        cost: 5,
        rider_ID: "RD0022",
        driver_rating: 5,
      },
      {
        date: "4th Feb 2016",
        cost: 10,
        rider_ID: "RD0022",
        driver_rating: 4,

      },
      {
        date: "5th Feb 2016",
        cost: 20,
        rider_ID: "RD0073",
        driver_rating: 5,
      },
    ],
  }

#1. Print the number of rides each driver has given

puts "The number of rides each driver has given are:"

i = 1

driver_info.each do |driver, trips|
  puts " Driver #{i}(#{driver}): #{trips.length} ride(s)"
  i += 1
end

#2. Define money method to calculate the total revenue each driver generated

def money(trips)
  revenue_array = []

  trips.each do |trip|
    revenue_array << trip[:cost]
  end

  total_money = revenue_array.sum
  return total_money
end

puts "The total amount of money each driver has made is:"

i = 1

driver_info.each do |driver, trip|
  puts " Driver #{i}(#{driver}): $#{money(trip)}"
  i += 1
end

#3. Define rating method to calculate the average rating for each driver

puts "The average rating for each driver are:"

def rating(trips)
  rating_array = []

  trips.each do |trip|
    rating_array << trip[:driver_rating]
  end

  avg_rating = rating_array.sum.to_f / rating_array.length.to_f
  return avg_rating.floor(2)
end

i = 1

driver_info.each do |driver, trip|
  puts " Driver #{i}(#{driver}): #{rating(trip).to_f}"
  i += 1
end

#4. Find the driver that made the most money

puts "The Driver(s) that made the most money is/are:"

money_array = []

driver_info.each do |driver, trip|
  money_array << money(trip)
end

n = money_array.length

most_money = money_array.max
(0..n - 1).each do |n|
  if money_array[n] == most_money
    puts "Driver #{n + 1}"
  end
end

#5. Find the driver that has the highest average rating

puts "The Driver(s) that has/have the highest average rating is/are:"

avg_rating_array = []

driver_info.each do |driver, trip|
  avg_rating_array << rating(trip)
end

highest_rating = avg_rating_array.max
n = avg_rating_array.length

(0..n - 1).each do |n|
  if avg_rating_array[n] == highest_rating
    puts "Driver #{n + 1}"
  end
end
