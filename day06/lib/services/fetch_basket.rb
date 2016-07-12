class FetchBasket
  def call
    BASKET.map do |basket|
      {
        product: basket.all,
        quantity: basket.quantity,
        total_price: basket.total_price
      }
    end
  end
end
