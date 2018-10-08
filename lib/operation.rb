class Operation

  attr_reader :date, :account

  def initialize(date = Time.now)
    @date = date.strftime('%d/%m/%Y')
    @account = []
  end

  def deposit(amount)
    @account << "#{@date} || #{amount} || || #{amount}"
  end
end
