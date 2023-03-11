# 1. In the following hash of people and their age, see if "Spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")
ages.key?("Spot")
ages.member?("Spot")

# 2. Convert the string in the following ways:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

# 3. Add ages for Marilyn and Spot to the existing Munster family age hash.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
ages.update(additional_ages)

# 4. See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."

advice.match?("Dino")
advice.include?("Dino")

# 5. Show an easier way to write this array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# 6. How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# 7. How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")

# 8. Shorten the following sentence to "house training your pet dinosaur."
advice = "Few things in life are as important as house training your pet dinosaur."
delimiter = advice.index('house')

advice.slice!(0, delimiter)
advice
# => "house training your pet dinosaur."

# 9. Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"
statement.count('t')

# 10. Before CSS, we used spaces to align things on the screen.
# If we had a table of Flintstone family members that was forty characters in width,
# how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
title.center(40)
