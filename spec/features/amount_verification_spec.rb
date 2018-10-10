describe "Feature: two decimals? and money?" do
  let(:operation) { Operation.new }

  it "raises an error if user makes a deposit with a string" do
    expect { operation.deposit("string") }.to raise_error("Cannot make this operation: Amount needs to be a float")
  end

  it "raises an error if user wants to withdraw a string" do
    expect { operation.withdraw("string") }.to raise_error("Cannot make this operation: Amount needs to be a float")
  end

  it "raises an error if user makes a deposit more than 2 decimal digits" do
    expect { operation.deposit(7.192) }.to raise_error("Cannot make this operation: less than 2 decimal digits allowed!")
  end

  it "raises an error if user wants to withdraw an amount with more than 2 decimal digits" do
    expect { operation.withdraw(7.192) }.to raise_error("Cannot make this operation: less than 2 decimal digits allowed!")
  end
end
