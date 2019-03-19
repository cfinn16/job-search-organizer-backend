# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.create(title:"Full-Stack Software Engineer", company:"Reddit", location: "New York City, NY", experience_level: "Entry Level", salary: 100000, description:"Build the future of Reddit with us")

Job.create(title:"Front-End Software Engineer", company:"Trello", location: "New York City, NY", experience_level: "Entry Level", salary: 900000, description:"We love organized code")

Job.create(title:"Junior Web Developer", company:"GlassDoor", location: "New York City, NY", experience_level: "Entry Level", salary: 800000, description:"New grads welcome to apply")

User.create(name: "Connor Finnegan", email: "connor@gmail.com", password: "password")

UserJob.create(user_id: 1, job_id: 1, column: "Interested")
UserJob.create(user_id: 1, job_id: 2, column: "Interested")
UserJob.create(user_id: 1, job_id: 3, column: "Interested")

Task.create(description: "Email contact", user_job_id: 1, is_completed: false)
Task.create(description: "Build Reddit clone", user_job_id: 1, is_completed: false)
Task.create(description: "Find LinkedIn connections", user_job_id: 1, is_completed: false)
