RoR_gmaps
=========

Requirements: 
Ruby 1.8.7
Ruby on Rails 3.2.13 
Install gmaps4rails: 
Refernece: https://github.com/apneadiving/Google-Maps-for-Rails 
Creating a Demo App of Google Maps with Ruby on Rails


Steps Takens to Create This app

1. rails new gmap
2. edit gmap/Gemfile
add gem 'gmaps4rails'
3. copy things gmaps4rails into asset
cd into gmap
$rails generate gmaps4rails:install
4. modify app/views/layouts/application.html.erb to add required library 
between </body> and </html>
add 
<footer>
<%= yield :scripts %> 
</footer>
5. Include css tag in application.html.erb in header
<%= stylesheet_link_tag 'gmaps4rails' %> 

6. Create a character model 
rails g scaffold character name:string address:string activity:string longitude:float latitude:float gmaps:boolean 

7. Modify the user model to add the following (app/models/user.rb)

acts_as_gmappable
def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
address
end

8. Add the following line to migration (db/migrate/_____create_character.rb)

add_column :character, :latitude,  :float #you can change the name, see wiki
add_column :character, :longitude, :float #you can change the name, see wiki
add_column :character, :gmaps, :boolean #not mandatory, see wiki

9. Include gmaps object into the controller (app/controllers/users_controller.rb)
@json = User.all.to_gmaps4rails
10. Include the gmaps into the view (app/views/users/index.html.erb)
<%= gmaps4rails(@json) %>

11. Remove the following file 
public/index.html

12. modify routers.rb add 
root :to => 'characters#index'
13. update db
rake db:migrate