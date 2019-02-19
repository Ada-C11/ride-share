# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DATA ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
trips = [
  {
    date: 'Feb 3rd 2016',
    driver: 'DR0004',
    trip_data: ['RD0022', 5, 5]
  },

  {
    date: 'Feb 3rd 2016',
    driver: 'DR0001',
    trip_data: ['RD0003', 3, 10]
  },

  {
    date: 'Feb 3rd 2016',
    driver: 'DR0002',
    trip_data: ['RD0073', 5, 25]
  },

  {
    date: 'Feb 3rd 2016',
    driver: 'DR0001',
    trip_data: ['RD0015', 4, 30]
  },

  {
    date: 'Feb 4th 2016',
    driver: 'DR0003',
    trip_data: ['RD0066', 5, 5]
  },

  {
    date: 'Feb 4th 2016',
    driver: 'DR0004',
    trip_data: ['RD0022', 4, 10]
  },

  {
    date: 'Feb 4th 2016',
    driver: 'DR0002',
    trip_data: ['RD0013', 1, 15]
  },

  {
    date: 'Feb 4th 2016',
    driver: 'DR0003',
    trip_data: ['RD0003', 2, 50]
  },

  {
    date: 'Feb 5th 2016',
    driver: 'DR0002',
    trip_data: ['RD0066', 3, 35]
  },

  {
    date: 'Feb 5th 2016',
    driver: 'DR0004',
    trip_data: ['RD0073', 5, 20]
  },

  {
    date: 'Feb 5th 2016',
    driver: 'DR0001',
    trip_data: ['RD0003', 2, 45]
  }
]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ METHODS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# creates an array of driver_ids
def driver_ids(trip_array)
  driver_array = []
  trip_array.each do |trip|
    driver_array.push(trip[:driver])
  end
  driver_array.uniq!.sort
end

# creates a hash of driver_ids paired with the total number of trips for each
def driver_trips(trip_array)
  num_trips = {}
  trip_array.each do |trip|
    trip_driver = trip[:driver]
    if !num_trips[trip_driver].nil?
      num_trips[trip_driver] += 1
    else
      num_trips[trip_driver] = 1
    end
  end
  num_trips
end

# creates a hash of driver_ids paired with the total dollars paid to that driver
def driver_cash(trip_array)
  cash_amount = {}
  trip_array.each do |trip|
    trip_driver = trip[:driver]
    if !cash_amount [trip_driver].nil?
      cash_amount[trip_driver] += trip[:trip_data][2]
    else
      cash_amount[trip_driver] = trip[:trip_data][2]
    end
  end
  cash_amount
end

# creates a hash of driver_ids with the total of ratings points per driver
def driver_rating(trip_array)
  points_total = {}
  trip_array.each do |trip|
    trip_driver = trip[:driver]
    if !points_total [trip_driver].nil?
      points_total[trip_driver] += trip[:trip_data][1]
    else
      points_total[trip_driver] = trip[:trip_data][1]
    end
  end
  points_total
end

# creates a container for aggregating sorted data into one place
def driver_hash(driver_a)
  hash_of_arrays = driver_a[0].each_with_object({}) { |k, v| v[k] = [] }
  hash_of_arrays
end

# basically just playing around with my data structure using methods
def fill_driver_hash(data_array, hash_container)
  data_array[1].each do |driver|
    hash_container[driver[0]].push driver[1]
  end
  data_array[2].each do |driver|
    hash_container[driver[0]].push driver[1]
  end
  data_array[3].each do |driver|
    hash_container[driver[0]].push driver[1]
  end
  hash_container
end

def driver_totals(data_by_driver)
  make_hashes = {}
  data_by_driver.each do |driver_id, array|
    labels = %i[count cash rating]
    data_hash = labels.zip(array).to_h
    make_hashes.store(driver_id.to_sym, data_hash)
  end
  make_hashes
end

# ~~~~~~~~~~~~~~~~~~~~~ METHOD CALLS and GLOBAL VARIABLES ~~~~~~~~~~~~~~~~~~~~ #

drivers = driver_ids(trips)
trips_count = driver_trips(trips).sort
cash_total = driver_cash(trips).sort
rating_total = driver_rating(trips).sort
mega_array = [drivers, trips_count, cash_total, rating_total]
drivers_hash = driver_hash(mega_array)
data_by_driver = fill_driver_hash(mega_array, drivers_hash)
top_average = 0.0
top_earning = 0
earn_h = {}
av_h = {}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ OUTPUT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

driver_totals(data_by_driver).each do |key, value|
  average = (value[:rating] / value[:count]).to_f
  if average > top_average
    top_average = average
    av_h.store(key, average)
  end
  if value[:cash] > top_earning
    top_earning = value[:cash]
    earn_h.store(key, value[:cash])
  end
  puts "#{key} drove #{value[:count]} trips, collected $#{value[:cash]}, and averaged #{(value[:rating] / value[:count]).to_f} stars."
end

puts "The driver with the highest earnings is: #{earn_h.max_by { |k, v| v }[0]}."
puts "The driver with the highest average rating is: #{av_h.max_by { |k, v| v }[0]}."
