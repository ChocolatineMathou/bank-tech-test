require 'operation'

describe Operation do

  let(:operation) { described_class.new(0.00, date) }
  let(:date) { Time.new(2018, 10, 9) }

  describe ".new" do
    it "initializes with a balance equal to zero" do
      expect(operation.balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "allows a user to make a deposit" do
      expect(operation.deposit(20)).to eq([{ :date => "09/10/2018",
        :credit => 20, :debit => "", :balance => 20.0 }])
    end

    it "updates the balance when you make a deposit" do
      operation.deposit(400)
      expect(operation.deposit(60)).to eq([{ :date => "09/10/2018",
        :credit => 400, :debit => "", :balance => 400.0 },
        { :date => "09/10/2018", :credit => 60, :debit => "",
          :balance => 460.0 }])

    end
  end

  describe "#withdraw" do
    it "allows a user to withdraw money" do
      operation.deposit(40)
      expect(operation.withdraw(30)).to eq([{ :date => "09/10/2018",
        :credit => 40, :debit => "", :balance => 40.0 },
        { :date => "09/10/2018", :credit => "", :debit => 30,
          :balance => 10.0 }])
    end
  end
end
