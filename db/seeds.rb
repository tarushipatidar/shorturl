# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ShortUrlData.create(real_url: 'https://www.google.com/webhp?hl=en&sa=X&ved=0ahUKEwiI_LzZyPP4AhXDmFYBHaexDqwQPAgI', short_url: 'abcde', expiry_date: DateTime.now + 30.days) # use in 30 days
ShortUrlData.create(real_url: 'https://paper.dropbox.com/doc/Build-a-URL-shortener-BdG2JwuLz5jG4ke1kf4Ye', short_url: 'short', expiry_date: DateTime.now - 50.days) # expired
