class Pizza
  attr_reader :name, :toppings, :state

  def initialize(name, toppings)
    @name = name
    @toppings = toppings
    @state = 'raw'
  end

  def bake
    puts "Baking #{name}"
    state = 'baked'
  end
end