########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?
# I identify an overarching table 'Rides' storing the information for each instance of a rideshare
# Within that table there is a row corresponding to each driver
# each unique driver has attributes: Driver_ID, Date, Cost, Rider_ID, and Rating
# The layers of Driver_ID, Date, Cost, Rider_ID and Rating are all next to each other...

# this collection could be represented using an array of hashes or a hash of arrays of hashes, or synchronized arrays...

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
# Table: Initialize as a Hash
  # Rides: Initialize as an array of hashes
    # each hash has the following keys driver_id:, date:, cost:, rider_id:, rating:
# Nested data structure of three layers a hash storing an array of hashes.

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
