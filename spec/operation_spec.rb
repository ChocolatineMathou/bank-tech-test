require 'operation'

describe Operation do

  let(:operation) { described_class.new(date) }
  let(:date) { Time.now }

  describe '#deposit' do
    it 'allows a user to make a deposit' do
      expect(operation.deposit(20)).to eq(['08/10/2018 || 20 || || 20'])
    end
  end
end
