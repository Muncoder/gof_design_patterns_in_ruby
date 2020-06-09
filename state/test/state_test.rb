require 'minitest/autorun'
require_relative '../lib/car_installation_line'
require_relative '../lib/engine_installation'
require_relative '../lib/hood_installation'
require_relative '../lib/wheels_installation'
require_relative '../exceptions/illegal_jump'

describe CarProductionLine do
  let(:production_line) { CarProductionLine.new }

  it "starts with the engine" do
    production_line.state.class.must_equal EngineInstallationState
  end

  it "installs the hood after the engine" do
    production_line.move_to! :hood
    production_line.state.class.must_equal HoodInstallationState
  end

  it "can't jump to the wheels right after the engine" do
    -> { production_line.move_to! :wheels }.must_raise IllegalStateJumpError
  end
end