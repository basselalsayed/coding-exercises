require 'player'

describe Player do 
  let(:deck) { double(:deck, cards: ["two"]) }
  let(:subject) { described_class.new("test") }

  describe '#initialization' do 
    it { expect(subject.hand).to eq [] }
  end

  describe '#draw' do 
    before do 
      subject.draw(deck)
    end
    it 'draws a card and adds to the hand' do 
      expect(subject.hand.length).to eq 1
    end
    it 'removes the card from the deck' do 
      expect(deck.cards.length).to eq 0
    end
  end

  describe '#score' do 
    it 'calculates the score of a hand' do 
      subject.draw(deck)
      expect(subject.score).to eq 2
    end
  end
end