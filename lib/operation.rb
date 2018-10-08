class Operation

  attr_reader :date, :account

  def initialize(date = Time.now)
    @date = date.strftime('%d/%m/%Y')
    @account = []
  end

  def deposit(amount)
    @account += [@date, amount, nil, amount]
  end

  def withdraw(amount)
    @account += [@date, nil, amount, amount]
  end
end
