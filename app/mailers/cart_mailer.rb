class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'givi_green@list.ru',
    subject: 'product was added' )
  end

#  def product_ordered(user_email)
#    @user_mail = user_email
#    mail(to: @user_mail, subject: 'sample Email')
#  end

  def product_ordered(user_email)
    @user_mail = user_email
    mail(to: @user_mail,
         body: 'mail.body',
         content_type: 'text/html',
         subject: 'Already rendered!')
  end

end

