require_relative "printer"

class Operation

  attr_reader :balance, :printer

  def initialize(balance = 0.00, date = Time.new, printer = Printer.new)
    @date = date.strftime("%d/%m/%Y")
    @account = []
    @balance = balance
    @printer = printer
  end

  def deposit(amount)
    raise "Cannot make this operation: Amount needs to be a float" if money?(amount)
    raise "Cannot make this operation: less than 2 decimal digits allowed!" if two_decimals?(amount)

    @balance += amount
    @account += [{ date: @date, credit: amount, debit: "", balance: @balance }]
  end

  def withdraw(amount)
    raise "Cannot make this operation: Amount needs to be a float" if money?(amount)
    raise "Cannot make this operation: less than 2 decimal digits allowed!" if two_decimals?(amount)
    raise "Cannot withdraw: Insufficient funds!" if insufficient_funds?(amount)

    @balance -= amount
    @account += [{ date: @date, credit: "", debit: amount, balance: @balance }]
  end

  def bank_statement
    print @printer.print_statement(@account)
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end

  def two_decimals?(amount)
    amount != amount.round(2)
  end

  def money?(amount)
    amount != amount.to_f
  end
end
