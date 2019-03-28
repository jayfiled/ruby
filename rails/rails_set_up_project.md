# Quick project workflow

    rails new MySite

    cd MySite

    bundle install (installs the gemlock file)

    rails server

> I think I need to complete the setup from here.  At the moment the page is showing a lot of sqllite errors

https://gorails.com/setup/ubuntu/18.04

## Controller

    rails generate controller Pages

> in app/controllers/pages_controller.rb
In the <code>PagesController</code> class add a method called <b>home</b>

    class PagesController < ApplicationController 

    def home
    end

    end

## Routes

> in config/routes.rb inside the class method .draw add:

    get 'welcome' => 'pages#home'

Which routest the request www.site.com/welcome to the <b>Pages</b> controller and uses the action (the method inside a controller) <code>home</code> on the request.

## View

> In app/views/pages/home.html.erb type some HTML.  The CSS goes in: <b>app/assets/stylesheets/pages.css.scss</b>

    <div class="main">
    <div class="container">
        <h1>Hello my name is __</h1>
        <p>I make Rails apps.</p>
    </div>
    </div>

View your app in http://localhost:3000/welcome

## Review

Used the request / response cycle: 

https://www.codecademy.com/articles/request-response-cycle-static


- Generate a new Rails app.
- Generate a controller and add an action.
- Create a route that maps a URL to the controller action.
- Create a view with HTML and CSS.
- Run the local web server and preview the app in the browser.
