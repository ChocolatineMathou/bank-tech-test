describe "Feature: print statement" do

  let(:operation) { Operation.new }

  before do
    operation.deposit(40)
    operation.withdraw(30)
    operation.deposit(10)
    operation.printer.print_statement(operation.account)
  end

  it "prints a readable statement" do
    expect { puts operation.printer.statement }.to output("Date || Credit || Debit || Balance\n"\
      "09/10/2018 || 10 ||  || 20.0\n"\
      "09/10/2018 ||  || 30 || 10.0\n"\
      "09/10/2018 || 40 ||  || 40.0\n").to_stdout
  end
end
