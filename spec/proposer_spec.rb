describe Proposer do
  subject(:proposer) { described_class.new() }

  preferences_A = [[2, 3, 1, 5, 4],
                  [5, 4, 3, 0, 2],
                  [1, 3, 4, 0, 5],
                  [4, 1, 2, 5, 0],
                  [2, 0, 1, 3, 5],
                  [4, 0, 2, 3, 1]]

  proposals_A = [[3, 1, 5],
                [5, 4, 3, 0, 2],
                [1, 3, 4],
                [4, 1, 2, 5, 0],
                [2, 1, 3],
                [0, 3, 1]]

  preference_B = [[1, 3, 5, 2, 4],
                  [3, 4, 5, 0, 2],
                  [3, 4, 5, 0, 1],
                  [5, 2, 0, 4, 1],
                  [5, 2, 3, 1, 0],
                  [0, 1, 3, 2, 4]]

  proposals_B = [[1, 5],
                 [4, 5, 0],
                 [3, 4],
                 [5, 2],
                 [2, 1],
                 [0, 1, 3]]

  describe 'propose' do

    it 'performs the proposal correctly' do
      expect(proposer.propose(preferences_A)).to eq(proposals_A)
    end

    it 'performs the proposal correctly in another scenario' do
      expect(proposer.propose(preference_B)).to eq(proposals_B)
    end

  end

end
