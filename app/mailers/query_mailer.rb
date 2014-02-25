class QueryMailer < ActionMailer::Base
  default from: "robot@ludihoroshie.ru"
  
  def new_query(query)
    @query = query
    mail(to: 'ludihoroshie@gmail.com', subject: 'Заявка на звонок')
  end
end
