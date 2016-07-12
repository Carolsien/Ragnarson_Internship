class FetchBasket
  def call
    BASKET.map do |basket|
      {
        product: basket.all,
        quantity: basket.quantity
      }
    end
  end
end
