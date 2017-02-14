require "sinatra"

def count_vowels(name)
  vow = name.scan(/[aeoui]/).count
  p "My name is #{name} and it has #{vow} vowels"
end

get "/" do
  count_vowels("Juan Felipe")
end