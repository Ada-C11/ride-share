info = [
  {
    driver: ["DR0001"],
    rider: ["RD0003", "RD0015", "RD0003"],
    date: ["02.03.16", "02.03.16", "02.05.16"],
    cost: [10, 30, 45],
    rating: [3, 4, 2],
  },

  {
    driver: ["DR0002"],
    rider: ["RD0073", "RD0013", "RD0066"],
    date: ["02.03.16", "02.04.16", "02.05.16"],
    cost: [25, 15, 35],
    rating: [5, 1, 3],
  },

  {
    driver: ["DR0003"],
    rider: ["RD0066", "RD0003"],
    date: ["02.04.16", "02.05.16"],
    cost: [5, 50],
    rating: [5, 2],
  },

  {
    driver: ["DR0004"],
    rider: ["RD0022", "RD0022", "RD0073"],
    date: ["02.03.16", "02.03.16", "02.05.16"],
    cost: [5, 10, 20],
    rating: [5, 4, 5],
  },
]
# Iterated through the info i need to answer the specific questions in the prompt. Used .map to create a new array with the computed info to answer the ?s.
computed_infos = info.each_with_index.map do |driver_info, i|
  riders_for_this_driver_info = driver_info[:rider].count
  rating_average = driver_info[:rating].sum.to_f / driver_info[:rating].length
  zip_date_cost = driver_info[:date].zip(driver_info[:cost])
  date_cost = zip_date_cost.reduce do |biggest_date_cost_so_far, date_cost_right_now|
    if biggest_date_cost_so_far[1] > date_cost_right_now[1]
      biggest_date_cost_so_far
    else
      date_cost_right_now
    end
  end

  {
    :driver_id => i + 1,
    :rides => riders_for_this_driver_info,
    :earnings => driver_info[:cost].sum,
    :average_rating => rating_average.round(2),
    :date_cost => date_cost,
  }
end

puts "All Infos"
i = 1
computed_infos.each do |computed_info|
  puts "Driver #{computed_info[:driver_id]}: "
  print computed_info
  puts ""
  i + 1
  puts "And earned the most on this date: #{computed_info[:date_cost]}"
  puts ""
end
puts ""
# Used reduce to compare the current info with the highest rating against the individual driver's average rating.
computed_info_with_highest_rating = computed_infos.reduce do |biggest_seen_computed_info, computed_info_current|
  if computed_info_current[:average_rating] > biggest_seen_computed_info[:average_rating]
    computed_info_current
  else
    biggest_seen_computed_info
  end
end

# Used reduce to get compare earnings to get the driver with the highest earning.
computed_info_with_highest_earning = computed_infos.reduce do |biggest_seen_computed_info, computed_info_current|
  if computed_info_current[:earnings] > biggest_seen_computed_info[:earnings]
    computed_info_current
  else
    biggest_seen_computed_info
  end
end

puts "Driver #{computed_info_with_highest_earning[:driver_id]} had the highest earnings: $#{computed_info_with_highest_earning[:earnings]}"
