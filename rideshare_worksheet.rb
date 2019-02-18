rides_by_driver =
  [
    [{:driver_id => "DR0001", :rider => "RD0003", :date => "3rd Feb 2016", :cost => 10, :rating => 3},
     {:driver_id => "DR0001", :rider => "RD0015", :date => "3rd Feb 2016", :cost => 30, :rating => 4},
     {:driver_id => "DR0001", :rider => "RD0003", :date => "5th Feb 2016", :cost => 45, :rating => 2}],

    [{:driver_id => "DR0002", :rider => "RD0073", :date => "3rd Feb 2016", :cost => 25, :rating => 5},
     {:driver_id => "DR0002", :rider => "RD0013", :date => "4th Feb 2016", :cost => 15, :rating => 1},
     {:driver_id => "DR0002", :rider => "RD0066", :date => "5th Feb 2016", :cost => 35, :rating => 3}],

    [{:driver_id => "DR0003", :rider => "RD0066", :date => "4th Feb 2016", :cost => 5, :rating => 5},
     {:driver_id => "DR0003", :rider => "RD0003", :date => "5th Feb 2016", :cost => 50, :rating => 2}],

    [{:driver_id => "DR0004", :rider => "RD0022", :date => "3rd Feb 2016", :cost => 5, :rating => 5},
     {:driver_id => "DR0004", :rider => "RD0022", :date => "4th Feb 2016", :cost => 10, :rating => 4},
     {:driver_id => "DR0004", :rider => "RD0073", :date => "5th Feb 2016", :cost => 20, :rating => 5}],
  ]

puts "~~NUMBER OF RIDES~~"
rides_by_driver.each do |driver|
  puts "#{driver[0][:driver_id]} : #{driver.count { |ride| ride[:driver_id] == driver[0][:driver_id] }}"
end

puts "\n~~DRIVER TOTAL EARNINGS~~"
total_money = {}
rides_by_driver.each do |driver|
  total_money[driver[0][:driver_id]] = driver.map { |ride| ride[:cost] }.sum
end
total_money.each {|k, v| puts "#{k} : #{v}"}

puts "\n~~DRIVER AVERAGE RATING~~"
avg_rating = {}
rides_by_driver.each do |driver|
  avg_rating[driver[0][:driver_id]] = driver.map { |ride| ride[:rating] }.sum / driver.length
end
avg_rating.each {|k, v| puts "#{k} : #{v}"}


puts "\n~~STAR OF THE MONTH (HIGHEST EARNER)~~"
puts total_money.max_by { |driver, earnings| earnings }

puts "\n~~STAR OF THE MONTH (HIGHEST AVG. RATING)~~"
puts avg_rating.max_by { |driver, rating| rating }
