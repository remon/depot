class OrderNotifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.order_new.subject
  #
  def order_new(order)
    @order=order

    mail :to => "remmony@gmail.com",:subject=>"new order"
  end
end
