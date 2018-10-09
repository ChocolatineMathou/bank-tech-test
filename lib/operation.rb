require_relative 'printer'

class Operation

  attr_reader :date, :account, :balance

  def initialize(balance = 0.00, date = Time.new)
    @date = date.strftime('%d/%m/%Y')
    @account = []
    @balance = balance
  end

  def deposit(amount)
    p @date
    @balance =+ amount
    @account += [{ date: @date, credit: amount, debit: "", balance: @balance }]
  end

  def withdraw(amount)
    @balance =- amount
    @account += [{ date: @date, credit: "", debit: amount, balance: @balance }]
  end
end
