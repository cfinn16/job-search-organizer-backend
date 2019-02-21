# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.create(title:"Full-Stack Software Engineer", company:"Reddit", years_experience: 2, salary: 100000, contact_email: "realhuman@reddit.com", description:"Build the future of Reddit with us", column:"Interested")

Job.create(title:"Front-End Software Engineer", company:"Trello", years_experience: 1, salary: 900000, contact_email: "taco@trello.com", description:"We love organized code", column: "Interested")

Job.create(title:"Junior Web Developer", company:"GlassDoor", years_experience: 0, salary: 800000, contact_email: "person@glassdoor.com", description:"New grads welcome to apply", column: "Interested")
