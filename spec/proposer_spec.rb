describe Proposer do
  subject(:proposer) { described_class.new() }

  preferences = [[2, 3, 1, 5, 4],
                 [5, 4, 3, 0, 2],
                 [1, 3, 4, 0, 5],
                 [4, 1, 2, 5, 0],
                 [2, 0, 1, 3, 5],
                 [4, 0, 2, 3, 1]]

  proposals = [[3, 1, 5],
               [5, 4, 3, 0, 2],
               [1, 3, 4],
               [4, 1, 2, 5, 0],
               [2, 1, 3],
               [0, 3, 1]]

  describe 'propose' do

    it 'performs the proposal correctly' do
      expect(proposer.propose(preferences)).to eq(proposals)
    end


  end

end
