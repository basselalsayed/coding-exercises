require 'deck'

describe Deck do 

  describe '#initialization' do 
    it { expect(subject.cards.length).to eq 52 }
  end

  describe '#draw' do 
    it 'removes one card from the deck when a player draws' do 
      expect{ draw }.to change{ subject.cards.length }.by -1
    end

    it 'removes cards until there are none left' do 
      52.times { draw }
      expect(subject.cards.length).to eq 0
    end
  end

  def draw
    subject.cards.delete_at(rand(subject.cards.length))
  end
end


