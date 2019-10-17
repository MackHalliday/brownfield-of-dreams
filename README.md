# Brownfield Of Dreams
#### Created by: [Alec Wells](https://github.com/alect47) and [Mack Halliday](https://github.com/MackHalliday)

This is the base repo for a brownfield project used at Turing for Backend Mod 3.

* Project created based on the requirements for [Brownfield Of Dreams](https://github.com/turingschool-examples/brownfield-of-dreams).

* [GitHub Project Board](https://github.com/MackHalliday/brownfield-of-dreams/projects/1)

### About the Project

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Local Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Install node packages for stimulus
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Update YouTube API Key 
- Open `application.yml` file
- Create variable ``ENV['YOUTUBE_API_KEY']`
- Set variable equal to your YouTube API Key

## Testing Suite
Run the test suite:
```ruby
$ bundle exec rspec
```

## Running Application Locally 
Run application locally:
```ruby
$ rails s
```
- Visit `http://localhost:3000/` in Chrome browser 

To view emails sent by application: 
- Visit `http://localhost:1080/` in Chrome browser

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
