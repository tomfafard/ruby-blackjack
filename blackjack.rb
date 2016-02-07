#!/usr/bin/env ruby
require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

deck = Deck.new
player_hand = Hand.new(deck.deal(2))
player_hand.calculate_score


puts
puts "Welcome to Blackjack!"
puts

puts "#{player_hand.card_titles.join(" ")}"
#^Displays cards with their respective suits and ranks
puts "Player Score: #{player_hand.score}"
while player_hand.score <= 21
  puts
  puts "Would you like to hit or stand? (H/S):"
  player_input = gets.chomp
    if player_input.downcase == 'h'
     player_hand.dealt_cards += deck.deal(1)
     player_hand.calculate_score
     puts "#{player_hand.card_titles.join(" ")}"
     puts "Player Score: #{player_hand.score}"
   elsif player_input.downcase == 's'
     break
   end
end


if player_hand.score >= 22
 puts
 puts "Bust! You lose..."
 exit
end

puts
puts "#{player_hand.card_titles.join(" ")}"
puts "Player Score: #{player_hand.score}"
puts


dealer_hand = Hand.new(deck.deal(2))
dealer_hand.calculate_score


while dealer_hand.score < 17 do
  dealer_hand.dealt_cards += deck.deal(1)
  dealer_hand.calculate_score
end

puts "#{dealer_hand.card_titles.join(" ")}"
puts "Dealer Score: #{dealer_hand.score}"

if dealer_hand.score >= 17 && dealer_hand.score <= 21
  puts
  puts "Dealer stands."
end

if dealer_hand.score == player_hand.score
  puts
  puts "It's a tie."
end


if dealer_hand.score >= 22
  puts
  puts "Dealer busts! You Win!"
end

if dealer_hand.score <= 21
  if dealer_hand.score > player_hand.score
    puts
    puts "Dealer Wins!"
  elsif dealer_hand.score < player_hand.score
    puts
    puts "Player Wins!"
  end
end
