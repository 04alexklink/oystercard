class Oystercard
attr_reader :balance
LIMIT = 90
MINIMUM = 1

def initialize 
  @balance = 0
  @in_journey = false
end

def top_up(amount)
  fail "Cannot top up over £#{LIMIT}" if (amount + @balance) > LIMIT
  @balance += amount
end

def deduct(amount)
  @balance -= amount
end

def touch_in
  fail "DENIED!!!! balance under £#{MINIMUM}" if @balance < MINIMUM
  @in_journey = true
end

def touch_out
  @in_journey = false
end

def in_journey?
  @in_journey
end

end