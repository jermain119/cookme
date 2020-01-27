user can login and out
user can see checkout books
user can pick from avaible books
user can return checkout books
user can see due_date of user books
user can add books

user has_many recipes and has_many categories through recipes 
category has_many recipes

user = user = table
book = category = table 
checkout = recipe = joins table 

Sushi has many fish, and fish belongs_to sushi

Category = Sushi
fish = Recipes