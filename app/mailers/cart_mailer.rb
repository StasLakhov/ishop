class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'givi_green@list.ru',
    subject: 'product was added' )
  end

end
