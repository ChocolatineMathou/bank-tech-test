class Operation

  attr_reader :date, :account

  def initialize(date = Time.now)
    @date = date.strftime('%d/%m/%Y')
    @account = []
  end

  def deposit(amount)
    @account += [{date: @date, credit: amount, debit: 0, balance: amount}]
  end

  def withdraw(amount)
    @account += [{date: @date, credit: 0, debit: amount, balance: amount}]
  end
end
