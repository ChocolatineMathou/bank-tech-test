require 'printer'

describe Printer do
  let(:printer) { described_class.new }

  describe '.header' do
    it "prints the header of the bank statement" do
      expect(printer.header).to eq(['Date || Credit || Debit || Balance'])      
    end
  end

end
