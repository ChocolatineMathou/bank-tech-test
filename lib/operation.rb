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
    @balance += amount
    @account += [{ date: @date, credit: amount, debit: "", balance: @balance }]
  end

  def withdraw(amount)
    raise "Insufficient funds!" if @balance < amount
    @balance -= amount
    @account += [{ date: @date, credit: "", debit: amount, balance: @balance }]
  end

  def bank_statement
    print @printer.print_statement(@account)
  end

end
