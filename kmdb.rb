# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.

p1 = Person.new({name: "Christopher Nolan"})
p1.save 
p2 = Person.new({name: "Christian Bale"})
p2.save
p3 = Person.new({name: "Michael Caine"})
p3.save
p4 = Person.new({name: "Liam Neeson"})
p4.save
p5 = Person.new({name: "Katie Holmes"})
p5.save
p6 = Person.new({name: "Gary Oldman"})
p6.save
p7 = Person.new({name: "Heath Ledger"})
p7.save
p8 = Person.new({name: "Aaron Eckhart"})
p8.save
p9 = Person.new({name: "Maggie Gyllenhaal"})
p9.save
p10 = Person.new({name: "Tom Hardy"})
p10.save
p11 = Person.new({name: "Joseph Gordon-Levitt"})
p11.save
p12 = Person.new({name: "Anne Hathaway"})
p12.save

m1 = Movie.new({title: "Batman Begins", year_released: 2005, rating: "PG-13", person_id: p1.id})
m1.save
m2 = Movie.new({title: "The Dark Knight", year_released: 2008, rating: "PG-13", person_id: p1.id})
m2.save
m3 = Movie.new({title: "The Dark Knight Rises", year_released: 2012, rating: "PG-13", person_id: p1.id})
m3.save

r1 = Role.new({movie_id: m1.id, person_id: p2.id, character_name: "Bruce Wayne"})
r1.save
r2 = Role.new({movie_id: m1.id, person_id: p3.id, character_name: "Alfred"})
r2.save
r3 = Role.new({movie_id: m1.id, person_id: p4.id, character_name: "Ra's Al Ghul"})
r3.save
r4 = Role.new({movie_id: m1.id, person_id: p5.id, character_name: "Rachel Dawes"})
r4.save
r5 = Role.new({movie_id: m1.id, person_id: p6.id, character_name: "Commissioner Gordon"})
r5.save
r6 = Role.new({movie_id: m2.id, person_id: p2.id, character_name: "Bruce Wayne"})
r6.save
r7 = Role.new({movie_id: m2.id, person_id: p7.id, character_name: "Joker"})
r7.save
r8 = Role.new({movie_id: m2.id, person_id: p8.id, character_name: "Harvey Dent"})
r8.save
r9 = Role.new({movie_id: m2.id, person_id: p3.id, character_name: "Alfred"})
r9.save
r10 = Role.new({movie_id: m2.id, person_id: p9.id, character_name: "Rachel Dawes"})
r10.save
r11 = Role.new({movie_id: m3.id, person_id: p2.id, character_name: "Bruce Wayne"})
r11.save
r12 = Role.new({movie_id: m3.id, person_id: p6.id, character_name: "Commissioner Gordon"})
r12.save
r13 = Role.new({movie_id: m3.id, person_id: p10.id, character_name: "Bane"})
r13.save
r14 = Role.new({movie_id: m3.id, person_id: p11.id, character_name: "John Blake"})
r14.save
r15 = Role.new({movie_id: m3.id, person_id: p12.id, character_name: "Selina Kyle"})
r15.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
for movie in Movie.all 
    director = Person.where({Movie.person_id}).name
    puts movie.title + " " + movie.year_released + " " + movie.rating + " " + director
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
Role.all.each do |role|
for person in
    movie = Movie.find(role.movie_id)
    person = Person.find(role.person_id)
    puts movie.title + " " + person + " " + role.character_name
end
