class PizzaStore
  attr_accessor :pizza_prototype_collection

  def initialize
    @pizza_prototype_collection = []
  end

  def take_order(pizza_type)
    pizza_prototype = pizza_prototype_collection[pizza_type]
    raise 'unsupported pizza type' unless pizza_prototype

    pizza = pizza_prototype.clone
    pizza.bake
    pizza
  end
end