
rideinfo = {
  DR0004: [{date: Time.new(2016, 2, 3, 0, 0, 0),
            cost: 5,
            rider_id: "RD0022",
            rating: 5},
           {date: Time.new(2016, 2, 4, 0, 0, 0),
            cost: 10,
            rider_id: "RD0022",
            rating: 4},
           {date: Time.new(2016, 2, 5, 0, 0, 0),
            cost: 20,
            rider_id: "RD0073",
            rating: 5}],
  DR0001: [{date: Time.new(2016, 2, 3, 0, 0, 0),
            cost: 10,
            rider_id: "RD0003",
            rating: 3},
           {date: Time.new(2016, 2, 3, 0, 0, 0),
            cost: 30,
            rider_id: "RD0015",
            rating: 4},
           {date: Time.new(2016, 2, 5, 0, 0, 0),
            cost: 45,
            rider_id: "RD0003",
            rating: 2}],
  DR0002: [{date: Time.new(2016, 2, 3, 0, 0, 0),
            cost: 25,
            rider_id: "RD0073",
            rating: 5},
           {date: Time.new(2016, 2, 4, 0, 0, 0),
            cost: 15,
            rider_id: "RD0013",
            rating: 1},
           {date: Time.new(2016, 2, 5, 0, 0, 0),
            cost: 35,
            rider_id: "RD0066",
            rating: 3}],
  DR0003: [{date: Time.new(2016, 2, 4, 0, 0, 0),
            cost: 5,
            rider_id: "RD0066",
            rating: 5},
           {date: Time.new(2016, 2, 5, 0, 0, 0),
            cost: 50,
            rider_id: "RD0003",
            rating: 2}],
}


rideinfo.each do |k, v|
  puts v.length
end


rideinfo.each do |k, v|
  summed = v.sum { |x| x[:cost] }
  puts "driver #{k} made $#{summed}"
end


rideinfo.each do |k, v|
  summed = v.sum { |x| x[:rating].to_f }
  puts "driver #{k}'s average rating is #{(summed / v.length).round(2)}"
end

def mostMoney(rideinfo)
  holder = rideinfo.map { |k, v|
    [k, v.sum { |x| x[:cost] }]
  }.to_h
  puts holder.key(holder.values.max)
end

puts mostMoney(rideinfo)


def highestRating(rideinfo)
  holder = rideinfo.map { |k, v|
    [k, (v.sum { |x| x[:rating] } / v.length.to_f)]
  }.to_h
  highest = holder.key(holder.values.max)
  puts "driver #{highest} has the highest rating with #{holder[highest].round(2)}"
end

puts highestRating(rideinfo)
