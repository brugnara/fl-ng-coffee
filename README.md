fl-ng-coffee
============

### Daniele Brugnara, Scurelle, 4 febbraio 2014

# Prerequisites

 - nodejs

# How

```
$ npm install && bower install
$ bower serve
```

# How it works

Angular will prepare routing table, setting for the `#/register` destination url, a specific view and a controller.
The register.html view, is a form with form validation. All parameters are connected to the model with the two-way data
binding implemented by AngularJS. Changing a value in the form, will apply the value to the model, and vice-versa.
Every field is checked with a specific pattern and will lock the submit until every pattern will be satisfied.

# No CORS? No problems...

Angular provide a very useful $http component with post, get and jsonp methods.
For sending data to /create api, I've used jQuery.param function that converts a JSON to a querystring.

# Why Angular

I'm developing with angular for over a year and I really like it. I also used CoffeeScript for this application
because I think that the resulting code is more readable and less complex.

# Deploy and debug

For the deployment, I have used Grunt that also compile the code from Coffee to JS and run a webserver with a configurable
watch that auto-update the page on each browser connected to it. Very useful for fast development.
Grunt will also create .map from coffee, so you can debug coffeescript in your preferred browser.
We can deploy this application with a simple HTTP server like:

```
$ cd projectFolder
$ python -m SimpleHTTPServer
```

# Extra

This web application can send directly to /create api or to a node server that will send through post, datas.