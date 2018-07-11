describe Selector do
  subject(:selector) {described_class.new()}

  preferences_A = [[3, 1, 5],
                [5, 4, 3, 0, 2],
                [1, 3, 4],
                [4, 1, 2, 5, 0],
                [2, 1, 3],
                [0, 3, 1]]

  selections_A = [5,3,4,1,2,0]

  preferences_B = [[1, 5],
                 [4, 5, 0],
                 [3, 4],
                 [5, 2],
                 [2, 1],
                 [0, 1, 3]]

  selections_B = [5,4,3,2,1,0]

  describe '#select' do

    it 'creates a selection when one is available' do
      expect(selector.select(preferences_A)).to eq(selections_A)
    end

    it 'creates a selection when one exists in another scenario' do
      expect(selector.select(preferences_B)).to eq(selections_B)
    end

  end

end
