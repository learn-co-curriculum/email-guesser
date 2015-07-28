

# Email Address Predictor

## Contents

* [Background](#background)
* [Objective](#objective)
* [What is JSON?](#what-is-json)
* [Instructions](#instructions)
* [Resources](#resources)

## Background 

You're working for a flower marketing company and your job is to guess people's email addresses when given their full name and the domain name of the company they work for so you can send them coupons for holiday bouquets.

You've decided that instead of manually predicting their email addresses, you'll write a program to do it for you. This will allow you to watch your favorite actor [John Cho](http://www.imdb.com/name/nm0158626/) crack jokes in the TV show [Selfie](http://www.hulu.com/selfie).

Anyway...you have the following information available:

1. The potential customer's name.
2. The domain name of the company he/she works for.
3. The names and emails of other advisors that work for the same company (and domain name).

The last bit of information is particularly helpful as it's what you use to figure out what pattern a company uses when assigning its email addresses.

Once you understand their pattern, you then make a prediction on what the advisor's email will be.

As an example, let's say you have a potential customer named "Jahmil Eady" who you know works for "wiser.com".

For this exercise, there are four potential patterns this employee's email could come in (or none at all):

|        | Pattern                           | Email                |
|--------|-----------------------------------|----------------------|  
|1       |first_name_dot_last_name           |jahmil.eady@wiser.com |
|2       |first_name_dot_last_initial        |jahmil.e@wiser.com    |
|3       |first_initial_dot_last_name        |j.eady@wiser.com      |
|4       |first_initial_dot_last_initial     |j.e@wiser.com         |

So, if you know the correct addresses for several other people who work at "wiser.com", you can predict Jahmil Eady's email address. For instance, if you know that Bianca Hoppe's email is `b.hoppe@wiser.com`, then you know that Wiser uses the first-initial-dot-last-name pattern, thus Jahmil Eady's email is probably `j.eady@wiser.com`.

## Objective

Given the following sample dataset of past customers:

```json
{
  "Jahmil Eady": "jahmil.eady@wiser.com",
  "Armando Amador": "armando.amador@wiser.com",
  "Linda Li": "linda.li@wiser.com",
  "Anisha Ramnani": "anisha.r@google.com",
  "Sergey Brin": "sergey.b@google.com",
  "Nikki Thean": "n.t@etsy.com",
  "Amanda Pickering": "a.pickering@hunch.com"
}
```

Create a program that will read a JSON file of known emails, much like the JSON above, and use this data to predict new email addresses.

## What is JSON?

### About 

To accomplish this lab, your program must be able to read JSON. So what is JSON? Well it stands for JavaScript Object Notation. JSON is a way to store information in an organized, easy-to-access manner. You might be alarmed and thinking, "But wait, I don't know JavaScript!" Don't worry, you don't need to know how to program in JavaScript to use JSON. In fact, Ruby has a built-in library for using it.

### Example

```json
// government.json

{
  "president": "Barack Obama",
  "vice president": "Joe Biden",
  "secretary of state": "John Kerry",
  "secretary of the treasury": "Jacob Lew"
}
```

```ruby
require 'open-uri'
require 'json'

gov_file = File.read('government.json')

gov = JSON.parse(gov_file)

gov
# => 
# {
#   "president" => "Barack Obama",
#   "vice president" => "Joe Biden",
#   "secretary of state" => "John Kerry",
#   "secretary of the treasury" => "Jacob Lew"
# }
```

### Final Thoughts

To learn more about JSON, take a look at [Copter Labs' post](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/), [Hack Hands' post](https://hackhands.com/ruby-read-json-file-hash/), or [Wikipedia's page](http://en.wikipedia.org/wiki/JSON).

## Instructions

This lab is test-driven so just run the testing suite to get started. The datasets you'll be reading are in `spec/fixtures`.

## Resources

* [Wikipedia](http://en.wikipedia.org/) - [JSON](http://en.wikipedia.org/wiki/JSON)
* [Copter Labs](http://www.copterlabs.com/) - [What is JSON](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/)
* [Hack Hands](https://hackhands.com/)- [Reading JSON in Ruby](https://hackhands.com/ruby-read-json-file-hash/)
* [Ruby Monk](http://rubymonk.com/) - [String Manipulation](http://rubymonk.com/learning/books/1/chapters/5-strings/lessons/8-string-advanced)
* [Rubular](http://rubular.com/) - [Regex Evaluator](http://rubular.com/)
