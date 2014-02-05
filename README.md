fl-ng-coffee
============

### Daniele Brugnara, Scurelle, 4 febbraio 2014

# Prerequisites

 - apt-get install build-dependencies # for compiling node and socket.io
 - nodejs # at least 0.8
 - npm install -g grunt bower

# Optionally

 - [fl-node](https://github.com/brugnara/fl-node)

# How

```
$ npm install && bower install
$ grunt serve
```

# How it works

Angular will prepare routing table, setting for the `#/register` destination url, a specific view and a controller.
The register.html view, is a form with html5 fields validation. All parameters are connected to the model `$scope.u`, with the two-way data
binding implemented by AngularJS. Changing a value in the form, will result in the apply of the value to the model, and vice-versa.
Every field is checked with a specific pattern and will lock the submit until every pattern will be satisfied.
You will see that with the first field, **server**, you can choose the destination server. The first choise is "FreeLuna"
and with this, the application will send data through the JSONP. Selecting "NodeJS", the application will use socket.io to
send data and will receive an async message when server will terminate the request to the FreeLuna server.
I didn't implemented a server side data check because it's already implemented in the REST server.

## Warning!

Before being able to send data to NodeJS, you have to start the [node server](https://github.com/brugnara/fl-node)
because it will provide socket.io.js file required from the frontend.

# No CORS? No problems...

Angular provide a very useful $http component with post, get and jsonp methods.
For sending data to /create api, I've used jQuery.param function that converts a JSON to a querystring.

# Why Angular

I'm developing with angular for over a year and I really like how simple a complex application can become, splitting in
many little pieces, and Angular let me do this easily. I wrote in CoffeeScript the code because I think that the resulting
 code is more readable and less complex.

# Deploy and debug

For the deployment, I have used Grunt that also compiles the code from Coffee to JS and run a webserver with a fully configurable
watch that auto-updates the page on each browser connected to it. Very useful for fast development and for testing.
Grunt will also create .map from coffee, so you can debug coffeescript in your preferred browser.
We can also deploy this application with a simple HTTP server like:

```
$ cd projectFolder
$ python -m SimpleHTTPServer
```

# CDN

I didn't used any CDN. I don't know how this application will be tested so I preferred to mantain dependancies with bower.
Any way, it's possible to configure Grunt to change from bower to CDN. I know that it's possible but I never did.
