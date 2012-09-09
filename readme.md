# {gt: webdev} second meeting

We'll be exploring creating dynamic websites and talking about HTTP request methods (specifically GET and POST)

## Prerequisites

All we need for this is Ruby and Sinatra. You should have Sinatra installed from the last meeting but if you don't run ``gem install sinatra``

## Running

Clone the repo and run the files! It's that easy

    git clone https://github.com/gt-webdev/meeting-sept-11
    cd meeting-sept-11
    ruby dinner.rb
    
## Routes and HTTP request methods
    
After you start the webserver, the app will have 3 routes:

    GET  http://localhost:4567/dinner     # fetches a random dinner to eat
    GET  http://localhost:4567/add_dinner # renders form to add a new dinner
    POST http://localhost:4567/add_dinner # method to adds dinners to array
    
### GET

``GET`` is what we've used so far to access resources from the webserver. Anytime you're requesting a page, resource, or data it will happen through a ``GET`` request

### POST

We introduced ``POST`` today as the way that you can submit data to the webserver. ``POST``ing data will send it to the app for processing. In our specific example inside of ``dinner.rb`` we're posting more foods that we could eat dinner and appending them to the array of foods.

### PUT

We didn't cover this today but for reference ``PUT`` is used to update resources or existing data.

### DELETE

We didn't cover ``DELETE`` today either but it will delete data from the webserver.

## New Ruby Syntax Reference

### Heredoc

    <<-FORM
    <form action="/add_dinner" method="post">
      dinner: <input type="text" name="food[name]">
      <input type="submit">
    </form>
    ...
    FORM
    
Heredocs are multiline strings that make is easier to work with large amounts of text. The delimeter identifier comes right after ``<<-`` and tells Ruby where the string ends. You can use any delimeter you want but make sure it's unique enough that it doesn't appear in the text itself!

### String interpolation

	<<-FORM
    #{food}
    FORM
    
String interpolation is an easy way to add Ruby variables into strings without any messy concatenation. The syntax is ``#{variable_name}`` and will work inside of heredocs or double quotes ``" "``. Single quoted strings ``' '`` cannot make use of interpolation.

### Appending to an array <<

In Ruby, ``<<`` will append data to an array. So let's say you have an array of food

    food = ['chocolate', 'tv dinner', 'cereal', 'hot dogs', 'veal', 'pizza']

All of a sudden you remember 'Oh! I want to add caviar to that array'. Well, no problem! All you have to do is

    food << 'caviar'
    
### Hashes

On line 21 of ``dinner.rb`` we introduced hashes

    params[:dinner]
    
In Ruby, a hash is a way to do key value storage. So here, the variable ``params`` contains a hash with the key ``dinner`` and the value being whatever you submitted in the form. If you were to declare this, it would look like

    params = { dinner: 'cousous' }
    params[:dinner] # returns 'couscous'
    
Note: ``params`` is a variable created by Sinatra for us to pass the data to the app from the form.