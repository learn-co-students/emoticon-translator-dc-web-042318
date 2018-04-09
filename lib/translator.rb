# require modules here
require "yaml"
require "pry"

def load_library(yaml_file)
  # code goes here
  library = YAML.load_file(yaml_file)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  library.each do |index, symbols|
    new_hash["get_meaning"][symbols[1]] = index
    new_hash["get_emoticon"][symbols[0]] = symbols[1] 
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, string)
  # code goes here
  symbols = load_library(yaml_file)
  if symbols["get_emoticon"].has_key?(string) 
    string = symbols["get_emoticon"][string]
  else
    string = "Sorry, that emoticon was not found"
  end
  string
end

def get_english_meaning(yaml_file, string)
    # code goes here
    symbols = load_library(yaml_file)
    if symbols["get_meaning"].has_key?(string) 
      string = symbols["get_meaning"][string]
    else
      string = "Sorry, that emoticon was not found"
    end
    string
  end