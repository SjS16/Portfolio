# PORTFOLIO WEBSITE

This portfolio allows you to display your skills as well as engage with vistors through blog posts and comments. Users can register for an account and make comments which show up in real time on your blog posts. The admin user is able to create portfolio items and blog posts, as well as use the drag and drop javascript feature on the portfolio items to reorder the items. In the blogs section you can use markdown to add personality and style to your blogs. You can also set them to be draft or published, depending on who you want to see the, and set a featured blog to be displaye don the top of each page. Blogs can be sorted by topic using the Topic nav bar, or by date using the archive menu. In the home pages there is an about me which has an integrated dropdown view to display past education and work experience, as well as boostrap progress bars to show off your best skills. In this section you will also find a page linked to the Twitter API, displaying 6 tweets from your chosen hashtag, as well as a contact page which integrates a google maps view.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:setup` to create, load and seed db
4. Set up a Twitter API key to use the twitter functions
5. Create secrets.yml file based on secrets-example.yml
6. Run `rails s` to start the server

## Final Product

!["Admin Blog Home Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.51.26%20PM.png)
!["New Blog Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%209.02.19%20PM.png)
!["Admin Portfolio Home Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.51.48%20PM.png)
!["Contact Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.56.27%20PM.png)
!["Twitter Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.58.04%20PM.png)
!["Home Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.57.46%20PM.png)
!["Registration Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%208.57.55%20PM.png)
!["Blog Page"](https://raw.githubusercontent.com/SjS16/Portfolio/master/app/assets/readme_images/Screen%20Shot%202018-07-03%20at%209.02.46%20PM.png)

## Dependencies

* Rails
* SQLite
* Sass
* Bootstrap
* Redis
* BCrypt
* PostgreSQL
* JQuery
* Petergate
* Kaminari
* Carrierwave
* Coccoon
* Gritter
* Twitter
* Redis
* Redcarpet
* Coderay
* Simpson View Tool - A copyright view gem created by me