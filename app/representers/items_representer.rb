class ItemsRepresenter
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def as_json
    items.map do |item|
      {
        id: item.id,
        code: item.code,
        name: item.name,
        price: "#{format('%.2f', item.price)}#{item.currency}"
      }
    end
  end

end