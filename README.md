# Brownfield Of Dreams
#### Created by: [Alec Wells](https://github.com/alect47) and [Mack Halliday](https://github.com/MackHalliday)

[Visit the Deployed Verison of the Application Here](https://warm-oasis-92262.herokuapp.com/)

### About the Project

* [Project Requirements](https://github.com/turingschool-examples/brownfield-of-dreams)

* [GitHub Project Board](https://github.com/MackHalliday/brownfield-of-dreams/projects/1)

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

Projects based on the original code base [Brownfield Of Dreams](https://github.com/turingschool-examples/brownfield-of-dreams). Additional functionality and testing has been added to the application. 

**New Functionality** 
- When new user registered, user receives email to activate account 
- Application can authenticate users using GitHub
- After authenticating with GitHub, user can view GitHub repos, following, and followers in User dashboard
- User can add friends who are also authenticated with GitHub
- User can send invite by searching for GitHub handle 
- User can see bookmarked videos in User Dashboard 
- Admin can create new tutorial 

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
- Create variable `ENV['YOUTUBE_API_KEY']`
- Set variable equal to your YouTube API Key

[Instructions to Obtain YouTube API Key](https://developers.google.com/youtube/v3/getting-started)

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
```ruby
$ mailcatcher
```
- Visit `http://localhost:1080/` in Chrome browser

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [vcr](https://github.com/vcr/vcr)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)
* [figaro](https://github.com/laserlemon/figaro)
* [rubocop](https://github.com/rubocop-hq/rubocop)
* [omniauth](https://github.com/omniauth/omniauth)
* [mail-catcher](https://mailcatcher.me/)

### Versions
* Ruby 2.4.1
* Rails 5.2.0
