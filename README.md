# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The app was created using using test driven development with the Rspec library.
Stripe was the platform used for payments. 

## Functions

The app allows admins to add products for sale and categories for them to be organized into. Users are able to register, sign in and sign out. 
Users can add items to their cart and orders can submitted.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## What it looks like

  
<img width="1792" alt="Screen Shot 2022-02-09 at 2 44 19 PM" src="https://user-images.githubusercontent.com/91284012/153303947-53635c8d-331f-439b-acaf-ad7bac552433.png">

  Sign up page

<img width="1792" alt="Screen Shot 2022-02-09 at 2 45 01 PM" src="https://user-images.githubusercontent.com/91284012/153303990-b09838aa-e310-4715-832a-577fcc25abe2.png">

  Specific category page while logged in

<img width="1792" alt="Screen Shot 2022-02-09 at 2 45 09 PM" src="https://user-images.githubusercontent.com/91284012/153304014-3a0178ab-24f8-4fec-824d-cb80c7d57569.png">

  Page with filled cart

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
