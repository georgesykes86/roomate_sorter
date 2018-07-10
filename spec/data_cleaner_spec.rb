describe Datacleaner do
  subject(:datacleaner) { described_class.new() }

  non_zero_indexed_data = [
    [2, 3, 4],
    [1, 3, 4],
    [1, 2, 4],
    [1, 2, 3]
  ]

  zero_indexed_data = [
    [1, 2, 3],
    [0, 2, 3],
    [0, 1, 3],
    [0, 1, 2]
  ]

  describe 'zero_index' do

    it 'zeroindexes the data when not zero indexed' do
      expect(datacleaner.zero_index(non_zero_indexed_data)).to eq(zero_indexed_data)
    end

    it 'does not zero index when it has already been done' do
      expect(datacleaner.zero_index(zero_indexed_data)).to eq(zero_indexed_data)
    end
  end

end
