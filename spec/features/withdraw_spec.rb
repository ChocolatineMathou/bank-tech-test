describe "Feature: deposit" do

  let(:operation) { Operation.new }

  it "when a user makes a deposit, it updates the balance" do
    expect { operation.withdraw(500) }.to change { operation.balance }.by(-500)
  end
end
