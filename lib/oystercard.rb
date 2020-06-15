class Oystercard
attr_reader :balance
LIMIT = 90

def initialize 
  @balance = 0
end

def top_up(amount)
  fail "Cannot top up over £#{LIMIT}" if (amount + @balance) > LIMIT
  @balance += amount
end

end