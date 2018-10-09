require 'operation'

describe Operation do

  let(:operation) { described_class.new(balance = 0.00, date) }
  let(:date) { Time.new(2018, 10, 9) }

  describe ".new" do
    it "initializes with a balance equal to zero" do
      expect(operation.balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "allows a user to make a deposit" do
      expect(operation.deposit(20)).to eq([{ :date => "09/10/2018",
        :credit => 20, :debit => "", :balance => 20 }])
    end
  end

  describe "#withdraw" do
    it "allows a user to withdraw money" do
      expect(operation.withdraw(30)).to eq([{ :date => "09/10/2018",
        :credit => "", :debit => 30, :balance => -30 }])
    end
  end
end
