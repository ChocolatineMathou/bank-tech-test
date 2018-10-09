describe "Feature: deposit" do

  let(:operation) { Operation.new }

  it "when a user makes a deposit, it updates the balance" do
    expect { operation.deposit(900) }.to change { operation.balance }.by(900)
  end
end
