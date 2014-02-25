class OrderMailer < ActionMailer::Base
  default from: "robot@ludihoroshie.ru"
  
  def new_order(order)
    @order = order
    mail(to: 'ludihoroshie@gmail.com', subject: 'Новый заказ')
  end
end
