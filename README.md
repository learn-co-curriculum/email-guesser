---
tags: logic, comp sci, computer science, string manipulation, bonus
languages: ruby
resources: 2
---
# Email Address Predictor

## Background 

You're working for a flower marketing company and your job is to guess people's email addresses when given their full name and the domain name of the company they work for so you can send them coupons for holiday bouquets, etc.

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

So, if you have several other people in yo that work for "wiser.com", you can use their info to predict Jahmil Eady's email address.

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

This lab is test-driven so just run `rspec` to get started.

## Resources
* [Ruby Monk](http://rubymonk.com/) - [String Manipulation](http://rubymonk.com/learning/books/1/chapters/5-strings/lessons/8-string-advanced)
* [Rubular](http://rubular.com/) - [Regex Evaluator](http://rubular.com/)
