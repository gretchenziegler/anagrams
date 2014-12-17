require "pry"
require './lib/connection.rb'
require './lib/anagram.rb'

word_one = ARGV[0]
word_two = ARGV[1]

word_one_array = word_one.downcase.delete(' ').split('').sort

word_two_array = word_two.downcase.delete(' ').split('').sort

if word_one_array == word_two_array
	Anagram.create({word_one: word_one, word_two: word_two})
	puts "#{word_one} and #{word_two} are anagrams of each other!"
else
	puts "Sorry, #{word_one} and #{word_two} are not anagrams of each other."
end