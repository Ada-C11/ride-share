all_driver_data =
  [
    {driverID: "DR0004",
     date: "3rd Feb 2016",
     riderID: "RD0022",
     cost: 5,
     rating: 5},

    {driverID: "DR0001",
     date: "3rd Feb 2016",
     riderID: "RD0003",
     cost: 10,
     rating: 3},

    {driverID: "DR0002",
     date: "3rd Feb 2016",
     riderID: "RD0073",
     cost: 25,
     rating: 5},

    {driverID: "DR0001",
     date: "3rd Feb 2016",
     riderID: "RD0015",
     cost: 30,
     rating: 4},

    {driverID: "DR0003",
     date: "4th Feb 2016",
     riderID: "RD0066",
     cost: 5,
     rating: 5},

    {driverID: "DR0004",
     date: "4th Feb 2016",
     riderID: "RD0022",
     cost: 10,
     rating: 4},

    {driverID: "DR0002",
     date: "4th Feb 2016",
     riderID: "RD0013",
     cost: 15,
     rating: 1},

    {driverID: "DR0003",
     date: "5th Feb 2016",
     riderID: "RD0003",
     cost: 50,
     rating: 2},

    {driverID: "DR0002",
     date: "5th Feb 2016",
     riderID: "RD0066",
     cost: 35,
     rating: 3},

    {driverID: "DR0004",
     date: "5th Feb 2016",
     riderID: "RD0073",
     cost: 20,
     rating: 5},

    {driverID: "DR0001",
     date: "5th Feb 2016",
     riderID: "RD0003",
     cost: 45,
     rating: 2},
  ]

#store unique driver ids into array
drivers_ids_arr = all_driver_data.map { |rides| rides[:driverID] }
unique_driverIDs = drivers_ids_arr.uniq

#store total rides per driver in array
total_rides_per_driver_arr = [0, 0, 0, 0]
drivers_ids_arr.each do |id|
  total_rides_per_driver_arr[0] += 1 if id == unique_driverIDs[0]
  total_rides_per_driver_arr[1] += 1 if id == unique_driverIDs[1]
  total_rides_per_driver_arr[2] += 1 if id == unique_driverIDs[2]
  total_rides_per_driver_arr[3] += 1 if id == unique_driverIDs[3]
end

#store total money made for each driver into array
def total_cost(all_info, driver_ids, driver)
  driver_info = all_info.select do |ride|
    ride[:driverID] == driver_ids[driver]
  end

  driver_costs = driver_info.map { |ride| ride[:cost] }
  return driver_total_cost = driver_costs.sum
end

total_cost_per_driver_arr = Array.new
unique_driverIDs.each_with_index do |driver, index|
  total_cost_per_driver_arr.push(total_cost(all_driver_data, unique_driverIDs, index))
end

#store average ratings for all drivers into array
def average_rating(all_info, driver_ids, driver)
  driver_info = all_info.select do |ride|
    ride[:driverID] == driver_ids[driver]
  end

  driver_ratings = driver_info.map { |ride| ride[:rating] }
  average_rating = (driver_ratings.sum.to_f / driver_ratings.length)
  formatted_average_rating = format("%.1f", average_rating)
  return formatted_average_rating
end

average_rating_per_driver_arr = Array.new
unique_driverIDs.each_with_index do |driver, index|
  average_rating_per_driver_arr.push(average_rating(all_driver_data, unique_driverIDs, index))
end

def largest_value_index(array)
  highest_value_index = 0
  array.each_with_index do |info, index|
    if info > array[highest_value_index]
      highest_value_index = index
    end
  end
  return highest_value_index
end

highest_rated_index = largest_value_index(average_rating_per_driver_arr)
most_money_index = largest_value_index(total_cost_per_driver_arr)

##########OUTPUT##########

unique_driverIDs.each_with_index do |id, index|
  puts "INFORMATION FOR DRIVER '#{id}'':\n\n"
  puts "Total rides: #{total_rides_per_driver_arr[index]}"
  puts "Total money made:$#{total_cost_per_driver_arr[index]}"
  puts "Average rating: #{average_rating_per_driver_arr[index]}\n\n"
end

puts ""
puts "Driver '#{unique_driverIDs[highest_rated_index]}' has the highest average rating. Their rating is #{average_rating_per_driver_arr[highest_rated_index]}."
puts "Driver '#{unique_driverIDs[most_money_index]}' made the most money. They made $#{total_cost_per_driver_arr[most_money_index]}."
