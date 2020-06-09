require_relative 'rental_plan/day_range'
require_relative 'rental_plan/hour_range'
require_relative 'rental_plan/metadata'

class RentalPlan

  def self.build(name)
    build_metadata name
    build_list_of_ranges
    new @metadata, @ranges
  end

  def self.build_metadata(name)
    @metadata = Metadata.new(name)
  end

  attr_reader :ranges

  def initialize(metadata, ranges)
    @metadata = metadata
    @ranges = ranges
  end

  def self.build_list_of_ranges
    @ranges = [ DayRange.build ]
  end

  def name
    @metadata.name
  end
end