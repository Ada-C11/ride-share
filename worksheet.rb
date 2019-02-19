module Rideshare
  rides = [
    {
      date: "3rd Feb 2016",
      cost: 5,
      driver: {id: "DR0004", rating: 5},
      rider: {id: "RD0022"},
    },
    {
      date: "3rd Feb 2016",
      cost: 10,
      driver: {id: "DR0001", rating: 3},
      rider: {id: "RD0003"},
    },
    {
      date: "3rd Feb 2016",
      cost: 25,
      driver: {id: "DR0002", rating: 5},
      rider: {id: "RD0073"},
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      driver: {id: "DR0001", rating: 4},
      rider: {id: "RD0015"},
    },
    {
      date: "4th Feb 2016",
      cost: 5,
      driver: {id: "DR0003", rating: 5},
      rider: {id: "RD0066"},
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      driver: {id: "DR0004", rating: 4},
      rider: {id: "RD0022"},
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      driver: {id: "DR0002", rating: 1},
      rider: {id: "RD0013"},
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      driver: {id: "DR0003", rating: 2},
      rider: {id: "RD0003"},
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      driver: {id: "DR0002", rating: 3},
      rider: {id: "RD0066"},
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      driver: {id: "DR0004", rating: 5},
      rider: {id: "RD0073"},
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      driver: {id: "DR0001", rating: 2},
      rider: {id: "RD0003"},
    },
  ]
  # Program analyzes ride share data from a complex array/hash nested data
  # structure (See above). Then Program displays data for
  # drivers to review their metrics via the Driver Dash Board.
  class Driver_dash_board
    attr_reader :info

    # Intiates class variable @@drivers as hash with driver id from @info as key. Each key points to empty hash.
    # @@drivers = {:DR0004=>{}, :DR0001=>{}, :DR0002=>{}, :DR0003=>{}}
    def initialize(info, drivers = Hash.new)
      @info = info
      @@drivers = drivers
      @info.each do |trip|
        driver_id = trip[:driver][:id]
        @@drivers[driver_id.to_sym] = Hash.new(0) unless @@drivers.has_key?(driver_id.to_sym)
      end
      return true
    end

    # Method runs ride share metric analysis and displays formatted data.
    def run
      extra = tally_enhanced # tally_enchanced LN 175; Change to tally_r to not include enhanced/extra functionality.
      puts print_best
      puts print_metrics(extra)
      return true
    end

    # Method will invoke count_rides, sum_earnings, and average_ratings methods.
    def tally_r
      count_rides
      sum_earnings
      ave_ratings
      return "money day not tallied"
    end

    # Method counts the number of rides for each driver using data
    # from @info then stores in @@drivers hash with :rides as key.
    def count_rides
      info.each do |trip|
        driver_id = trip[:driver][:id]
        @@drivers[driver_id.to_sym][:rides] += 1
      end
      return true
    end

    # Method sums the money earned for each driver using data from @info
    # then stores in @@drivers hash with :earnings as key
    def sum_earnings
      @info.each do |trip|
        driver_id = trip[:driver][:id]
        @@drivers[driver_id.to_sym][:earnings] += trip[:cost]
      end
      return true
    end

    # Method averages ratings for each driver using data from @info
    # then stores in @@drivers hash with :rating as key
    def ave_ratings
      @info.each do |trip|
        driver_id = trip[:driver][:id]
        @@drivers[driver_id.to_sym][:rating] += trip[:driver][:rating]
      end
      @@drivers.each do |id, data|
        data[:rating] /= data[:rides].to_f
      end
      return true
    end

    # Method will determine which driver has the most of given key or drivers in case of tie.
    # @param Symbol -> key
    # @returns Array of Strings
    def most(key)
      amount = @@drivers.max_by do |id, data|
        return ["no data on #{key}"] if data[key] == 0
        data[key]
      end
      best = @@drivers.select do |id, data|
        data[key] == amount[1][key]
      end
      return best.keys
    end

    # Method builds Array of Strings for printing top driver data as required for questions.
    def print_best
      print_arr = [] << ["DRIVER DASH BOARD\n\nTop Earner(s): "] << ["\nHighest Rated: "]
      print_arr[0] << most(:earnings)
      print_arr[1] << most(:rating)
      return print_arr
    end

    # Method builds Array of Strings for printing driver data for all drivers as required for questions.
    def print_metrics(money_day)
      print_arr = [] << ["\nTOTAL EARNINGS"] << ["\nAVERAGE RATINGS"] << ["\nNUMBER OF RIDES"] << ["\nDAY WITH MOST EARNINGS"]
      @@drivers.each do |id, data|
        print_arr[0] << "Driver #{id}: $%0.2f" % [data[:earnings]]
        print_arr[1] << "Driver #{id}: %0.1f" % [data[:rating]]
        print_arr[2] << "Driver #{id}: #{data[:rides]} "
        print_arr[3] << "Driver #{id}: #{data[:money_day][0]}"
      end
      print_arr.pop unless money_day == "money day tallied"
      return print_arr
    end

    ######################### EXTRA STUFFS ###########################

    # Method analyzes params from questions by invoking sum_metric method * 3.
    def tally_enhanced
      most_money_day
      sum_metric(:rides)
      sum_metric(:earnings, :cost)
      sum_metric(:rating, [:driver, :rating], true)
      return "money day tallied"
    end

    # Method determines which day each driver earns the most and
    # stores data in @@drivers accessible by driver and :money_day key.
    def most_money_day
      # Stores :money_day with hash as value {dates as key and sum of daily earnings as value.}
      @info.each do |trip|
        driver_id = trip[:driver][:id]
        @@drivers[driver_id.to_sym][:money_day] = Hash.new(0) unless @@drivers[driver_id.to_sym].has_key?(:money_day)
        @@drivers[driver_id.to_sym][:money_day][trip[:date]] += trip[:cost]
      end
      # Overwrites :money day value with array of date and money of max daily earnings.
      @@drivers.each do |id, data|
        data.each do |label, date|
          data[:money_day] = date.max_by do |label, money|
            money
          end
        end
      end
      return true
    end

    # Method will sum the value of key from @info and store results in @@drivers by driver and new_key.
    # If info_key = :count then occurences of driver id will be counted.
    # If multiple keys are required to access nested data, pass array of keys as arg to info_key param.
    # If is_average is true then average based on number of rides will be applied to value of new_key in @@drivers.
    # Method will return false if unsuccesful as in these cases:
    #       -> Find average of metric prior to rides counted.
    #       -> Pass invalid keys as parameters (that is key is not found in info DS).
    def sum_metric(new_key, info_key = :count, is_average = false)
      @info.each do |trip|
        driver_id = trip[:driver][:id]
        return false if is_average && !@@drivers[driver_id.to_sym].has_key?(:rides)
        sum = check_key(trip, info_key.dup) unless info_key.empty?
        return false if !sum
        @@drivers[driver_id.to_sym][new_key] += sum
      end
      @@drivers.each do |id, data|
        data[new_key] /= data[:rides].to_f
      end if is_average
      return true
    end

    # Methods helps sum_metric evaluate info_key arguments of diff data types
    # and returns nil if not valid key in data.
    def check_key(data, key)
      if key == :count
        return 1
      elsif key.class == Array
        return data if !key[0]
        check_key(data[key.shift], key)
      elsif key.class == Symbol
        return data[key]
      else
        return nil
      end
    end

    # # Method to read class var @@drivers for debug.
    # def self.drivers
    #   return @@drivers
    # end

    # # Method to re-write class var @@driver for debug.
    # def self.drivers=(val)
    #   @@drivers = val
    #   return true
    # end
  end

  # RUN CODE.
  ada_ride_share = Driver_dash_board.new(rides)
  ada_ride_share.run
end
