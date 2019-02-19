all_rides = [
  {
    "driver id" => "DR0001",
    "rides" => [
      {
        "date" => "3rd Feb 2016",
        "cost" => 10,
        "rider_ID" => "RD0003",
        "rating" => 3,
      },
      {
        "date" => "3rd Feb 2016",
        "cost" => 30,
        "rider_ID" => "RD0015",
        "rating" => 4,
      },
      {
        "date" => "5th Feb 2016",
        "cost" => 45,
        "rider_ID" => "RD0003",
        "rating" => 2,
      },
    ],
  },
  {
    "driver id" => "DR0002",
    "rides" => [
      {
        "date" => "3rd Feb 2016",
        "cost" => 25,
        "rider_ID" => "RD0073",
        "rating" => 5,
      },
      {
        "date" => "4th Feb 2016",
        "cost" => 15,
        "rider_ID" => "4th Feb 2016",
        "rating" => 1,
      },
      {
        "date" => "5th Feb 2016",
        "cost" => 35,
        "rider_ID" => "RD0066",
        "rating" => 3,
      },
    ],
  },
  {
    "driver id" => "DR0003",
    "rides" => [
      {
        "date" => "4th Feb 2016",
        "cost" => 5,
        "rider_ID" => "RD0066",
        "rating" => 5,
      },
      {
        "date" => "5th Feb 2016",
        "cost" => 50,
        "rider_ID" => "RD0003",
        "rating" => 2,
      },
    ],
  },
  {
    "driver id" => "DR0004",
    "rides" => [
      {
        "date" => "3rd Feb 2016",
        "cost" => 5,
        "rider_ID" => "RD0022",
        "rating" => 5,
      },
      {
        "date" => "4th Feb 2016",
        "cost" => 10,
        "rider_ID" => "RD0022",
        "rating" => 4,
      },
      {
        "date" => "5th Feb 2016",
        "cost" => 20,
        "rider_ID" => "RD0073",
        "rating" => 5,
      },
    ],
  },
]

driver_data = [] # This array will store hashes that will store data throughout the upcoming calculations.
all_rides.each do |d|
  driver = {} # Stores each driver's stats
  driver["driver id"] = d["driver id"]
  total_rides = d["rides"].length
  puts "#{d["driver id"]} has given #{total_rides} rides."
  driver["total rides"] = total_rides
  total_wages = 0
  total_rating = 0
  d["rides"].each do |ride|
    total_wages += ride["cost"]
    total_rating += ride["rating"]
  end
  puts "#{d["driver id"]} has made $#{total_wages}."
  driver["total wages"] = total_wages
  average_rating = (total_rating.to_f / total_rides).truncate(1) # Convert to float for improved accuracy, truncate after 1 decimal point
  puts "#{d["driver id"]}'s average rating is #{average_rating}."
  driver["average rating"] = average_rating
  lucrative_day = ""
  lucrative_ride = 0
  d["rides"].each do |ride|
    if ride["cost"] > lucrative_ride # Separate from the first if loop because the first if loop needs to run completely first.
      lucrative_ride = ride["cost"]
    end
    if ride["cost"] == lucrative_ride
      lucrative_day = ride["date"]
    end
  end
  puts "#{d["driver id"]} made the most money on #{lucrative_day}. They made $#{lucrative_ride} that day."
  driver_data << driver
end

highest_wages = 0
highest_rating = 0
highest_wages_driver = ""
highest_rating_driver = ""
driver_data.each do |driver|
  if driver["total wages"] > highest_wages
    highest_wages = driver["total wages"]
  end
  if driver["total wages"] == highest_wages
    highest_wages_driver = driver["driver id"]
  end
  if driver["average rating"] > highest_rating
    highest_rating = driver["average rating"]
  end
  if driver["average rating"] == highest_rating
    highest_rating_driver = driver["driver id"]
  end
end
puts "#{highest_wages_driver} made the most money overall."
puts "#{highest_rating_driver} had the highest average rating."
