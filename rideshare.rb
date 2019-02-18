drivers =
  {
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
        date: "4rd Feb 2016",
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
        date: "5rd Feb 2016",
        cost: 50,
        rider_id: "RD0003",
        rating: 2,
      },
      {
        date: "4rd Feb 2016",
        cost: 5,
        rider_id: "RD0066",
        rating: 5,
      },
    ],
  }

def sum_value_of_hashes(array, key)
  sum_of_values = array.sum do |trip|
    trip[key]
  end
  return sum_of_values
end

def get_drivers_best_day(trips_array)
  dates = Hash.new(0)
  trips_array.each do |trip|
    dates[trip[:date]] += trip[:cost]
  end
  best_date = dates.max_by { |date, money| money }[0]
  return best_date
end

def map_driver_hash(drivers)
  mapped_driver_hash = drivers.map do |driver, trips|
    [driver, {
      average_rating: (sum_value_of_hashes(trips, :rating) / trips.length.to_f).round(2),
      total_money_earned: "$#{sum_value_of_hashes(trips, :cost)}",
      total_trips_taken: trips.length,
      highest_earning_day: get_drivers_best_day(trips),
    }]
  end
  return mapped_driver_hash
end

def print_mapped_driver_info(driver_map, key, message)
  puts "\n\n#{message}:\n\n"
  driver_map.each do |info|
    puts "Driver #{format_display_driver_id(info[0])}: #{info[1][key]}"
  end
end

def get_max_of_mapped_driver_array(driver_map_array, catagory)
  top_driver = driver_map_array.max_by do |info|
    info[1][catagory]
  end
  return [format_display_driver_id(top_driver[0]), top_driver[1][catagory]]
end

def format_display_driver_id(driver_id)
  new_id = driver_id[2..-1].to_i.to_s
  return new_id
end

driver_map_array = map_driver_hash(drivers)

puts "\n\nDRIVER INFORMATION\n"

print_mapped_driver_info(driver_map_array, :total_trips_taken, "TOTAL RIDES GIVEN")
print_mapped_driver_info(driver_map_array, :total_money_earned, "TOTAL MONEY EARNED")
print_mapped_driver_info(driver_map_array, :average_rating, "AVERAGE RATING")
print_mapped_driver_info(driver_map_array, :highest_earning_day, "HIGHEST EARNING DAY")

highest_rated_driver = get_max_of_mapped_driver_array(driver_map_array, :average_rating)
highest_earning_driver = get_max_of_mapped_driver_array(driver_map_array, :total_money_earned)
puts "\n\nThe Driver with the highest average rating was Driver #{highest_rated_driver[0]}, with a rating of #{highest_rated_driver[1]}."
puts "\nThe Driver who earned the most was Driver #{highest_earning_driver[0]}, who earned a total of #{highest_earning_driver[1]}.\n\n"
