require "./lib/connection.rb"
require "./lib/anagram.rb"
require "sinatra"
require "pry"
require "mustache"
require "sinatra/flash"

enable :sessions

# display index

get "/" do
	anagrams = Anagram.all.to_ary
	index = File.read("index.html")
	Mustache.render(index, anagrams: anagrams)
end

# get add anagram form

get "/add_anagram" do
	File.read("add_anagram_form.html")
end

# add new anagram to database

post "/add_anagram" do
	word_one = params["word_one"]
	word_two = params["word_two"]

	word_one_array = word_one.downcase.delete(' ').split('').sort

	word_two_array = word_two.downcase.delete(' ').split('').sort

	if word_one_array == word_two_array
		Anagram.create({word_one: word_one, word_two: word_two})
		
		redirect "/"
	else
		# flash.next[:error] = "Sorry, those words aren't anagrams! <a href='/add_anagram'>Add Anagram Pair</a>"
		# flash[:error]
		redirect "/anagram_error"
	end
end

# display error when words are not anagrams

get "/anagram_error" do
	File.read("not_anagram.html")
end


