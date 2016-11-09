class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'givi_green@list.ru',
    subject: 'product was added' )
  end

  def order(user_mail)
    @user_mail = user_mail
    mail(to: @user.email, subject: 'sample Email')
  end

end
