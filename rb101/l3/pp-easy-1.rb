# 3. Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!(/important/, 'urgent')

# 5. Programmatically determine if 42 lies between 10 and 100.
num = 42
(10..100).include?(num)
(10..100).cover?(num)

# 6. Starting with the following string, show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
prefix = "Four score and "

famous_words.insert(0, prefix)
famous_words.prepend(prefix)

prefix + famous_words
prefix.concat(famous_words)
prefix << famous_words

# 7. Make this into an un-nested array.
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones
# => ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

flintstones.flatten!
# => ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]

# 8. Create an array containing only two elements: Barney's name and Barney's number, given the hash below.
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney")
flintstones.find { |k,| k == "Barney" }
