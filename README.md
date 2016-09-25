# Checkout System
[![Build Status](https://travis-ci.org/AlanGabbianelli/Cake.svg?branch=master)](https://travis-ci.org/AlanGabbianelli/Cake)
[![Coverage Status](https://coveralls.io/repos/github/AlanGabbianelli/Cake/badge.svg?branch=master)](https://coveralls.io/github/AlanGabbianelli/Cake?branch=master)
[![Code Climate](https://codeclimate.com/github/AlanGabbianelli/Cake/badges/gpa.svg)](https://codeclimate.com/github/AlanGabbianelli/Cake)
[![Issue Count](https://codeclimate.com/github/AlanGabbianelli/Cake/badges/issue_count.svg)](https://codeclimate.com/github/AlanGabbianelli/Cake)

This is a checkout system written in Ruby, that allows you to add items to the basket, and calculates the total price. It also accepts promotions of various types, and calculates when to apply them.

## Installation
To install it, fork this repo and clone it in your machine, then enter the directory and install all the dependencies with bundle (if you don't have bundle install it with `$ gem install bundle`).
```
$ git clone git@github.com:your_user_name/cake.git
$ cd cake
$ bundle install
```

## Tests
* To run all the tests: `$ rspec` or `$ rake`
* To run all the tests and see test coverage: `$ coveralls report`

## Original Requirements

Our client is an online marketplace, here is a sample of some of the products available on our site:

```
Product code  | Name                   | Price
----------------------------------------------------------
001           | Lavender heart         | £9.25
002           | Personalised cufflinks | £45.00
003           | Kids T-shirt           | £19.95
```

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

If you spend over £60, then you get 10% off of your purchase.
If you buy 2 or more lavender hearts then the price drops to £8.50.

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):

```ruby
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```

Implement a checkout system that fullfills these requirements.

```
Test data
---------
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
```

## Possible improvements
* :white_check_mark: ~~Use BigDecimal to  avoid rounding imprecision~~
* :white_check_mark: ~~Use keyword arguments (named parameters)~~
* :white_medium_square: Catch errors (eg item code not valid)
* :white_medium_square: Extract a Basket class to ease Checkout from logic
* :white_medium_square: Make a Promotion class all promotions would inherit from (DRY)
* :white_medium_square: Work out total and subtotal dynamically
