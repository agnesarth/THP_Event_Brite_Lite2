# README

<strong> The Hacking Project - Exercise Event Brite Lite</strong> <br />
Last app up to date to create and participate to all event in your city ! <br />

This README would normally document whatever steps are necessary to get the
application up and running. <br />
<strong> Link to the app heroku : https://pacific-springs-71389.herokuapp.com/ </strong>

## Ruby version

* Ruby 2.5.1
* Rails 5.2.4

## Comment lancer les tests

To start app, you may have to do : <br />

* $ heroku run rails db:migrate:status
* $ heroku run rails db:create
* $ heroku run rails db:migrate
* $ heroku run rails db:seed

Otherwise, if you ever run this app on <em> localhost:3000 </em>, please do :

* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:migrate:status
* $ rails db:seed
* $ rails server

If you encounter an error like 'user already connected on localhost', you may use :

* $ lsof -wni tcp:4567  <br /> 
and fetch the PIB number

Then you do : <br />

* $ kill -9 [PIB]

## Database initialization

To fulfill the database with data run: 

* $ rails db:seed

## Work done for this project

Ce qui a été réalisé dans le projet du jour :

* 2.1. Branchement de Bootstrap
* 2.2. Branchement de Devise

## Work in progress :

* 2.3. Faire les premières views
* 2.3.1. La page d'accueil
* 2.3.2. La page profil d'un utilisateur
* 2.3.3. Création d'un événement
* 2.3.4. Afficher un événement

## Required gems (please check Gemfile)

* gem 'faker'
