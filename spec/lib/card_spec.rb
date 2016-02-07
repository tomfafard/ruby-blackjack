require_relative "../../card"

describe Card do
  describe ".new" do
    it "should take a rank and suit as inputs" do
      card = Card.new('♠', 10)
      expect(card).to be_a(Card)
    end
  end


  describe '#ace?' do
    it "should return true if rank is an ace" do
      card = Card.new('♠', 'A')
      expect(card.ace?).to eq(true)
    end

    it "should return false if rank is not an ace" do
      card = Card.new('♠', 'J')
      expect(card.ace?).to eq(false)
    end
  end


  describe '#facecard?' do
    it "should return true if rank is a face card" do
      card = Card.new('♠', 'J')
      expect(card.facecard?).to eq(true)
    end

    it "should return false if rank is not a face card" do
      card = Card.new('♠', 5)
      expect(card.facecard?).to eq(false)
    end
  end
end
