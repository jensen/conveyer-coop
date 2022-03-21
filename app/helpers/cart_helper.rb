module CartHelper
  def current_cart
    if session[:cart_id].nil?
      cart = Cart.create(user_id: session[:user_id])
      session[:cart_id] = cart.id
      cart
    else
      Cart.find(session[:cart_id])
    end
  end

  def reset_cart
    if session[:cart_id]
      cart = Cart.create(user_id: session[:user_id])
      session[:cart_id] = cart.id
    end
  end
end
