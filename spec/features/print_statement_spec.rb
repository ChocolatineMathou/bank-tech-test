describe "Feature: print statement" do

  let(:operation) { Operation.new }

  before do
    allow(Time).to receive(:new).and_return(Time.mktime(2018, 10, 9))
    operation.deposit(40)
    operation.withdraw(30)
    operation.deposit(10)
  end

  it "prints a readable statement" do
    expect { operation.bank_statement }.to output(
      "Date || Credit || Debit || Balance\n"\
      "09/10/2018 || 10 ||  || 20.0\n"\
      "09/10/2018 ||  || 30 || 10.0\n"\
      "09/10/2018 || 40 ||  || 40.0\n").to_stdout
  end
end
