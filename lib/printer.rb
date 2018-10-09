require "time"

class Printer

  attr_reader :header, :date, :statement

  def initialize
    @header = "Date || Credit || Debit || Balance"
    @statement = []
  end

  def print_statement(transactions)
    @statement << header
    transactions.reverse_each do |transaction|
      @statement << formatter(transaction)
    end
    puts @statement.join("\n")
  end

  private

  def formatter(transaction)
    transaction.map do |_key, value|
      value.instance_of?(Time) ? value.strftime("%d/%m/%Y") : value
    end.join(' || ')
  end
end
