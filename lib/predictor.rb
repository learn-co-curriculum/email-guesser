require 'json'

class Predictor
  attr_reader :data, :lookup_hash
  attr_accessor :first_name, :last_name

  PATTERNS = ["full_full", "initial_full", "full_initial", "initial_initial"]
  
  def initialize(path_to_file)
    file = File.read(path_to_file)
    @data = JSON.parse(file)
    @lookup_hash = analyze_data
    @first_name = ""
    @last_name = ""
    @current_company = ""
  end

  def analyze_data
    lookup_hash = {}
    data.each do |full_name, email|
      @first_name, @last_name = get_names(full_name)
      template, domain = email.split("@")
      lookup_hash[domain] = get_pattern(template)
    end
    lookup_hash
  end

  def email_formatter(address, domain)
    "#{address}@#{domain}"
  end

  def guess(full_name, domain)
    guess = []
    @first_name, @last_name = get_names(full_name)
    pattern = lookup_hash[domain]
    if pattern
      address = self.send(pattern)
      guess << email_formatter(address, domain)
    else
      PATTERNS.each do |pattern| 
        address = self.send(pattern)
        guess << email_formatter(address, domain)
      end
    end
    guess
  end

  def get_names(full_name)
    full_name.downcase.split(" ")
  end

  def get_pattern(template)
    PATTERNS.each do |pattern|
      return pattern if self.send(pattern) == template
    end
  end

  def full_full
    "#{first_name}.#{last_name}"
  end

  def initial_full
    "#{first_name[0]}.#{last_name}"
  end

  def full_initial
    "#{first_name}.#{last_name[0]}"
  end

  def initial_initial
    "#{first_name[0]}.#{last_name[0]}"
  end

end
