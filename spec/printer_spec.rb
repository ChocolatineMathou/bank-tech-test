require 'printer'

describe Printer do
  let(:printer) { described_class.new }
  let(:date) { Time.new(2018, 10, 9) }
  let(:transactions) { [{ :date => date, :credit => 40.0, :debit => "",
    :balance => 40.0 }, { :date => date, :credit => "", :debit => 30.0,
    :balance => 10.0 }]
  }

  describe ".header" do
    it "prints the header of the bank statement" do
      expect(printer.header).to eq("Date || Credit || Debit || Balance")
    end
  end

  describe "#print_statement" do
    it "formates the statement" do
      statement = "Date || Credit || Debit || Balance\n09/10/2018 ||  || 30.0 || 10.0\n09/10/2018 || 40.0 ||  || 40.0\n"
      expect { printer.print_statement(transactions) }.to output(statement).to_stdout
    end
  end

end
