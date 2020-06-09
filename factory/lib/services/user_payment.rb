class UserPaymentService
  attr_reader :name

  def pay user, amount
    raise ForbiddenAccessError, "This user can not perform payments."
  end
end