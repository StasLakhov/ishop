class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'givi_green@list.ru',
    subject: 'product was added' )
  end

  def order_ordered(user_mail)
    @user_mail = params[:email]
    mail(to: @user_email, subject: 'sample Email')
  end

end
