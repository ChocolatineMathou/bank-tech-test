require 'operation'

describe Operation do

  let(:operation) { described_class.new(date) }
  let(:date) { Time.now }

  describe '#deposit' do
    it 'allows a user to make a deposit' do
      expect(operation.deposit(20)).to eq([{:date => '08/10/2018',
        :credit => 20, :debit => 0, :balance => 20}])
    end
  end

  describe '#withdraw' do
    it 'allows a user to withdraw money' do
      expect(operation.withdraw(30)).to eq([{:date => '08/10/2018',
        :credit => 0, :debit => 30, :balance => 30}])
    end
  end
end
