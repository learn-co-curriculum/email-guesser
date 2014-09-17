require_relative "dataset.json"
require 'json'

class Predictor
  attr_reader :data
  attr_accessor :lookup_hash

  def intialize
    @lookup_hash = {}
    file = File.read('./dataset.json')
    data = JSON.parse(file)
  end

  def analyze_data

  end

  def initial_last_name(name)

  end

  def initial_initial(name)

  end

  def first_name_initial(name)

  end

  def first_name_last_name(name)

  end
  
end