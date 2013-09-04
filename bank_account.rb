require 'minitest/autorun'

class BankAccountTest < Minitest::Unit::TestCase

  def test_initial_balance
    account = BankAccount.new
    assert_equal 0, account.balance
  end

  def test_optional_initial_balance
    account = BankAccount.new(100)
    assert_equal 100, account.balance
  end

  def test_deposit
    account = BankAccount.new(100)
    account.deposit 500
    assert_equal 600, account.balance
  end

  def test_withdrawal
    account = BankAccount.new(100)
    account.deposit 500
    account.withdrawal 100
    assert_equal 500, account.balance
  end

  def test_transfer
    checking = BankAccount.new(100)
    savings = BankAccount.new(100)
    checking.deposit 500
    checking.transfer_to(savings, 200)
    assert_equal 400, checking.balance
    assert_equal 300, savings.balance
  end

end

