require 'operation'

describe Operation do

  let(:operation) { described_class.new(0.00, date, printer) }
  let(:date) { Time.new(2018, 10, 9) }
  let(:printer) { double :printer }

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

    context "Amount is not an integer with 2 decimal digits max" do
      it "does not allow to submit a string" do
        expect { operation.deposit("string") }.to raise_error("Cannot make this operation: Amount needs to be a float")
      end

      it "does not allow to submit an amount with more than 2 decimal digits" do
        expect { operation.deposit(30.003) }.to raise_error("Cannot make this operation: less than 2 decimal digits allowed!")
      end
    end

  end

  context "Sufficient funds" do
    describe "#withdraw" do
      context "Sufficient funds" do
        it "allows a user to withdraw money" do
          operation.deposit(40)
          expect(operation.withdraw(30)).to eq([{ :date => "09/10/2018",
            :credit => 40, :debit => "", :balance => 40.0 },
            { :date => "09/10/2018", :credit => "", :debit => 30,
              :balance => 10.0 }])
        end
      end

      context "Insufficient funds" do
        it "does not allow a user to withdraw more than one has" do
          expect { operation.withdraw(40) }.to raise_error("Cannot withdraw: Insufficient funds!")
        end
      end

      context "Amount is not an integer with 2 decimal digits max" do
        it "does not allow to submit a string" do
          expect { operation.withdraw("string") }.to raise_error("Cannot make this operation: Amount needs to be a float")
        end

        it "does not allow to submit an amount with more than 2 decimal digits" do
          operation.deposit(300)
          expect { operation.withdraw(30.003) }.to raise_error("Cannot make this operation: less than 2 decimal digits allowed!")
        end
      end
    end
  end

  describe "#bank_statement" do
    it "calls #print_statement from Printer" do
      statement = []
      expect(printer).to receive(:print_statement).with(statement)
      operation.bank_statement
    end
  end
end
