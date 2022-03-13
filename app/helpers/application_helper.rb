module ApplicationHelper
  def format_price(price)
    "$%.2f" % (price/100.00)
  end
end
