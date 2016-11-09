class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'givi_green@list.ru',
    subject: 'product was added' )
  end

  def product_ordered(user_mail)
    @user_mail = user_mail
    mail(to: @user_mail, subject: 'sample Email')
  end

end
