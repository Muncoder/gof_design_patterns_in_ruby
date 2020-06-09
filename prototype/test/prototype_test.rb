require_relative '../lib/pizza_store'
require_relative '../lib/pizza'

store = PizzaStore.new
matcha_pizza_prototype = Pizza.new('Matcha Pizza', ['matcha powder'])
store.pizza_prototype_collection['matcha'] = matcha_pizza_prototype
puts store.pizza_prototype_collection

matcha_pizza = store.take_order('matcha')
