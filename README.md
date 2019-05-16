# The Next Step: The Back End

This Rails app handles the API and database for [The Next Step](https://github.com/cfinn16/job-search-organizer-frontend), an organizational tool for job searchers.

This repository welcomes contributions, so feel free to submit a pull request!

## Instructions

To run locally on your machine:

1. Clone the repository by running `git clone git@github.com:cfinn16/job-search-organizer-backend.git`
2. `cd job-search-organizer-backend`
3. `bundle install` to install necessary gems.
4. `rails db: create && rails db:migrate` to create the database.
5. `rails db:seed` to populate the database with seed data.
6. `rails s -p 3001` to start the server at http://localhost:3001, to avoid conflicting with the front end running on http://localhost:3000.

## Models

There are four models The Next Step uses, and they can all be found under `app/models`:

### User
The User Model utilizes `has_secure_password` during the log-in process and uses JWT tokens to keep password information secure. Each user has a name, email, and password. A User has many Jobs through UserJobs, and a User also has many Tasks.

### UserJob
The UserJob Model is the join table for the many-to-many relationship between Users and Jobs. Each instance belongs to a User and belongs to a Job. A UserJob instance is created every time a user adds a new job to their job board on the front end. UserJobs also hold the `current_column` attribute, which is used to control the drag and drop functionality on the front end.

### Job
The Job Model is the most attribute-heavy model in the application, as it contains a variety of details about the job that allow users to organize the jobs their interested in. The attribute data for each Job has been normalized to comply with the formatting of job listings in The Muse's API, so that when a Job instance is created from those search results, it has the same data has the ones manually entered by users.

### Task
Each Task belongs to a User and belongs to a Job, and it contains a description and a boolean attribute to control the checklist feature on a User's task list. 
