rideshare_data = [
  {
    id: "DR0001",
    rides: [{
      cost: 10,
      date: "3rd Feb 2016",
      rating: 3,
      rider_id: "RD0003",
    },
            {
      cost: 30,
      date: "3rd Feb 2016",
      rating: 4,
      rider_id: "RD0015",
    },
            {
      cost: 45,
      date: "5th Feb 2016",
      rating: 2,
      rider_id: "RD0003",
    }],
  },
  {
    id: "DR0002",
    rides: [{
      cost: 25,
      date: "3rd Feb 2016",
      rating: 5,
      rider_id: "RD0073",
    },
            {
      cost: 15,
      date: "4th Feb 2016",
      rating: 1,
      rider_id: "RD0013",
    },
            {
      cost: 35,
      date: "5th Feb 2016",
      rating: 3,
      rider_id: "RD0066",
    }],
  },
  {
    id: "DR0003",
    rides: [{
      cost: 5,
      date: "4th Feb 2016",
      rating: 5,
      rider_id: "RD0066",
    },
            {
      cost: 50,
      date: "5th Feb 2016",
      rating: 2,
      rider_id: "RD0003",
    }],
  },
  {
    id: "DR0004",
    rides: [{
      cost: 5,
      date: "3rd Feb 2016",
      rating: 5,
      rider_id: "RD0022",
    },
            {
      cost: 10,
      date: "4th Feb 2016",
      rating: 4,
      rider_id: "RD0022",
    },
            {
      cost: 20,
      date: "5th Feb 2016",
      rating: 5,
      rider_id: "RD0073",
    }]
  }
]

i = 0
total_trips_by_driver = []
rideshare_data.each do
  total_trips_by_driver.push(rideshare_data[i][:rides].length)
  i += 1
end

i = 0
n = 0
total_earned_by_driver = []
rating_by_driver = []
best_day_by_driver = []
rideshare_data.length.times do
  total_earned = 0
  ratings = 0
  best_day_earnings = 0
  best_day = 0
  rideshare_data[i][:rides].each do
    total_earned += rideshare_data[i][:rides][n][:cost]
    ratings += rideshare_data[i][:rides][n][:rating]
    if rideshare_data[i][:rides][n][:cost] > best_day_earnings
      best_day_earnings = rideshare_data[i][:rides][n][:cost]
      best_day = rideshare_data[i][:rides][n][:date]
    end
    n += 1
  end
  total_earned_by_driver.push(total_earned)
  average_rating = (ratings.to_f / n).round(1)
  rating_by_driver.push(average_rating)
  best_day_by_driver.push(best_day)
  i += 1
  n = 0
end

i = 0
most_earned = 0
top_earner = nil
top_avg_rating = 0
top_rated = nil
rideshare_data.length.times do
  if total_earned_by_driver[i] > most_earned
    most_earned = total_earned_by_driver[i]
    top_earner = rideshare_data[i][:id]
  end
  if rating_by_driver[i] > top_avg_rating
    top_avg_rating = rating_by_driver[i]
    top_rated = rideshare_data[i][:id]
  end
  i += 1
end

i = 0
rideshare_data.length.times do
  puts "Driver #{rideshare_data[i][:id]} made a total of #{total_trips_by_driver[i]} trips, earning $#{total_earned_by_driver[i]} with an average rating of #{rating_by_driver[i]}.  Their highest earning day was #{best_day_by_driver[i]}."
  i += 1
end

puts "\nThe top earner was driver #{top_earner}, having made $#{most_earned}. \nAnd driver #{top_rated} was the highest rated with an average rating of #{top_avg_rating}."
