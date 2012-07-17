require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "order_new" do
    mail = OrderNotifier.order_new
    assert_equal "Order new", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
