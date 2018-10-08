class Printer

  attr_reader :header

  def initialize
    @header = ['Date || Credit || Debit || Balance']
  end
end
