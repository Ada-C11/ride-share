rideshare = [
  {
    driver_id: "DR0001",
    rides: [
      {
        cost: 5,
        rider_id: "RD0003",
        rating: 3,
        date: "3rd Feb 2016",
      },
      {
        cost: 30,
        rider_id: "RD0015",
        rating: 4,
        date: "3rd Feb 2016",
      },
      {
        cost: 45,
        rider_id: "RD0003",
        rating: 2,
        date: "5th Feb 2016",
      },
    ],
  },
  {
    driver_id: "DR0002",
    rides: [
      {
        cost: 25,
        rider_id: "RD0073",
        rating: 5,
        date: "3rd Feb 2016",
      },
      {
        cost: 15,
        rider_id: "RD0013",
        rating: 1,
        date: "4th Feb 2016",
      },
      {
        cost: 35,
        rider_id: "RD0066",
        rating: 3,
        date: "5th Feb 2016",
      },
    ],
  },
  {
    driver_id: "DR0003",
    rides: [
      {
        cost: 5,
        rider_id: "RD0066",
        rating: 5,
        date: "4th Feb 2016",
      },
      {
        cost: 50,
        rider_id: "RD0003",
        rating: 2,
        date: "5th Feb 2016",
      },
    ],
  },
  {
    driver_id: "DR0004",
    rides: [
      {
        cost: 5,
        rider_id: "RD0022",
        rating: 5,
        date: "3rd Feb 2016",
      },
      {
        cost: 10,
        rider_id: "RD0022",
        rating: 4,
        date: "4th Feb 2016",
      },
      {
        cost: 20,
        rider_id: "RD0073",
        rating: 5,
        date: "5th Feb 2016",
      },
    ],
  },
]

rideshare.each do |item|
  puts "Number of rides for driver #{item[:driver_id]} is #{item[:rides].length}"
end

earning = 0
hash_result = {}
rideshare.each do |item|
  item[:rides].each do |element|
    earning += element[:cost]
  end
  puts "Total earning for driver #{item[:driver_id]} is #{earning} $"
  hash_result[item[:driver_id]] = earning
  earning = 0
end

max_earning = hash_result.select { |k, v| v == hash_result.values.max }
puts "Driver #{max_earning.keys[0]} made the most money which is #{max_earning.values[0]}$"

hash_score = {}
score = 0
average = 0
rideshare.each do |item|
  item[:rides].each do |element|
    score += element[:rating]
    average = score / item[:rides].length
  end
  hash_score[item[:driver_id]] = average
  puts "The average rating for #{item[:driver_id]} is #{average}"
  score = 0
end
hash_c = hash_score.select { |k, v| v == hash_score.values.max }
puts "Driver #{hash_c.keys[0]} have the best average rating which is #{hash_c.values[0]}"
