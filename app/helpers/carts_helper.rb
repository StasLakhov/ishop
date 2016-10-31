module CartsHelper
  def cart_partial
    @products.empty? ? 'empty' : 'list'
  end
end