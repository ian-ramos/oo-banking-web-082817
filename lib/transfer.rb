class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @initial_amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? && self.status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      sender.balance += @amount
      receiver.balance -= @amount
    end
  end

end
