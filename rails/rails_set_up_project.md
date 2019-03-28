# Quick project workflow

    rails new MySite

    cd MySite

    bundle install (installs the gemlock file)

    rails server

> I think I need to complete the setup from here.  At the moment the page is showing a lot of sqllite errors

https://gorails.com/setup/ubuntu/18.04

    rails generate controller Pages

> in app/controllers/pages_controller.rb
In the <code>PagesController</code> class add a method called <b>home</b>

    class PagesController < ApplicationController 

  def home
  end

end


