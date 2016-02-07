class Card
 attr_accessor :suit, :rank, :title

 def initialize(suit,rank)
   @suit = suit
   @rank = rank
   @title = "#{rank}#{suit}"
 end

 def ace?
   if @rank == "A"
     true
   else
     false
   end
 end

 def facecard?
   if @rank == "J" || @rank == "Q" || @rank == "K"
     true
   else
     false
   end
 end
end
