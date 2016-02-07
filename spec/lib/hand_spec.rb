require_relative "../../card"
require_relative "../../deck"
require_relative "../../hand"


describe Hand do
  let(:hand) {Hand.new([Card.new('♦', 'A'), Card.new('♦', 'A')])}

  describe "#calculate_score" do
    it "should add the cards to get a score" do
      hand.calculate_score

      expect(hand.score).to eq(12)
    end

    it "an ace should not equal 11 if score > 10" do
      hand.calculate_score

      expect(hand.score).to be <= 21
    end

    it "2 aces should not equal 22" do
      hand.calculate_score

      expect(hand.score).to be <= 21
    end
  end
end
