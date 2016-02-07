require_relative "deck"
require_relative "card"

class Hand
 attr_accessor :score, :dealt_cards, :card_titles

 def initialize(dealt_cards)
   @dealt_cards = dealt_cards
 end

 def calculate_score
   @card_titles = []
   @dealt_cards.each do |card|
     @card_titles.push(card.title)
   end
   #^Appends each new card from hit to the card_titles array.
   #This is what will be used to display the cards' suits+ranks on screen.
   @score = 0
   @dealt_cards.reverse!
   @dealt_cards.each do |card|
     if card.facecard? == true
       @score += 10
     elsif card.ace? == true
       if @score <= 10
         @score += 11
       else
         @score += 1
       end
     else
       @score += card.rank
     end
   end
 end
end
