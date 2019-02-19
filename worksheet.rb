drivers = {
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5,
    },
  ],

  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2,
    },
  ],

  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3,
    },
  ],

  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2,
    },
  ],
}

highest_earning_driver = nil
highest_rated_driver = nil
most_money = 0
highest_avg_rating = 0

drivers.each { |driver, trips|
  sum_money = trips.map { |h| h[:cost] }.sum
  sum_rating = trips.map { |h| h[:rating] }.sum

  if sum_money > most_money
    most_money = sum_money
    highest_earning_driver = driver
  end

  avg_rating = (sum_rating.to_f / trips.length).round(1)

  if avg_rating > highest_avg_rating
    highest_avg_rating = avg_rating
    highest_rated_driver = driver
  end

  puts "Driver #{driver}"
  puts "   has made #{trips.length} trips."
  puts "   has made $#{sum_money}."
  puts "   has an average rating of #{avg_rating}"
  puts "---------------------------------------------------------------"
}
puts "---------------------------------------------------------------"
puts "Driver with the highest rating is #{highest_rated_driver}"
puts "Driver who made the most money is #{highest_earning_driver}"
