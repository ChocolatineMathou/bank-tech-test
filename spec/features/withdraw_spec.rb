describe "Feature: deposit" do

  let(:operation) { Operation.new }

  before do
    operation.deposit(600)
  end

  it "when a user wants to withdraw money, it updates the balance" do
    expect { operation.withdraw(500) }.to change { operation.balance }.by(-500)
  end

  it "does not allow a user to withdraw more than one has" do
    expect { operation.withdraw(700) }.to raise_error("Cannot withdraw: Insufficient funds!")
  end
end
